<?php
require_once("../includes/connection.php");
require __DIR__ . '/../vendor/autoload.php';
use Firebase\JWT\JWT;

// Retrieve input data from POST request
$email = $_POST['email'] ?? '';
$password = $_POST['password'] ?? '';

// Check if email and password are provided
if (empty($email) || empty($password)) {
    http_response_code(400);
    echo json_encode(array("Message" => "Email and Password are required"));
    exit;
}

try {
    // Query user by email
    $sql = "SELECT * FROM users WHERE email = :email";
    $stmt = $pdo->prepare($sql);
    $stmt->bindParam(':email', $email, PDO::PARAM_STR);
    $stmt->execute();
    $user = $stmt->fetch(PDO::FETCH_ASSOC); // Fetch user data

    // If user is found
    if ($user) {
        // Verify the password
        if (password_verify($password, $user['password'])) {
            // Password is correct
            $secret_key = "your_secret_key";
            $issued_at = time();

            // Prepare JWT payload
            $payload = array(
                'user_id' => $user['user_id'],
                'email' => $user['email'],
                'iat' => $issued_at
            );

            // Generate JWT
            $token = JWT::encode($payload, $secret_key, 'HS256');
            setcookie("token", $token, 0, "/", "", true, true);

            // Return success response with JWT
            http_response_code(200);
            echo json_encode(array("Message" => "Login Successful", "jwt" => $token));
        } else {
            // Password is incorrect
            http_response_code(401);
            echo json_encode(array("Message" => "Password Is Incorrect"));
        }
    } else {
        // User not found
        http_response_code(404);
        echo json_encode(array("Message" => "User Not Found. Try Signing Up First"));
    }
} catch (PDOException $e) {
    // Database error
    http_response_code(500);
    echo json_encode(array("Message" => "Database Error: " . $e->getMessage()));
}