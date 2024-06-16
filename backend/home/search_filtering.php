<?php
require_once("../includes/connection.php");

// Set content type to JSON
header('Content-Type: application/json');

// Check if the request method is POST
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Initialize SQL query and parameters
    $sql = "SELECT car_id, `condition`, brand, model, body_type, price, image_path FROM cars WHERE 1 = 1";
    $params = array(); // Array to hold parameters for prepared statement

    // Process each filter provided in the form data
    if (isset($_POST['condition']) && ($_POST['condition'] === 'used' || $_POST['condition'] === 'new')) {
        $sql .= " AND `condition` = :condition";
        $params[':condition'] = $_POST['condition'];
    }

    if (isset($_POST['brand'])) {
        $sql .= " AND brand = :brand";
        $params[':brand'] = $_POST['brand'];
    }

    if (isset($_POST['body_type'])) {
        $sql .= " AND body_type = :body_type";
        $params[':body_type'] = $_POST['body_type'];
    }

    if (isset($_POST['min_price']) && isset($_POST['max_price'])) {
        $sql .= " AND price BETWEEN :min_price AND :max_price";
        $params[':min_price'] = $_POST['min_price'];
        $params[':max_price'] = $_POST['max_price'];
    }

    // Prepare specific features filtering based on provided keys
    $features = array(
        'airbag', 'touch_screen', 'air_conditioner',
        'brake_assist', 'navigation_system', 'connectivity',
        'remote_engine_start_stop'
    );

    foreach ($features as $feature) {
        if (isset($_POST[$feature]) && $_POST[$feature] === '1') {
            $sql .= " AND $feature = :" . $feature;
            $params[':' . $feature] = 1;
        }
    }

    // Prepare and execute the SQL statement with parameters
    try {
        $stmt = $pdo->prepare($sql);
        $stmt->execute($params);

        // Fetch all matching cars
        $results = $stmt->fetchAll(PDO::FETCH_ASSOC);

        if ($results) {
            // Return results as JSON response
            http_response_code(200); // OK
            echo json_encode(array(
                "status" => "success",
                "data" => $results
            ));
        } else {
            // No matching cars found
            http_response_code(200); // Not Found
            echo json_encode(array("status" => "success", "data" => $results));
        }
    } catch (PDOException $e) {
        // Database error
        http_response_code(500); // Internal Server Error
        echo json_encode(array("status" => "failed", "message" => "Database error: " . $e->getMessage()));
    }
} else {
    // Handle non-POST requests with correct response codes
    http_response_code(405); // Method Not Allowed
    echo json_encode(array("status" => "failed", "message" => "Only POST method is allowed"));
}
?>
