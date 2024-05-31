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
    $order_fetch_key = new Key($Secret_Key, $Algorithm);
    $decoded = JWT::decode($token, $order_fetch_key, $object);
    $user_id = $decoded->user_id;

    if ($user_id) {
        /// Token is valid, proceed to fetch user's favorite cars
        $stmt = $pdo->prepare("SELECT c.car_id, c.brand, c.model, c.body_type, c.price, c.image_path
                               FROM orders uf
                               INNER JOIN cars c ON uf.car_id = c.car_id
                               WHERE uf.user_id = :user_id");
        $stmt->bindParam(':user_id', $user_id, PDO::PARAM_INT);
        $stmt->execute();

        $orderCars = $stmt->fetchAll(PDO::FETCH_ASSOC);

        // Prepare response
        if ($orderCars) {
            http_response_code(200); // OK
            echo json_encode(array("status" => "success", "data" => $orderCars));
        } else {
            http_response_code(404); // Not Found
            echo json_encode(array("status" => "success", "data" => $orderCars));
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