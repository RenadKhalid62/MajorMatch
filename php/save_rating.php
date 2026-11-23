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

// Receive rating data sent from JavaScript via POST
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $exp_name = $_POST['exp_name'];
    $rating_value = $_POST['rating_value'];

    // Make sure fields are not empty before inserting
    if (!empty($exp_name) && !empty($rating_value)) {
        
        // Insert the rating into the experience_ratings table
        $sql = "INSERT INTO experience_ratings (exp_name, rating_value) VALUES ('$exp_name', '$rating_value')";

        if ($conn->query($sql) === TRUE) {
            echo "Success";
        } else {
            echo "Error: " . $conn->error;
        }
    } else {
        echo "Missing data!";
    }
}

// Close the database connection
$conn->close();
?>