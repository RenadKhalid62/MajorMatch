<?php
$host = "localhost";
$username = "root";
$password = "";
$dbname = "majormatch";

$conn = new mysqli($host, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $exp_name = $_POST['exp_name'];
    $rating_value = $_POST['rating_value'];

    if (!empty($exp_name) && !empty($rating_value)) {
        
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

$conn->close();
?>