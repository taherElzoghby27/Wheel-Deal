<?php
require_once("../includes/connection.php");

try {
    // Prepare SQL query to fetch brand data
    $sql = "SELECT source_name, source_image FROM source";
    
    // Prepare and execute the SQL query
    $stmt = $pdo->prepare($sql);
    $stmt->execute();

    // Fetch brand data
    $brands = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Check if data was found
    if ($brands) {
        // Prepare JSON response
        $response = array("status" => "success", "data" => $brands);
        // Set HTTP response code to 200 (OK)
        http_response_code(200);
    } else {
        // No data found
        $response = array("status" => "failed", "Message" => "No brands found.");
        // Set HTTP response code to 404 (Not Found) or 204 (No Content) depending on the context
        http_response_code(404); // or http_response_code(204);
    }
} catch (PDOException $e) {
    // Database error
    $response = array("status" => "failed", "Message" => "Database error: " . $e->getMessage());
    // Set HTTP response code to 500 (Internal Server Error)
    http_response_code(500);
}

// Set content type to JSON
header('Content-Type: application/json');

// Output JSON response
echo json_encode($response);