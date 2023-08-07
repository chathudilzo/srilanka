const express = require('express');
const axios = require('axios');


require('dotenv').config();

const app = express();
const port = process.env.PORT || 3000;

app.use(express.json());


const apiK = process.env.WEATHER_API_KEY;

app.get('/weather/:lat/:lon', async (req, res) => {
  const { lat, lon } = req.params;
  const latD=lat.replace(':','');
  const longD=lon.replace(':','');
  const apiKe=apiK.replace('"','').trim();
  const apiKeyy=apiKe.replace('"','').trim();
  const apiKey=apiKeyy.replace(',','').trim();

  console.log(latD+' '+longD+''+apiKey+'done');
  const apiUrl = `https://api.openweathermap.org/data/2.5/weather?lat=${latD}&lon=${longD}&appid=${apiKey}`;
console.log(apiUrl);
  try {
    const response = await axios.get(apiUrl);
    console.log('response:'+response.data);
    res.status(200).json(response.data);
  } catch (error) {
    res.status(500).json({ error: 'An error occurred while fetching weather data'+error });
  }
});


const apiKeyG = process.env.GOOGLE_MAP_API_KEY;
// Add the following middleware to enable CORS

// const apiKey = req.body.apiKey;
// const origin =req.body.origin; // Colombo, Sri Lanka
// const destination =req.body.destination; 
// Define a route to handle the Directions API request
//final String apiUrl = 'http://localhost:3000/directions/$destiLat/$destiLong$originLat$originLong';

app.post('/directions/:destiLat/:destiLong/:originLat/:riginLong', async (req, res) => {
 
 const params={destiLat,destiLong,originLat,riginLong}=req.params;
 
  try {
const origin = `${destiLat}+${destiLong}`; // Colombo, Sri Lanka
const destination = `${originLat},${riginLong}`; // Kandy, Sri Lanka
console.log(req.body);
const response = await axios.get('https://maps.googleapis.com/maps/api/directions/json', {
  params: {
    origin,
    destination,
    mode: 'driving',
    avoidHighways: false,
    avoidFerries: true,
    avoidTolls: false,
    key: apiKeyG,
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



