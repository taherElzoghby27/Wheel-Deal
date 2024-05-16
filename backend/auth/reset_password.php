<?php

require_once("../includes/connection.php"); // Include your database connection file
require __DIR__ . '/../vendor/autoload.php'; // Include Composer autoload to load JWT library
use Firebase\JWT\JWT;
use Firebase\JWT\Key;

// Check if request method is POST
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Retrieve input data from POST request
    $password = isset($_POST['password']) ? $_POST['password'] : '';
    $confirmPassword = isset($_POST['confirm_password']) ? $_POST['confirm_password'] : '';

    // Validate if new password matches confirm password
    if ($password !== $confirmPassword) {
        http_response_code(400); // Bad Request
        echo json_encode(array("Message" => "New password and confirm password do not match"));
        exit;
    }


    // Extract token from Authorization header
    $headers = apache_request_headers();
    if (isset($headers['Authorization']) && preg_match('/Bearer\s(\S+)/', $headers['Authorization'], $matches)) {
        $token = $matches[1]; // Extract JWT token
    } else {
        http_response_code(401); // Unauthorized
        echo json_encode(array("Message" => "Authorization header missing or invalid"));
        exit;
    }

    try {
        // Decode and verify JWT token
    $Algorithm = 'HS256';
    $AlgorithmArray = [$Algorithm];
    $password_Secret_Key = 'secret_key_for_update_password';
    $object = (object) $AlgorithmArray;
    $key = new Key($password_Secret_Key, $Algorithm);
    $decoded = JWT::decode($token, $key, $object);
    $email = $decoded->email;

        // Hash the new password
        $hashedPassword = password_hash($password, PASSWORD_DEFAULT);

        // Update password in the database
        $stmt = $pdo->prepare("UPDATE users SET `password` = :password WHERE email = :email");
        $stmt->bindParam(':password', $hashedPassword, PDO::PARAM_STR);
        $stmt->bindParam(':email', $email, PDO::PARAM_STR);
        $stmt->execute();

        http_response_code(200); // OK
        echo json_encode(array("Message" => "Password updated successfully"));
        exit;
    } catch (Exception $e) {
        http_response_code(401); // Unauthorized
        echo json_encode(array("Message" => "Invalid token. " . $e->getMessage()));
        exit;
    }
} else {
    http_response_code(405); // Method Not Allowed
    echo json_encode(array("Message" => "Invalid request method. Only POST requests are allowed"));
    exit;
}