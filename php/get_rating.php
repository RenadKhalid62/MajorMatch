<?php
// Database connection settings
$host = "localhost";
$username = "root";
$password = "";
$dbname = "majormatch"; 

// Create connection to MySQL
$conn = new mysqli($host, $username, $password, $dbname);

// Check if connection failed
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Check if the experience name was sent in the URL (GET)
if (isset($_GET['exp_name'])) {
    $exp_name = $_GET['exp_name'];
    
    // Fetch the most recent rating for this experience
    $sql = "SELECT rating_value FROM experience_ratings WHERE exp_name='$exp_name' ORDER BY id DESC LIMIT 1";
    $result = $conn->query($sql);
    
    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        echo $row['rating_value']; // Return the saved rating
    } else {
        echo "none"; // No rating found yet
    }
}

// Close the database connection
$conn->close();
?>