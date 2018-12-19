require('dotenv').config();
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
})
