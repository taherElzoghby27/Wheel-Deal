<?php
require_once("../includes/connection.php");
require __DIR__ . '/../vendor/autoload.php';

use Firebase\JWT\JWT;

$algorithm = array('HS256');

// Check if the Authorization header is present
$headers = apache_request_headers();
$authorizationHeader = isset($headers['Authorization']) ? $headers['Authorization'] : null;

if ($authorizationHeader && preg_match('/Bearer\s+(.*)$/i', $authorizationHeader, $matches)) {
    $token = $matches[1];

    try {
        // Verify and decode the JWT token using the secret key
        $decoded = JWT::decode($token, $secretkey, $algorithm);
        $userId = $decoded->user_id;

        if (isset($_GET['q'])) {
            $searchQuery = '%' . htmlspecialchars($_GET['q']) . '%';

            // Insert search history into the database
            $insertStmt = $pdo->prepare("INSERT INTO user_search_history (user_id, search_query) VALUES (:user_id, :searchQuery)");
            $insertStmt->bindParam(':user_id', $userId, PDO::PARAM_INT);
            $insertStmt->bindParam(':searchQuery', $_GET['q'], PDO::PARAM_STR);
            $insertStmt->execute();

            // Perform the search query
            $searchStmt = $pdo->prepare("SELECT car_id, brand, model, body_type, price, image_path FROM cars WHERE car_name LIKE :searchQuery");
            $searchStmt->bindParam(':searchQuery', $searchQuery, PDO::PARAM_STR);
            $searchStmt->execute();

            // Fetch all matching cars
            $results = $searchStmt->fetchAll(PDO::FETCH_ASSOC);

            // Fetch recent searches for the authenticated user
            $recentSearchesStmt = $pdo->prepare("SELECT search_query, search_timestamp FROM user_search_history WHERE user_id = :user_id ORDER BY search_timestamp DESC LIMIT 5");
            $recentSearchesStmt->bindParam(':user_id', $userId, PDO::PARAM_INT);
            $recentSearchesStmt->execute();
            $recentSearches = $recentSearchesStmt->fetchAll(PDO::FETCH_ASSOC);

            // Prepare the response
            $response = array(
                "results" => $results,
                "recent_searches" => $recentSearches
            );

            echo json_encode($response);
        } else {
            // Handle missing search query parameter
            http_response_code(400);
            echo json_encode(array("error" => "Please provide a search query"));
        }
    } catch (Exception $e) {
        // Handle JWT decoding or other errors
        http_response_code(401);
        echo json_encode(array("error" => "Unauthorized: " . $e->getMessage()));
    }
} else {
    // Handle missing or invalid Authorization header
    http_response_code(401);
    echo json_encode(array("error" => "Unauthorized"));
}