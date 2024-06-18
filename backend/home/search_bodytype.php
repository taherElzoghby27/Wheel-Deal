<?php
require_once("../includes/connection.php");
// Set content type to JSON
header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    
    $brand = isset($_POST['brand']) ? $_POST['brand'] : null;
    // Perform the bodytype fetch query
    $bodyTypeStmt = $pdo->prepare("SELECT DISTINCT body_type FROM cars WHERE brand = :brand");
    $bodyTypeStmt->bindParam(':brand', $brand, PDO::PARAM_STR);
    $bodyTypeStmt->execute();
    // Fetch all matching cars
    $results = $bodyTypeStmt->fetchAll(PDO::FETCH_ASSOC);

    // Check if any results found
    if ($results) {
        http_response_code(200); //Set OK 200
        echo json_encode(array("status" => "success", "data" => $results));
    } else {
        http_response_code(200); //Set OK 200
        echo json_encode(array("status" => "success", "data" => []));
    }
} else {
    // Invalid HTTP method
    http_response_code(405); // Method Not Allowed
    echo json_encode(array("status" => "failed", "Message" => "Only POST Method is allowed"));
}