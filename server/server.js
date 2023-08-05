const express = require('express');
const axios = require('axios');
const cors = require('cors');
const app = express();

app.use(cors());
const port = 3000;

app.use(express.json());

// Add the following middleware to enable CORS
app.use((req, res, next) => {
  res.header('Access-Control-Allow-Origin', '*');
  res.header('Access-Control-Allow-Methods', 'GET, PUT, PATCH, POST, DELETE');
  res.header('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Accept');
  next();
});
// const apiKey = req.body.apiKey;
// const origin =req.body.origin; // Colombo, Sri Lanka
// const destination =req.body.destination; 
// Define a route to handle the Directions API request
app.post('/directions', async (req, res) => {
  try {
    const apiKey = req.body['apiKey'];
const origin = '6.1667,80.7500'; // Colombo, Sri Lanka
const destination = '7.316667,81.216667'; // Kandy, Sri Lanka
console.log(req.body);
const response = await axios.get('https://maps.googleapis.com/maps/api/directions/json', {
  params: {
    origin,
    destination,
    mode: 'driving',
    avoidHighways: false,
    avoidFerries: true,
    avoidTolls: false,
    key: apiKey,
  },
});
console.log(response.data);
    res.json(response.data);
  } catch (error) {
    console.error('Error fetching directions:', error.message);
    res.status(500).json({ error: 'An error occurred while fetching directions' });
  }
});

// Start the server
app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});



