<?php

/* this endpoint takes user token
 inputs (password , new_password, confirm_new_password) */

require_once("../includes/connection.php"); // Include your database connection file
require_once("../includes/function.php");
require __DIR__ . '/../vendor/autoload.php'; /// Include JWT library

// Set content type to JSON
header('Content-Type: application/json');

use Firebase\JWT\JWT;
use Firebase\JWT\Key;

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Check if the Authorization header is present and contains a valid JWT token
    $headers = apache_request_headers();
    $authorizationHeader = isset($headers['Authorization']) ? $headers['Authorization'] : null;

    if ($authorizationHeader && preg_match('/Bearer\s+(.*)$/i', $authorizationHeader, $matches)) {
        $token = $matches[1];
        // Decode and verify JWT token
        $Algorithm = 'HS256';
        $AlgorithmArray = [$Algorithm];
        $Secret_Key = 'your_secret_key';
        $object = (object) $AlgorithmArray;
        $email_fetch_key = new Key($Secret_Key, $Algorithm);
        $decoded = JWT::decode($token, $email_fetch_key, $object);
        $user_id = $decoded->user_id;

        $password = isset($_POST['password']) ? $_POST['password'] : '';
        $new_password = isset($_POST['new_password']) ? $_POST['new_password'] : '';
        $confirm_new_password = isset($_POST['confirm_new_password']) ? $_POST['confirm_new_password'] : '';

        if (!$password) {
            http_response_code(400); // Bad Request
            echo json_encode(["status" => "failed", "Message" => 'Password is required']);
            exit;
        }

        if (!$new_password) {
            http_response_code(400); // Bad Request
            echo json_encode(["status" => "failed", "Message" => 'New Password is required']);
            exit;
        }

        if (!$confirm_new_password) {
            http_response_code(400); // Bad Request
            echo json_encode(["status" => "failed", "Message" => 'Confirm NewPassword is required']);
            exit;
        }

        if (invalid_password($new_password)) {
            http_response_code(400); // Bad Request
            echo json_encode(["status" => "failed", "Message" => 'Invalid new password. Password must be at least 8 characters long and contain at least one uppercase letter, one lowercase letter, and one digit.']);
            exit;
        }

        if (same_pass($new_password, $confirm_new_password)) {
            http_response_code(400); // Bad Request
            echo json_encode(["status" => "failed", "Message" => 'New Password and Confirm Password Must be Same']);
            exit;
        }

        $selectQuery = $pdo->prepare("SELECT * FROM users WHERE user_id = :user_id");
        $selectQuery->bindParam(':user_id', $user_id, PDO::PARAM_INT);
        $selectQuery->execute();
        $old_password = $selectQuery->fetch(PDO::FETCH_ASSOC);

        if (!$old_password || !password_verify($password, $old_password['password'])) {
            http_response_code(400); // Bad Request
            echo json_encode(["status" => "failed", "Message" => 'Please Enter The Password Is Assigned To This Account']);
            exit;
        } else {
            // Hash the password
            $hashed_password = password_hash($new_password, PASSWORD_DEFAULT);

            // Update email in the database
            $stmt = $pdo->prepare("UPDATE users SET `password` = :hashed_password WHERE user_id = :user_id");
            $stmt->bindParam(':hashed_password', $hashed_password, PDO::PARAM_STR);
            $stmt->bindParam(':user_id', $user_id, PDO::PARAM_INT);

            if ($stmt->execute()) {
                http_response_code(200);
                echo json_encode(["status" => "success", "Message" => 'Password is updated']);
            } else {
                http_response_code(500);
                echo json_encode(["status" => "failed", "Message" => 'Something Went Wrong']);
            }
        }

    } else {
        // Missing or invalid Authorization header
        http_response_code(401); // Unauthorized
        echo json_encode(array("status" => "failed", "Message" => "Unauthorized"));
    }

} else {
    // Invalid HTTP method
    http_response_code(405); // Method Not Allowed
    echo json_encode(array("status" => "failed", "Message" => "Only POST Method is allowed"));
}