<?php

require_once("../includes/connection.php");
require  ('../includes/autoload.php');
use Firebase\JWT\JWT;

// Grab Data From Inputs
$email = $_POST['email'] ?? '';
$password = $_POST['password'] ?? '';

// If Empty Fields
if (empty($email) || empty($password)) {
    echo json_encode(array("Message" => "Email and Password are required"));
} else {
    // Query if Inputs are not empty
    $sql = "SELECT * FROM users WHERE email = :email";
    $stmt = $pdo->prepare($sql);
    $stmt->bindParam(':email', $email, PDO::PARAM_STR);
    $stmt->execute();
    $user = $stmt->fetch(PDO::FETCH_ASSOC); // Fetch user data

    // If User Is Found
    if ($user) {
        // Check The Password
        if (password_verify($password, $user['password'])) {
            // Password Is Correct
           // echo json_encode(array("Message" => "Login Successful"));

            $secret_key = "your_secret_key";
            $issued_at = time();
            $expiration_time = $issued_at + 3600;  // token valid for 1 hour
            $payload = array(
                'user_id' => $user['user_id'],
                'email' => $user['email']
            );

            $token = JWT::encode($payload, $secret_key, 'HS256');
            setcookie("token", $token, $expiration_time, "/", "", true, true);
            // Return success response with JWT
        echo json_encode(array("Message" => "User submitted successfully", "jwt" => $token));
        } else {
            // Password is incorrect
            echo json_encode(array("Message" => "Password Is Incorrect"));
        }
    } else {
        // User not found
        echo json_encode(array("Message" => "User Not Found. Try Signing Up First"));
    }

    // Close statement and database connection
    $stmt->closeCursor();
    $pdo = null;
}