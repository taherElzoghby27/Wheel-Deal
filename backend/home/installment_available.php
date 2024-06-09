<?php
require_once("../includes/connection.php");

// Check if the request method is POST
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    try {
        $car_id = isset($_POST['car_id']) ? $_POST['car_id'] : null;

        // Prepare SQL query to fetch installment data
        $sql = "SELECT car_id, deposit, installment_plan, monthly, total FROM installment WHERE car_id = :car_id";
        
        // Prepare and execute the SQL query
        $stmt = $pdo->prepare($sql);
        $stmt->bindParam(':car_id', $car_id, PDO::PARAM_INT);
        $stmt->execute();

        // Fetch installment data
        $installment = $stmt->fetchAll(PDO::FETCH_ASSOC);

        // Check if data was found
        if ($installment) {
            // Prepare JSON response
            $response = array("status" => "success", "data" => $installment);
            // Set HTTP response code to 200 (OK)
            http_response_code(200);
        } else {
            // No data found
            $response = array("status" => "success", "data" => $installment);
            http_response_code(200); // Status Success But Not Found Data
        }
    } catch (PDOException $e) {
        // Database error
        $response = array("status" => "failed", "Message" => "Database error: " . $e->getMessage());
        // Set HTTP response code to 500 (Internal Server Error)
        http_response_code(500);
    }
} else {
    // Request method is not POST
    $response = array("status" => "failed", "Message" => "Wrong method. Only POST is allowed.");
    // Set HTTP response code to 405 (Method Not Allowed)
    http_response_code(405);
}

// Set content type to JSON
header('Content-Type: application/json');

// Output JSON response
echo json_encode($response);