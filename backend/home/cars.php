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
        // Set HTTP response code to 200 (OK)
        http_response_code(200);
    } else {
        // No data found
        $response = array("status" => "failed", "Message" => "No cars found.");
        // Set HTTP response code to 404 (Not Found) or 204 (No Content) depending on your use case
        http_response_code(404);
        // For example, if you want to use 204 (No Content) when no cars are found:
        // http_response_code(204);
    }
}
catch (PDOException $e) {
    // Database error
    $response = array("status" => "failed", "Message" => "Database error: " . $e->getMessage());
    // Set HTTP response code to 500 (Internal Server Error)
    http_response_code(500);
}

// Set content type to JSON
header('Content-Type: application/json');

// Output JSON response
echo json_encode($response);