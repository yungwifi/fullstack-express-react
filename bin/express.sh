#!/bin/bash 

APPNAME=${1?Error: no name given}

cd ../../

mkdir $APPNAME

cd $APPNAME

git init

npm init -y

npm i express dotenv mongoose

npm install concurrently --save

create-react-app client #CREATE REACT APP HERE

touch server.js

touch .env 

touch .gitignore 

echo ".env 
/node_modules" > .gitignore

echo "MONGODB_URI=mongodb://localhost/${APPNAME}" > .env

mkdir controllers 

cd controllers 

touch application.js

echo "const applicationController = {
    index: (req, res) => {
        res.send('Hey whats up this is the api index')
    }
}

module.exports = applicationController" > application.js

cd ..

mkdir routes 

cd routes 

touch index.js 

echo "const express = require('express')
const router = express.Router()
const applicationController = require('../controllers/application')

router.get('/', applicationController.index)

module.exports = router" > index.js

cd ..

echo "require('dotenv').config();
const express = require('express');
const app = express();
const routes = require('./routes/index')

app.use(express.urlencoded({ extended: true }));
app.use(express.json());

app.use(express.static(__dirname + '/client/build/'))

app.get('/', (req, res) => {
  res.sendFile(__dirname + '/client/build/index.html')
})

app.use('/api', routes)

const PORT = process.env.PORT || 3001;
app.listen(PORT, () => {
  console.log('Magic happening on port ' + PORT);
})" > server.js 

echo '{
  "name": "'$APPNAME'",
  "version": "1.0.0",
  "description": "",
  "main": "server.js",
  "scripts": {
    "start": "node server.js",
    "dev": "concurrently \"nodemon server.js\" \"cd ./client  && npm start \" ",
    "test": "echo \"Error: no test specified\" && exit 1",
    "postinstall": "cd client && npm install && npm run build"
  },
  "keywords": [],
  "author": "",
  "license": "ISC",
  "dependencies": {
    "dotenv": "^6.1.0",
    "express": "^4.16.4",
    "mongoose": "^5.3.14"
  },
  "engines": {
    "node": "10.13.0"
  }
}' > package.json 

mkdir db 

cd db 

touch connection.js 

echo "require('dotenv').config();
const mongoose = require('mongoose')

mongoose.connect(process.env.MONGODB_URI)

mongoose.connection.once('open', () => {
    console.log('Mongoose has connected to MongoDB')
})

mongoose.connection.on('error', (error) => {
    console.error('MongoDB connection error!!! ' + error)
    process.exit(-1)
})

module.exports = mongoose" > connection.js

cd ..

cd client 

echo '{
  "name": "client",
  "version": "0.1.0",
  "private": true,
  "proxy": "http://localhost:3001",
  "dependencies": {
    "react": "^16.6.1",
    "react-dom": "^16.6.1",
    "react-scripts": "2.1.1"
  },
  "scripts": {
    "start": "react-scripts start",
    "build": "react-scripts build",
    "test": "react-scripts test",
    "eject": "react-scripts eject"
  },
  "eslintConfig": {
    "extends": "react-app"
  },
  "browserslist": [
    ">0.2%",
    "not dead",
    "not ie <= 11",
    "not op_mini all"
  ]
}' > package.json

cd ..

heroku create 

heroku addons:create mongolab:sandbox

git add -A

git commit -m "Heroku Push"

git push heroku master