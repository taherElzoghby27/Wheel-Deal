<?php
require_once("../includes/connection.php"); // Include your database connection file
require __DIR__ . '/../vendor/autoload.php'; // Include JWT library

use Firebase\JWT\JWT;
use Firebase\JWT\Key;

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
    $order_key = new Key($Secret_Key, $Algorithm);
    $decoded = JWT::decode($token, $order_key, $object);
    $user_id = $decoded->user_id;

    if ($user_id) {
        // Token is valid, proceed to add car to favorite list
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            // Assuming car_id is sent as a POST parameter named 'car_id'
            $car_id = isset($_POST['car_id']) ? $_POST['car_id'] : null;
            $order_status = isset($_POST['order_status']) ? $_POST['order_status'] : null;
            $order_date = isset($_POST['order_date']) ? $_POST['order_date'] : null;

            if ($car_id) {
                // Prepare SQL statement to insert into favorite cars table
                $stmt = $pdo->prepare("INSERT INTO orders (user_id, car_id, order_status, order_date) VALUES (:user_id, :car_id, :order_status, :order_date)");
                $stmt->bindParam(':user_id', $user_id, PDO::PARAM_INT);
                $stmt->bindParam(':car_id', $car_id, PDO::PARAM_INT);
                $stmt->bindParam(':order_status', $order_status, PDO::PARAM_STR);
                $stmt->bindParam(':order_date', $order_date, PDO::PARAM_STR);

                // Execute the SQL statement
                if ($stmt->execute()) {
                    // Success response
                    http_response_code(201); // Created
                    echo json_encode(array("Message" => "Car added to orders successfully"));
                } else {
                    // Error inserting into database
                    http_response_code(500); // Internal Server Error
                    echo json_encode(array("Message" => "Failed to add car to orders"));
                }
            } else {
                // Missing car_id parameter
                http_response_code(400); // Bad Request
                echo json_encode(array("Message" => "Missing 'car_id' parameter"));
            }
        } else {
            // Invalid HTTP method
            http_response_code(405); // Method Not Allowed
            echo json_encode(array("Message" => "Method not allowed"));
        }
    } else {
        // Invalid or expired token
        http_response_code(401); // Unauthorized
        echo json_encode(array("Message" => "Unauthorized"));
    }
} else {
    // Missing or invalid Authorization header
    http_response_code(401); // Unauthorized
    echo json_encode(array("Message" => "Unauthorized"));
}