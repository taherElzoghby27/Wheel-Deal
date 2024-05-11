<?php
require_once("../includes/connection.php"); // Include your database connection file
require __DIR__ . '/../vendor/autoload.php'; // Include JWT library

use Firebase\JWT\JWT;

// Get the secret key for JWT decoding (assuming it's defined elsewhere in your code)
$secretKey = "your_secret_key_here"; // Update with your actual secret key
$Algorithm = array('HS256');

// Function to decode and retrieve user_id from JWT token
function getUserIdFromToken($token, $secretKey) {
    try {
        $decoded = JWT::decode($token, $secretKey, $Algorithm);
        return $decoded->user_id;
    } catch (Exception $e) {
        return null; // Return null if token decoding fails
    }
}

// Check if the Authorization header is present and contains a valid JWT token
$headers = apache_request_headers();
$authorizationHeader = isset($headers['Authorization']) ? $headers['Authorization'] : null;

if ($authorizationHeader && preg_match('/Bearer\s+(.*)$/i', $authorizationHeader, $matches)) {
    $token = $matches[1];
    $user_id = getUserIdFromToken($token, $secretKey);

    if ($user_id) {
        // Token is valid, proceed to add car to favorite list
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            // Assuming car_id is sent as a POST parameter named 'car_id'
            $car_id = isset($_POST['car_id']) ? $_POST['car_id'] : null;

            if ($car_id) {
                // Prepare SQL statement to insert into favorite cars table
                $stmt = $pdo->prepare("INSERT INTO favourite_list_item (user_id, car_id) VALUES (:user_id, :car_id)");
                $stmt->bindParam(':user_id', $user_id, PDO::PARAM_INT);
                $stmt->bindParam(':car_id', $car_id, PDO::PARAM_INT);

                // Execute the SQL statement
                if ($stmt->execute()) {
                    // Success response
                    http_response_code(201); // Created
                    echo json_encode(array("message" => "Car added to favorites successfully"));
                } else {
                    // Error inserting into database
                    http_response_code(500); // Internal Server Error
                    echo json_encode(array("error" => "Failed to add car to favorites"));
                }
            } else {
                // Missing car_id parameter
                http_response_code(400); // Bad Request
                echo json_encode(array("error" => "Missing 'car_id' parameter"));
            }
        } else {
            // Invalid HTTP method
            http_response_code(405); // Method Not Allowed
            echo json_encode(array("error" => "Method not allowed"));
        }
    } else {
        // Invalid or expired token
        http_response_code(401); // Unauthorized
        echo json_encode(array("error" => "Unauthorized"));
    }
} else {
    // Missing or invalid Authorization header
    http_response_code(401); // Unauthorized
    echo json_encode(array("error" => "Unauthorized"));
}