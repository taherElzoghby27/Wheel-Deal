<?php
session_start();
require_once("../includes/connection.php");

// Check if request method is POST
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Retrieve input data from POST request
    $password = isset($_POST['password']) ? htmlspecialchars($_POST['password']) : '';
    $confirmPassword = isset($_POST['confirm_password']) ? htmlspecialchars($_POST['confirm_password']) : '';

    // Validate if new password matches confirm password
    if ($password !== $confirmPassword) {
        http_response_code(400); // Bad Request
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

            http_response_code(200); // OK
            echo json_encode(array("message" => "Password updated successfully"));
            exit;
        } catch (PDOException $e) {
            // Handle database error
            http_response_code(500); // Internal Server Error
            echo json_encode(array("message" => "Failed to update password. " . $e->getMessage()));
            exit;
        }
    }
} else {
    http_response_code(405); // Method Not Allowed
    echo json_encode(array("message" => "Invalid request method. Only POST requests are allowed"));
    exit;
}