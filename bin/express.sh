#!/bin/bash 

chmod 755 client.sh

cd ~/react-shell-tests

mkdir appname 

cd appname

npm init -y

npm install express dotenv mongoose

touch index.js

mkdir routes 

mkdir controllers 

cd controllers 

touch application.js

echo "const applicationController = {
    index: (req, res) => {
        res.send('Hey whats up this is app index')
    }
}

module.exports = applicationController" > application.js

cd ..

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
const mongoose = require('mongoose');
const app = express();
const routes = require('./routes/index')

app.use(express.urlencoded({ extended: true }));
app.use(express.json());
app.use('/', routes)

const PORT = process.env.PORT || 3001;
app.listen(PORT, () => {
  console.log('Magic happening on port ' + PORT);
})" > index.js 

