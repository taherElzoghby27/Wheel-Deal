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
        // Set the number of records per page
        $results_per_page = 10;
        // Get the current page number from the query string, default is 1
        $page = isset($_GET['page']) && is_numeric($_GET['page']) ? (int)$_GET['page'] : 1;                // Calculate the starting record for the current page
        $start_from = ($page - 1) * $results_per_page;
         // Query to count the total number of records
        $sql_count = "SELECT COUNT(*) FROM favourite_list_item WHERE user_id = :user_id";
        $stmt_count = $pdo->prepare($sql_count);
        $stmt_count->bindParam(':user_id', $user_id, PDO::PARAM_INT);
        $stmt_count->execute();
        $total_records = $stmt_count->fetchColumn();
        // Calculate total pages
        $total_pages = ceil($total_records / $results_per_page);
        // Token is valid, proceed to fetch user's favorite cars
        $stmt = $pdo->prepare("SELECT c.car_id, c.brand, c.model, c.body_type, c.price, c.image_path
                               FROM orders uf
                               INNER JOIN cars c ON uf.car_id = c.car_id
                               WHERE uf.user_id = :user_id LIMIT :start_from, :results_per_page");
        $stmt->bindParam(':user_id', $user_id, PDO::PARAM_INT);
        $stmt->bindValue(':start_from', $start_from, PDO::PARAM_INT);
        $stmt->bindValue(':results_per_page', $results_per_page, PDO::PARAM_INT);
        $stmt->execute();

        $orderCars = $stmt->fetchAll(PDO::FETCH_ASSOC);

        // Prepare response
        if ($orderCars) {
            $base_url = 'http://localhost/CarTrading/backend/home/cars.php'; // Change to your actual API endpoint
            $prev_page = $page > 1 ? $base_url . '?page=' . ($page - 1) : null;
            $next_page = $page < $total_pages ? $base_url . '?page=' . ($page + 1) : null;

            http_response_code(200); // OK
            echo json_encode(array(
                "status" => "success",
                "pagination" => array(
                    "current_page" => $page,
                    "total_pages" => $total_pages,
                    "total_records" => $total_records,
                    "results_per_page" => $results_per_page,
                    "prev_page" => $prev_page,
                    "next_page" => $next_page
                ),
                "data" => $orderCars));
        } else {
            http_response_code(404); // Not Found
            echo json_encode(array("Message" => "No order cars found for the user"));
        }
    } else {
        //// Invalid or expired token
        http_response_code(401); // Unauthorized
        echo json_encode(array("Message" => "Unauthorized"));
    }
} else {
    // Missing or invalid Authorization header
    http_response_code(401); // Unauthorized
    echo json_encode(array("Message" => "Unauthorized"));
}