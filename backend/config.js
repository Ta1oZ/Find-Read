const mysql = require('mysql2/promise');

// const pool = mysql.createPool({
//   host: '127.0.0.1',
//   user: 'root',
//   password: 'NOLsvs28',
//   database: 'find-read',
//   waitForConnections: true,
//   connectionLimit: 10,
//   queueLimit: 0
// });

const pool = mysql.createPool({
  host: process.env.MYSQL_HOST,
  user: process.env.MYSQL_USER,
  password: process.env.MYSQL_PASSWORD,
  database: process.env.MYSQL_DATABASE,
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0
});

module.exports = pool;