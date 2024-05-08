<?php
require_once("../includes/connection.php");

try {
    // Prepare SQL query to fetch car data including image URLs
    $sql = "SELECT installment_id, car_id, deposit, installment_plan, monthly, total FROM installment";
    
    // Prepare and execute the SQL query
    $stmt = $pdo->prepare($sql);
    $stmt->execute();

    // Fetch car data
    $installment = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Check if data was found
    if ($installment) {
        // Prepare JSON response
        $response = array("status" => "success", "data" => $installment);
    } else {
        // No data found
        $response = array("status" => "error", "message" => "No data found.");
    }
}
catch (PDOException $e) {
    // Database error
    $response = array("status" => "error", "message" => "Database error: " . $e->getMessage());
}

// Set content type to JSON
header('Content-Type: application/json');

// Output JSON response
echo json_encode($response);