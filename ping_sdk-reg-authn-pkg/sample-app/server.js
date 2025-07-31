const express = require("express");
const https = require('https');
const fs = require('fs'); // To read certificate files
const path = require("path");

const app = express();

// Define the path to your SSL certificate and key files
const options = {
    key: fs.readFileSync('certs/key.pem'), // Path to your private key file
    cert: fs.readFileSync('certs/cert.pem') // Path to your certificate file
};

// Create an HTTPS server using the options and your Express app
const server = https.createServer(options, app);

// Serve static frontend files
app.use(express.static("public"));

/**
 * Basic page routing
 */
app.get("/index.html", (req, res) => {
  res.sendFile(path.join(__dirname, "public", "index.html"));
});

app.get("/dashboard.html", (req, res) => {
  res.sendFile(path.join(__dirname, "public", "profile.html"));
});

const PORT = 8080;

// Start the server
server.listen(PORT, () => {
        console.log(`HTTPS server listening on port ${PORT}`);
});