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
        // Token is valid, proceed to add car to orders list
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            // Assuming car_id is sent as a POST parameter named 'car_id'
            $car_id = isset($_POST['car_id']) ? $_POST['car_id'] : null;
            $order_status = "running";
            $order_date = date('Y-m-d');

            if ($car_id) {
                // Check if the car_id already exists for the user_id
                $checkSql = "SELECT * FROM orders WHERE user_id = :user_id AND car_id = :car_id";
                $checkStmt = $pdo->prepare($checkSql);
                $checkStmt->bindParam(':user_id', $user_id, PDO::PARAM_INT);
                $checkStmt->bindParam(':car_id', $car_id, PDO::PARAM_INT);
                $checkStmt->execute();
                $existingOrder = $checkStmt->fetch(PDO::FETCH_ASSOC);

                if ($existingOrder) {
                    // Car already ordered
                    http_response_code(409); // Conflict
                    echo json_encode(array("status" => "failed", "Message" => "Car already ordered"));
                } else {
                    // Prepare SQL statement to insert into orders table
                    $stmt = $pdo->prepare("INSERT INTO orders (user_id, car_id, order_status, order_date) VALUES (:user_id, :car_id, :order_status, :order_date)");
                    $stmt->bindParam(':user_id', $user_id, PDO::PARAM_INT);
                    $stmt->bindParam(':car_id', $car_id, PDO::PARAM_INT);
                    $stmt->bindParam(':order_status', $order_status, PDO::PARAM_STR);
                    $stmt->bindParam(':order_date', $order_date, PDO::PARAM_STR);

                    // Execute the SQL statement
                    if ($stmt->execute()) {
                        // Success response
                        http_response_code(200); // Created
                        echo json_encode(array("status" => "success", "Message" => "Car added to orders successfully"));
                    } else {
                        // Error inserting into database
                        http_response_code(500); // Internal Server Error
                        echo json_encode(array("status" => "failed", "Message" => "Failed to add car to orders"));
                    }
                }
            } else {
                // Missing car_id parameter
                http_response_code(400); // Bad Request
                echo json_encode(array("status" => "failed", "Message" => "Missing Car To Order"));
            }
        } else {
            // Invalid HTTP method
            http_response_code(405); // Method Not Allowed
            echo json_encode(array("status" => "failed", "Message" => "Only POST Method is allowed"));
        }
    } else {
        // Invalid or expired token
        http_response_code(401); // Unauthorized
        echo json_encode(array("status" => "failed", "Message" => "Unauthorized"));
    }
} else {
    // Missing or invalid Authorization header
    http_response_code(401); // Unauthorized
    echo json_encode(array("status" => "failed", "Message" => "Unauthorized"));
}
?>
