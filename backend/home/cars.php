<?php
require_once("../includes/connection.php");

try {
    // Prepare SQL query to fetch car data including image URLs
    $sql = "SELECT car_id, brand, model, body_type, price, image_path FROM cars";
    
    // Prepare and execute the SQL query
    $stmt = $pdo->prepare($sql);
    $stmt->execute();

    // Fetch car data
    $cars = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Check if data was found
    if ($cars) {
        // Prepare JSON response
        $response = array("status" => "success", "data" => $cars);
    } else {
        // No data found
        $response = array("status" => "error", "message" => "No cars found.");
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