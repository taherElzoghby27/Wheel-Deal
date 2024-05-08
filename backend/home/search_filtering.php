<?php
require_once("../includes/connection.php");

if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    
    $sql = "SELECT car_id, condition, brand, model, body_type, price, image_path FROM cars WHERE 1 = 1";

    $params = array(); // Array to hold parameters for prepared statement

    // Check if 'condition' parameter is provided (used/new)
    if (isset($_GET['condition']) && ($_GET['condition'] === 'used' || $_GET['condition'] === 'new')) {
        $sql .= " AND `condition` = :condition";
        $params['condition'] = $_GET['condition'];
    }

    // Check if 'brand' parameter is provided
    if (isset($_GET['brand'])) {
        $sql .= " AND brand = :brand";
        $params['brand'] = $_GET['brand'];
    }

    // Check if 'body_type' parameter is provided (filtered by selected brand)
    if (isset($_GET['brand']) && isset($_GET['body_type'])) {
        $sql .= " AND body_type = :body_type";
        $params['body_type'] = $_GET['body_type'];
    }

    // Check for price range
    if (isset($_GET['min_price']) && isset($_GET['max_price'])) {
        $sql .= " AND price BETWEEN :min_price AND :max_price";
        $params['min_price'] = $_GET['min_price'];
        $params['max_price'] = $_GET['max_price'];
    }

    // Check for specific features
    $features = array(
        'airbag', 'touch_screen', 'air_conditioner',
        'brake_assist', 'navigation_system', 'connectivity',
        'remote_engine_start_stop'
    );

    foreach ($features as $feature) {
        if (isset($_GET[$feature])) {
            $sql .= " AND $feature = :$feature";
            $params[$feature] = ($_GET[$feature] === 'true') ? 1 : 0;
        }
    }

    // Prepare SQL statement
    $stmt = $pdo->prepare($sql);

    foreach ($params as $paramName => &$paramValue) {
        $stmt->bindParam(':' . $paramName, $paramValue);
    }

    $stmt->execute();

    // Fetch all matching cars
    $results = $stmt->fetchAll(PDO::FETCH_ASSOC);

    echo json_encode($results);
} else {
    
    echo json_encode(array("error" => "Please provide at least one filtering criteria"));
}