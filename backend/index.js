const express = require("express")
var cors = require('cors')
const path = require("path")
require('dotenv').config();

const app = express();
app.use(cors({
  origin: function (origin, callback) {
    // Check if the origin is allowed (e.g., all origins with port 8080)
    if (!origin || origin.endsWith(":8080")) {
      callback(null, true); // Allow the request
    } else {
      callback(new Error("Not allowed by CORS")); // Block the request
    }
  },
  methods: ["GET", "POST", "PUT", "DELETE"], // Allow specified HTTP methods
  allowedHeaders: ['Content-Type', 'Authorization'] // Allow specified headers
}));

// app.use(cors());

// app.options('*', cors());

// app.use((req, res, next) => {
//   res.setHeader('Access-Control-Allow-Headers', 'Content-Type');
//   next();
// });

// Statics
app.use(express.static('static'))

app.use(express.json()) // for parsing application/json
app.use(express.urlencoded({ extended: true })) // for parsing application/x-www-form-urlencoded

// routers
const indexRouter = require('./route/book')
// const blogRouter = require('./routes/blog')
const commentRouter = require('./route/comment')
const userRouter = require('./route/user')
const memberRouter = require('./route/member')

app.use(indexRouter.router)
app.use(memberRouter.router)
app.use(commentRouter.router)
app.use(userRouter.router)

app.listen(3001, () => {
  console.log(`Example app listening at http://localhost:3001`)
})
