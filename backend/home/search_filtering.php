<?php
require_once("../includes/connection.php");

// Check if the request method is GET
if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    // Read and decode the incoming JSON request
    $inputJSON = file_get_contents('php://input');
    $input = json_decode($inputJSON, true);

    // Check if the JSON request was successfully decoded
    if ($input === null) {
        echo json_encode(array("error" => "Invalid JSON input"));
        http_response_code(400); // Bad Request
        exit;
    }

    // Initialize SQL query and parameters
    $sql = "SELECT car_id, `condition`, brand, model, body_type, price, image_path FROM cars WHERE 1 = 1";
    $params = array(); // Array to hold parameters for prepared statement

    // Process each filter provided in the JSON request
    if (isset($input['condition']) && ($input['condition'] === 'used' || $input['condition'] === 'new')) {
        $sql .= " AND `condition` = :condition";
        $params['condition'] = $input['condition'];
    }

    if (isset($input['brand'])) {
        $sql .= " AND brand = :brand";
        $params['brand'] = $input['brand'];
    }

    if (isset($input['body_type'])) {
        $sql .= " AND body_type = :body_type";
        $params['body_type'] = $input['body_type'];
    }

    if (isset($input['min_price']) && isset($input['max_price'])) {
        $sql .= " AND price BETWEEN :min_price AND :max_price";
        $params['min_price'] = $input['min_price'];
        $params['max_price'] = $input['max_price'];
    }

    // Prepare specific features filtering based on provided keys
    $features = array(
        'airbag', 'touch_screen', 'air_conditioner',
        'brake_assist', 'navigation_system', 'connectivity',
        'remote_engine_start_stop'
    );

    foreach ($features as $feature) {
        if (isset($input[$feature]) && ($input[$feature] === true || $input[$feature] === false)) {
            $sql .= " AND $feature = :" . $feature;
            $params[$feature] = ($input[$feature] === true) ? 1 : 0;
        }
    }

    // Prepare and execute the SQL statement with parameters
    $stmt = $pdo->prepare($sql);
    $stmt->execute($params);

    // Fetch all matching cars
    $results = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Return results as JSON response
    echo json_encode($results);
} else {
    // Handle non-GET requests
    echo json_encode(array("error" => "Only GET requests are supported"));
    http_response_code(405); // Method Not Allowed
}