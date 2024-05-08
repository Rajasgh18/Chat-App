const Router = require('express').Router();
const { body } = require('express-validator');
const AuthController = require('../../controllers/authController');

Router
    // Create User
    .post('/signup', [
        body('name', 'Name is required and it should contain atleast 3 letters').notEmpty().isLength({ min: 3 }),
        body('email', 'Invalid email format').isEmail(),
        body('phone', 'Invalid phone format').isLength({ min: 10, max: 10 }),
        body('password').isLength({ min: 8 }).withMessage(`Password should be at least 8 characters long.`)
            .matches(/^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]+$/).withMessage("Password should contain an Alphabets, Special symbols and number")
    ], AuthController.signup)

    //Login User
    .post('/login', AuthController.login)

module.exports = Router;