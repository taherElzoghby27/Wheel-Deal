<?php
require_once("../includes/connection.php");

try {
    // Prepare SQL query to fetch car data including image URLs
    $sql = "SELECT source_name,source_image FROM source";
    
    // Prepare and execute the SQL query
    $stmt = $pdo->prepare($sql);
    $stmt->execute();

    // Fetch car data
    $brands = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Check if data was found
    if ($brands) {
        // Prepare JSON response
        $response = array("status" => "success", "data" => $brands);
    } else {
        // No data found
        $response = array("status" => "error", "message" => "No brands found.");
    }
} catch (PDOException $e) {
    // Database error
    $response = array("status" => "error", "message" => "Database error: " . $e->getMessage());
}

// Set content type to JSON
header('Content-Type: application/json');

// Output JSON response
echo json_encode($response);