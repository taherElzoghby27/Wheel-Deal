<?php
require_once("../includes/connection.php");

if ($_SERVER['REQUEST_METHOD'] ==='GET') {

    try {

        // Prepare SQL query to fetch brand data
        $sql = "SELECT source_name FROM source ORDER BY source_name ASC";
        
        // Prepare and execute the SQL query
        $stmt = $pdo->prepare($sql);
        $stmt->execute();

        // Fetch brand data
        $brands = $stmt->fetchAll(PDO::FETCH_ASSOC);

        // Check if data was found
        if ($brands) {
    
            // Prepare JSON response with pagination info
            $response = array("status" => "success", "data" => $brands);
            // Set HTTP response code to 200 (OK)
            http_response_code(200);
        } else {
            // No data found
            $response = array("status" => "success", "data" => []);
            // Status Success But No Data Found
            http_response_code(200);
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

} else {
    
    http_response_code(405);
    echo json_encode(array("status" => "failed", "Message" => "Only GET Method is allowed"));
}