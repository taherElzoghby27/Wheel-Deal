<?php

/* this endpoint takes user token
 inputs (previous_car , rating, previous_car_brand) */

require_once("../includes/connection.php"); // Include your database connection file
require_once("../includes/function.php");
require __DIR__ . '/../vendor/autoload.php'; /// Include JWT library

// Set content type to JSON
header('Content-Type: application/json');

use Firebase\JWT\JWT;
use Firebase\JWT\Key;

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Check if the Authorization header is present and contains a valid JWT token
    $headers = apache_request_headers();
    $authorizationHeader = isset($headers['Authorization']) ? $headers['Authorization'] : null;

    if ($authorizationHeader && preg_match('/Bearer\s+(.*)$/i', $authorizationHeader, $matches)) {
        $token = $matches[1];
        // Decode and verify JWT token
        $Algorithm = 'HS256';
        $AlgorithmArray = [$Algorithm];
        $Secret_Key = 'your_secret_key';
        $object = (object) $AlgorithmArray;
        $user_extra_key = new Key($Secret_Key, $Algorithm);
        $decoded = JWT::decode($token, $user_extra_key, $object);
        $user_id = $decoded->user_id;

        $previous_car = isset($_POST['previous_car']) ? $_POST['previous_car'] : '';
        $rating = isset($_POST['rating']) ? (float)$_POST['rating'] : '';
        $previous_car_brand = isset($_POST['previous_car_brand']) ? $_POST['previous_car_brand'] : '';

        // Insert search history into the database
        $insertStmt = $pdo->prepare("INSERT INTO user_reference (user_id, previous_car, rating, previous_car_brand) VALUES (:user_id, :previous_car, :rating, :previous_car_brand)");
        $insertStmt->bindParam(':user_id', $user_id, PDO::PARAM_INT);
        $insertStmt->bindParam(':previous_car', $previous_car, PDO::PARAM_STR);
        $insertStmt->bindParam(':rating', $rating, PDO::PARAM_STR);
        $insertStmt->bindParam(':previous_car_brand', $previous_car_brand, PDO::PARAM_STR);
        
        if ($insertStmt->execute()) {
            http_response_code(200);
            echo json_encode(["status" => "success", "Message" => "Thank You For Your Help"]);
        } else {
            http_response_code(500);
            echo json_encode(["status" => "failed", "Message" => "Something Went Wrong"]);
        }

    } else {
        // Missing or invalid Authorization header
        http_response_code(401); // Unauthorized
        echo json_encode(array("status" => "failed", "Message" => "Unauthorized"));
    }

} else {
    // Invalid HTTP method
    http_response_code(405); // Method Not Allowed
    echo json_encode(array("status" => "failed", "Message" => "Only POST Method is allowed"));
}