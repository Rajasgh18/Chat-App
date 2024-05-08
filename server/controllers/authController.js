const { validationResult } = require('express-validator');

const bcrypt = require('bcrypt');
const JWT = require('jsonwebtoken');

const pool = require('../db');
const secretKey = process.env.SECRET_KEY;

const resend = require('../resend');

const AuthController = {
    async signup(req, res) {

        // Checking the condition for all fields
        const errors = validationResult(req);
        if (!errors.isEmpty()) return res.status(400).json({ errors: errors.array() })

        const { email, phone, password, name, profile_pic } = req.body;

        try {
            // Checking if the user already exists
            let user = await pool.query(`SELECT phone FROM users WHERE phone=$1`, [phone]);
            if (user.rows.length !== 0) return res.status(400).send("A user with this phone already exists");

            user = await pool.query(`SELECT phone FROM users WHERE email=$1`, [email]);
            if (user.rows.length !== 0) return res.status(400).send("A user with this email already exists");

            // Generating salt of 2^12 rounds
            const salt = await bcrypt.genSalt(12);

            // Hashing the password
            const hashedPassword = await bcrypt.hash(password, salt);

            // Saving the user
            const result = await pool.query(
                "INSERT INTO users (name, email, phone, password, profile_pic) VALUES ($1, $2, $3, $4, $5) RETURNING id, name, email, phone, profile_pic",
                [name, email, phone, hashedPassword, profile_pic]);
            user = result.rows[0];

            // Generating JWT Token
            const token = JWT.sign({ userId: user.id }, secretKey);

            // Sending Signup confirmation Email to the user
            resend.emails.send({
                from: 'onboarding@resend.dev',
                to: user.email,
                subject: 'Welcome to Our Platform!',
                html: `
                <p>Dear ${user.name},</p>

                <p>Thank you for signing up for <strong>Convo cove!</strong> We're excited to have you join our community.</p>

                <p>Your account has been successfully created, and you can now log in using the following credentials:</p>

                <p><strong>Phone number: ${user.phone}</strong></p>
                <p><strong>Email: ${user.email}</strong></p>

                <p>We're committed to providing you with a seamless and enjoyable experience on our platform. If you have any questions or need assistance, feel free to reach out to our support team.</p>

                <p>Best regards,</p>
                <p>Convo cove</p>
                `
            });
            res.status(200).json({ user, token });

        } catch (error) {
            res.status(500).send(error.message || "Unable to create a new user");
        }
    },

    async login(req, res) {
        try {
            // Checking if the user exists or not
            const result = await pool.query("SELECT * FROM users WHERE phone=$1", [req.body.phone]);
            if (result.rows.length === 0) return res.status(401).send("Incorrect phone number or password");

            // Checking the password
            const checkPassword = await bcrypt.compare(req.body.password, result.rows[0].password);
            if (!checkPassword) return res.status(401).send("Incorrect phone number or password")

            // Generating JWT token
            const token = JWT.sign({ userId: result.id }, secretKey);
            const { password, ...otherData } = result.rows[0];

            res.status(200).json({ user: otherData, token });
        } catch (error) {
            res.status(500).send(error.message || "Error while logging");
        }
    },

};

module.exports = AuthController;