<?php
session_start();
require_once("../includes/connection.php");

// Check if request method is POST
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $password = htmlspecialchars($_POST['password']);
    $confirmPassword = htmlspecialchars($_POST['confirm_password']);

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
}