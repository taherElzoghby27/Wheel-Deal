<?php
require_once("../includes/connection.php");

if ($_SERVER["REQUEST_METHOD"] == 'GET') {

    try {
        // Set the number of records per page
        $results_per_page = 10;

        // Get the current page number from the query string, default is 1
        $page = isset($_GET['page']) && is_numeric($_GET['page']) ? (int)$_GET['page'] : 1;
        
        // Calculate the starting record for the current page
        $start_from = ($page - 1) * $results_per_page;

        // Query to count the total number of records
        $sql_count = "SELECT COUNT(*) FROM cars";
        $stmt_count = $pdo->prepare($sql_count);
        $stmt_count->execute();
        $total_records = $stmt_count->fetchColumn();
        
        // Calculate total pages
        $total_pages = ceil($total_records / $results_per_page);

        // Prepare SQL query to fetch car data with LIMIT and OFFSET for pagination
        $sql = "SELECT car_id, brand, model, body_type, price, image_path FROM cars LIMIT :start_from, :results_per_page";
        
        // Prepare and execute the SQL query
        $stmt = $pdo->prepare($sql);
        $stmt->bindValue(':start_from', $start_from, PDO::PARAM_INT);
        $stmt->bindValue(':results_per_page', $results_per_page, PDO::PARAM_INT);
        $stmt->execute();

        // Fetch car data
        $cars = $stmt->fetchAll(PDO::FETCH_ASSOC);

        // Check if data was found
        if ($cars) {
            // Prepare pagination links
            $base_url = 'http://localhost/CarTrading/backend/home/cars.php'; // Change to your actual API endpoint
            $prev_page = $page > 1 ? $base_url . '?page=' . ($page - 1) : null;
            $next_page = $page < $total_pages ? $base_url . '?page=' . ($page + 1) : null;

            // Prepare JSON response with pagination info
            $response = array(
                "status" => "success",
                "pagination" => array(
                    "current_page" => $page,
                    "total_pages" => $total_pages,
                    "total_records" => $total_records,
                    "results_per_page" => $results_per_page,
                    "prev_page" => $prev_page,
                    "next_page" => $next_page
                ),
                "data" => $cars
            );
            // Set HTTP response code to 200 (OK)
            http_response_code(200);
        } else {
            // No data found
            $response = array("status" => "failed", "Message" => "No cars found.");
            // Set HTTP response code to 404 (Not Found)
            http_response_code(404);
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
    echo json_encode(array("status" => "failed", "Message" => "Only GET Method Is Allwoed"));
}