<?php
require_once("../includes/connection.php");

// Check if the request method is POST
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    try {
        $car_id = isset($_POST['car_id']) ? $_POST['car_id'] : null;

        // Prepare SQL query to fetch car data including image URLs
        $sql = "SELECT car_id, brand, model, body_type, fuel_type, transmission, color, release_date, engine_power, top_speed, fuel_tank_capacity, price, air_conditioner, brake_assist, navigation_system, touch_screen, connectivity, remote_engine_start_stop, new_used, installment_availability, image_path FROM cars WHERE car_id = :car_id";

        // Prepare and execute the SQL query
        $stmt = $pdo->prepare($sql);
        $stmt->bindParam(':car_id', $car_id, PDO::PARAM_INT);
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
            $response = array("status" => "success", "data" => $cars);
            // Set HTTP response code to 200 (Success But Not Found)
            http_response_code(200);
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