<?php
require_once("../includes/connection.php");
require __DIR__ . '/../vendor/autoload.php';

// Set content type to JSON
header('Content-Type: application/json');

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
    $favourite_key = new Key($Secret_Key, $Algorithm);
    $decoded = JWT::decode($token, $favourite_key, $object);
    $user_id = $decoded->user_id;

    if ($user_id) {
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            if (isset($_POST['q'])) {
                $searchTerm = '%' . htmlspecialchars($_POST['q']) . '%';

                // Set the number of records per page
                $results_per_page = 10;            
                // Get the current page number from the query string, default is 1
                $page = isset($_POST['page']) && is_numeric($_POST['page']) ? (int)$_POST['page'] : 1;
                // Calculate the starting record for the current page
                $start_from = ($page - 1) * $results_per_page;            
                // Query to count the total number of records
                $sql_count = "SELECT COUNT(*) FROM cars WHERE car_name LIKE :searchTerm";
                $stmt_count = $pdo->prepare($sql_count);
                $stmt_count->bindParam(':searchTerm', $searchTerm, PDO::PARAM_STR);
                $stmt_count->execute();
                $total_records = $stmt_count->fetchColumn();
                // Calculate total pages
                $total_pages = ceil($total_records / $results_per_page);

                // Check if the search already exists for the user_id
                $checkSql = "SELECT * FROM user_search_history WHERE user_id = :user_id AND search_query = :search_query";
                $checkStmt = $pdo->prepare($checkSql);
                $checkStmt->bindParam(':user_id', $user_id, PDO::PARAM_INT);
                $checkStmt->bindParam(':search_query', $_POST['q'], PDO::PARAM_STR);
                $checkStmt->execute();
                $existingOrder = $checkStmt->fetch(PDO::FETCH_ASSOC);

                if ($existingOrder) {
                    // Perform the search query
                    $searchStmt = $pdo->prepare("SELECT car_id, brand, model, body_type, price, image_path FROM cars WHERE brand LIKE :searchTerm LIMIT :start_from, :results_per_page");
                    $searchStmt->bindParam(':searchTerm', $searchTerm, PDO::PARAM_STR);
                    $searchStmt->bindValue(':start_from', $start_from, PDO::PARAM_INT);
                    $searchStmt->bindValue(':results_per_page', $results_per_page, PDO::PARAM_INT);
                    $searchStmt->execute();
                    // Fetch all matching cars
                    $results = $searchStmt->fetchAll(PDO::FETCH_ASSOC);
                } else {
                    // Insert search history into the database
                    $insertStmt = $pdo->prepare("INSERT INTO user_search_history (user_id, search_query) VALUES (:user_id, :searchQuery)");
                    $insertStmt->bindParam(':user_id', $user_id, PDO::PARAM_INT);
                    $insertStmt->bindParam(':searchQuery', $_POST['q'], PDO::PARAM_STR);
                    $insertStmt->execute();

                    // Perform the search query
                    $searchStmt = $pdo->prepare("SELECT car_id, brand, model, body_type, price, image_path FROM cars WHERE brand LIKE :searchTerm LIMIT :start_from, :results_per_page");
                    $searchStmt->bindParam(':searchTerm', $searchTerm, PDO::PARAM_STR);
                    $searchStmt->bindValue(':start_from', $start_from, PDO::PARAM_INT);
                    $searchStmt->bindValue(':results_per_page', $results_per_page, PDO::PARAM_INT);
                    $searchStmt->execute();
                    // Fetch all matching cars
                    $results = $searchStmt->fetchAll(PDO::FETCH_ASSOC);
                }

                // Check if any results found
                if ($results) {
                    $base_url = 'http://localhost/CarTrading/backend/home/search.php'; // Change to your actual API endpoint
                    $prev_page = $page > 1 ? $base_url . '?page=' . ($page - 1) : null;
                    $next_page = $page < $total_pages ? $base_url . '?page=' . ($page + 1) : null;

                    // Data found with exact or partial match
                    http_response_code(200); // Set success code
                    echo json_encode(array( "status" => "success",
                        "pagination" => array(
                            "current_page" => $page,
                            "total_pages" => $total_pages,
                            "total_records" => $total_records,
                            "results_per_page" => $results_per_page
                            //"prev_page" => $prev_page,
                            //"next_page" => $next_page
                        ),
                        "data" => $results)); // Encode data as JSON
                } else {
                    // No data found
                    http_response_code(204); // Set success code
                    echo json_encode(array("status" => "success", "data" => [])); // Encode data as JSON
                }
            }
        } else {
            // Invalid HTTP method
        http_response_code(405); // Method Not Allowed
        echo json_encode(array("status" => "failed", "Message" => "Only POST Method is allowed"));
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
