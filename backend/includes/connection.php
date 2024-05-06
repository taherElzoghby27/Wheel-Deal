<?php
// Example of establishing a PDO connection
$dsn = 'mysql:host=localhost;dbname=car_trading_app';
$username = 'root';
$password = '';

try {
    $pdo = new PDO($dsn, $username, $password);
} catch (PDOException $e) {
    die('Database connection failed: ' . $e->getMessage());
}