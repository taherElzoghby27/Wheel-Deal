<?php
require_once("../includes/connection.php");
require __DIR__ . '/../vendor/autoload.php';

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
    $search_key = new Key($Secret_Key, $Algorithm);
    $decoded = JWT::decode($token, $search_key, $object);
    $user_id = $decoded->user_id;

    if ($user_id) {

        if ($_SERVER['REQUEST_METHOD'] === 'GET') {
            
            // Perform the search query
            $searchStmt = $pdo->prepare("SELECT user_id, search_query FROM user_search_history WHERE user_id = :user_id");
            $searchStmt->bindParam(':user_id', $user_id, PDO::PARAM_INT);
            $searchStmt->execute();
            // Fetch all matching cars
            $results = $searchStmt->fetchAll(PDO::FETCH_ASSOC);

            // Check if any results found
            if ($results) {
                // Data found
                http_response_code(200); // Set success code
                echo json_encode(array("status" => "success", "data" => $results)); // Encode data as JSON
            } else {
                    // No data found
                    http_response_code(200); // Set success code
                    echo json_encode(array("status" => "success", "data" => $results)); // Encode data as JSON
            }
        } else {
            // Invalid HTTP method
            http_response_code(405); // Method Not Allowed
            echo json_encode(array("status" => "failed", "Message" => "Only GET Method is allowed"));
        }
    } else {
        // Invalid or expired token
        http_response_code(401); // Unauthorized
        echo json_encode(array("status" => "failed", "Message" => "Unauthorized User"));
    }
} else {
    // Handle missing or invalid Authorization header
    http_response_code(401);
    echo json_encode(array("status" => "failed", "Message" => "Unauthorized"));
}
