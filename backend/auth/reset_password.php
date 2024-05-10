<?php
session_start();
require_once("../includes/connection.php");

// Check if request method is POST
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Retrieve and decode JSON data sent from Flutter
    $jsonData = file_get_contents('php://input');
    $data = json_decode($jsonData, true); // Decode JSON data into associative array

    // Check if JSON data was successfully parsed
    if ($data === null || !isset($data['password']) || !isset($data['confirm_password'])) {
        echo json_encode(array("message" => "Invalid JSON data received"));
        exit;
    }

    // Sanitize and validate input values
    $password = htmlspecialchars($data['password']);
    $confirmPassword = htmlspecialchars($data['confirm_password']);

    // Validate if new password matches confirm password
    if ($password !== $confirmPassword) {
        echo json_encode(array("message" => "New password and confirm password do not match"));
        exit;
    } else {
        // Get email from session
        $email = $_SESSION['resetEmail'];
        $hashedPassword = password_hash($password, PASSWORD_DEFAULT);

        try {
            // Update password in the database
            $stmt = $pdo->prepare("UPDATE users SET `password` = :password WHERE email = :email");
            $stmt->bindParam(':password', $hashedPassword, PDO::PARAM_STR);
            $stmt->bindParam(':email', $email, PDO::PARAM_STR);
            $stmt->execute();

            echo json_encode(array("message" => "Password updated successfully"));
            exit;
        } catch (PDOException $e) {
            // Handle database error
            echo json_encode(array("message" => "Failed to update password. " . $e->getMessage()));
            exit;
        }
    }
} else {
    echo json_encode(array("message" => "Invalid request method. Only POST requests are allowed"));
    exit;
}