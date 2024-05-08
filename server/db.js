const { Pool } = require('pg');

// Create a pool with environment variables
const pool = new Pool({
  // --- using connection string ---
  connectionString: process.env.POSTGRES_URL,

  // --- Traditional method ---
  // host: process.env.PGHOST,
  // database: process.env.PGDATABASE,
  // user: process.env.PGUSER,
  // password: process.env.PGPASSWORD,
  // ssl: {
  //   rejectUnauthorized: false,
  // },
  // sslmode: 'require',
});

const tableExists = async (client, name, query) => {
  const table = await client.query(`SELECT EXISTS (
        SELECT 1
        FROM pg_tables
        WHERE tablename = $1
    )`, [name]);
  if (!table.rows[0].exists) {
    await client.query(query);
    console.log(`Created ${name} table!`);
  }
}

// Connecting to PostgreSQL
pool.connect(async (err, client, done) => {
  if (err)
    return console.error('Error connecting to PostgreSQL:', err);
  console.log('Connected to PostgreSQL!');

  tableExists(
    client,
    'users',
    `CREATE TABLE users(
      id SERIAL PRIMARY KEY,
      name VARCHAR(20) NOT NULL,
      email VARCHAR(30) NOT NULL,
      phone NUMERIC(10) NOT NULL,
      password VARCHAR(100) NOT NULL,
      bio VARCHAR(100),
      status VARCHAR(50),
      profile_pic VARCHAR(100))`
  );

  tableExists(
    client,
    'messages',
    `CREATE TABLE messages (
      id SERIAL PRIMARY KEY,
      senderId INT NOT NULL,
      recipientId INT NOT NULL,
      content TEXT NOT NULL,
      timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
      FOREIGN KEY (senderId) REFERENCES users(id),
      FOREIGN KEY (recipientId) REFERENCES users(id));`
  );

});

module.exports = pool;