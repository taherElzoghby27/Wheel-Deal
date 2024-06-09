<?php
require_once("../includes/connection.php");
require __DIR__ . '/../vendor/autoload.php';

use Firebase\JWT\JWT;
use Firebase\JWT\Key;


// Check if the Authorization header is present
$headers = apache_request_headers();
$authorizationHeader = isset($headers['Authorization']) ? $headers['Authorization'] : null;

if ($authorizationHeader && preg_match('/Bearer\s+(.*)$/i', $authorizationHeader, $matches)) {
    $token = $matches[1];

    try {
        // Verify and decode the JWT token using the secret key
        $Algorithm = 'HS256';
        $AlgorithmArray = [$Algorithm];
        $search_Secret_Key = 'your_secret_key';
        $object = (object) $AlgorithmArray;
        $key = new Key($search_Secret_Key, $Algorithm);
        $decoded = JWT::decode($token, $key, $object);
        $userId = $decoded->user_id;

        if (isset($_POST['q'])) {

            //$searchTerm = '%' . htmlspecialchars($_POST['q']) . '%';

            // Check if the search already exists for the user_id
            $checkSql = "SELECT * FROM user_search_history WHERE user_id = :user_id AND search_query = :search_query";
            $checkStmt = $pdo->prepare($checkSql);
            $checkStmt->bindParam(':user_id', $user_id, PDO::PARAM_INT);
            $checkStmt->bindParam(':search_query', $_POST['q'], PDO::PARAM_STR);
            $checkStmt->execute();
            $existingOrder = $checkStmt->fetch(PDO::FETCH_ASSOC);

            if ($existingOrder) {
            // Insert search history into the database
            $insertStmt = $pdo->prepare("INSERT INTO user_search_history (user_id, search_query) VALUES (:user_id, :searchQuery)");
            $insertStmt->bindParam(':user_id', $userId, PDO::PARAM_INT);
            $insertStmt->bindParam(':searchQuery', $_POST['q'], PDO::PARAM_STR);
            $insertStmt->execute();
            }
            // Perform the search query
            $searchStmt = $pdo->prepare("SELECT car_id, brand, model, body_type, price, image_path FROM cars WHERE car_name LIKE :searchTerm");
            $searchStmt->bindParam(':searchTerm', $_POST['q'], PDO::PARAM_STR);
            $searchStmt->execute();

            // Fetch all matching cars
            $results = $searchStmt->fetchAll(PDO::FETCH_ASSOC);

            // Check if any results found
            if ($results) {
                // Data found with exact or partial match
                http_response_code(200); // Set success code
                echo json_encode(array("status" => "success", "data" => $results)); // Encode data as JSON
            } else {
                // No data found
                http_response_code(200); // Set success code
                echo json_encode(array("status" => "success", "data" => $results)); // Encode data as JSON
                }
        }/*else {
            // Handle missing search query parameter
            http_response_code(200);
            echo json_encode(array("status" => "success", "data" => $results));
        }*/
    } catch (PDOException $e) {
            // Handle JWT decoding or other errors
            http_response_code(401);
            echo json_encode(array("Message" => "Unauthorized: " . $e->getMessage()));
    }
    
} else {
    // Handle missing or invalid Authorization header
    http_response_code(401);
    echo json_encode(array("Message" => "Unauthorized"));
}