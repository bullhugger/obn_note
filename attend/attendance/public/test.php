<?php

// Load the database configuration
$dbConfig = parse_ini_file('../app/Config/Database.php');

// Database connection parameters
$host = $dbConfig['default']['hostname'] ?? 'localhost';
$username = $dbConfig['default']['username'] ?? 'root';
$password = $dbConfig['default']['password'] ?? '';
$database = $dbConfig['default']['database'] ?? 'progress_pgr';

// Create a new MySQLi connection
$mysqli = new \mysqli($host, $username, $password, $database);
$db = \Config\Database::connect();
$query = "SELECT * FROM users";
$result = $db->query($query);
print_r($result, false);

// Check the connection
if ($mysqli->connect_error) {
    die("Connection failed: " . $mysqli->connect_error);
}

echo "Database connection successful!";
