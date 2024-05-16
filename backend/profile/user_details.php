<?php
// Include database connection
require_once '../includes/connection.php';

// Check for token in headers
$headers = apache_request_headers();
if (!isset($headers['Authorization'])) {
    http_response_code(401);
    echo json_encode(array('message' => 'Authorization token is missing'));
    exit();
}

$token = $headers['Authorization'];

// Validate the token (You would typically implement your token validation logic here)

// Function to fetch user profile from database
function getUserProfile($userId, $pdo) {
    $sql = "SELECT * FROM profiles WHERE user_id = :userId";
    $stmt = $pdo->prepare($sql);
    $stmt->bindParam(':userId', $userId, PDO::PARAM_INT);
    $stmt->execute();

    $profile = $stmt->fetch(PDO::FETCH_ASSOC);
    return $profile;
}

// Check if a user ID is provided in the request
if (isset($_GET['user_id'])) {
    $userId = $_GET['user_id'];

    // Fetch user profile
    $profile = getUserProfile($userId, $pdo);

    if ($profile) {
        // Return profile data as JSON response
        header('Content-Type: application/json');
        echo json_encode($profile);
    } else {
        // User not found
        http_response_code(404);
        echo json_encode(array('message' => 'User not found'));
    }
} else {
    // User ID parameter not provided
    http_response_code(400);
    echo json_encode(array('message' => 'User ID parameter is required'));
}