<?php

/* this endpoint takes user token
 inputs (email , password) */

require_once("../includes/connection.php"); // Include your database connection file
require_once("../includes/function.php");
require __DIR__ . '/../vendor/autoload.php'; // Include JWT library

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

        // Function to validate the email format
        function isValidEmail($new_email) {
            return filter_var($new_email, FILTER_VALIDATE_EMAIL);
        }

         // Get the inputs from the request
         $email = isset($_POST['email']) ? $_POST['email'] : '';
         $password = isset($_POST['password']) ? $_POST['password'] : '';

         if (!$email) {
            http_response_code(400); // Bad Request
            echo json_encode(["status" => "failed", "Message" => 'Email is required']);
            exit;
        }

        if (!$password) {
            http_response_code(400); // Bad Request
            echo json_encode(["status" => "failed", "Message" => 'Password is required']);
            exit;
        }

        if (!isValidEmail($email)) {
            http_response_code(400); // Bad Request
            echo json_encode(["status" => "failed", "Message" => 'Invalid email format']);
            exit;
        }

        if (is_email_taken($email)) {
            http_response_code(400); // Bad Request
            echo json_encode(["status" => "failed", "Message" => 'Email is already taken']);
            exit;
        }

        if (invalid_password($password)) {
            http_response_code(400); // Bad Request
            echo json_encode(["status" => "failed", "Message" => 'Invalid password. Password must be at least 8 characters long and contain at least one uppercase letter, one lowercase letter, and one digit.']);
            exit;
        }

        // Update email in the database
        $stmt = $pdo->prepare("UPDATE users SET email = :email WHERE user_id = :user_id");
        $stmt->bindParam(':email', $email, PDO::PARAM_STR);
        $stmt->bindParam(':user_id', $user_id, PDO::PARAM_INT);

        if ($stmt->execute()) {
            http_response_code(200);
            echo json_encode(["status" => "success", "Message" => 'Email is updated']);
        } else {
            http_response_code(500);
            echo json_encode(["status" => "failed", "Message" => 'Something Went Wrong']);
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