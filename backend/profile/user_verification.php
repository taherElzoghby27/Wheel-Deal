<?php

/* this endpoint takes user token
 input (image) */

require_once("../includes/connection.php"); // Include your database connection file
require __DIR__ . '/../vendor/autoload.php'; // Include JWT library

// Set content type to JSON
header('Content-Type: application/json');

use Firebase\JWT\JWT;
use Firebase\JWT\Key;


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
    $favourite_key = new Key($Secret_Key, $Algorithm);
    $decoded = JWT::decode($token, $favourite_key, $object);
    $user_id = $decoded->user_id;

    if ($user_id) {

        if ($_SERVER['REQUEST_METHOD'] === 'POST') { 

            try {
                
                if (isset($_FILES['image'])) {

                    $image = $_FILES['image'];

                    // Check for errors
                    if ($image['error'] !== UPLOAD_ERR_OK) {
                        throw new Exception('File upload error!');
                    }

                    // Validate the file type (e.g., only allow jpg, png)
                    $allowedTypes = ['image/jpeg', 'image/png'];
                    if (!in_array($image['type'], $allowedTypes)) {
                        throw new Exception('Invalid file type!');
                    }

                    // Define the upload directory
                    $uploadDir = 'C:\\xampp\\htdocs\\CarTrading\\backend\\user_verification\\';
                    if (!is_dir($uploadDir)) {
                        mkdir($uploadDir, 0777, true);
                    }

                    // Generate a unique file name
                    $filename = uniqid() . '_' . basename($image['name']);
                    $targetFile = $uploadDir . $filename;

                    // Move the file to the upload directory
                    if (!move_uploaded_file($image['tmp_name'], $targetFile)) {
                        throw new Exception('Failed to move uploaded file!');
                    }

                    // Insert the file path into the database
                    $stmt = $pdo->prepare('INSERT INTO provement (user_id, file_path) VALUES (:user_id,:file_path)');

                    $stmt->execute(['user_id' => $user_id, 'file_path' => $targetFile]);

                    http_response_code(200);
                    echo json_encode(array("status" => "success", 'Message' => 'File uploaded successfully!', 'file_path' => $targetFile));
                
                } else {

                    http_response_code(400);
                    echo json_encode(['status' => 'failed', 'Message' => 'No file uploaded!']);
                }

            } catch (Exception $e) {

                http_response_code(500);
                echo json_encode(['error' => $e->getMessage()]);
            }

        } else {

            http_response_code(405);
            echo json_encode(array("status" => "failed", "Message" => "Only POST Method is allowed"));
        }

    } else {

        http_response_code(401);
        echo json_encode(array("status" => "failed", "Message" => "Unauthorized User"));

    }

} else {

    http_response_code(401);
    echo json_encode(array("status" => "failed", "Message" => "Unauthorized"));
}
