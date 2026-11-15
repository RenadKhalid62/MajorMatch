<?php
$host = "localhost";
$username = "root";
$password = "";
$dbname = "majormatch"; 

$conn = new mysqli($host, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if (isset($_GET['exp_name'])) {
    $exp_name = $_GET['exp_name'];
    
    $sql = "SELECT rating_value FROM experience_ratings WHERE exp_name='$exp_name' ORDER BY id DESC LIMIT 1";
    $result = $conn->query($sql);
    
    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        echo $row['rating_value'];
    } else {
        echo "none";
    }
}

$conn->close();
?>