<?php

require_once("../includes/connection.php"); // Ensure this includes the database connection
require __DIR__ . '/../vendor/autoload.php';
use Firebase\JWT\JWT;


// Retrieve input data from POST request
$email = isset($_POST['email']) ? trim($_POST['email']) : '';
$phone = isset($_POST['phone']) ? trim($_POST['phone']) : '';
$age = isset($_POST['age']) ? intval($_POST['age']) : 0; // Convert age to an integer

// Validate inputs
if (empty($email) || empty($phone) || $age <= 0) {
    http_response_code(400); // Bad Request
    echo json_encode(array("Message" => "Please provide all required information."));
    exit();
}
if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
    http_response_code(400); // Bad Request
    echo json_encode(array("Message" => "Please provide a valid email."));
    exit();
}

try {
    // Check if email exists in the database
    $stmt = $pdo->prepare("SELECT * FROM users WHERE email = :email");
    $stmt->bindParam(':email', $email, PDO::PARAM_STR);
    $stmt->execute();
    $user = $stmt->fetch(PDO::FETCH_ASSOC); // Fetch user data

    if (!$user) {
        http_response_code(404); // Not Found
        echo json_encode(array("Message" => "Email not found."));
        exit();
    }

    // Check the age
    if ((int)$age !== (int)$user['age']) {
        http_response_code(400); // Bad Request
        echo json_encode(array("Message" => "Incorrect age."));
        exit();
    }

    // Check last three digits of phone number
    $expected_last_digits = substr($user['phone'], -3);

    if ($expected_last_digits !== $phone) {
        http_response_code(400); // Bad Request
        echo json_encode(array("Message" => "Incorrect phone."));
        exit();
    }

    // If all checks pass, return success message and store email in session
        $password_Secret_Key = "secret_key_for_update_password";
        $issued_at = time();
        $expiration_time = $issued_at + 3600;  // Token valid for 1 hour

        // Prepare JWT payload
        $payload = array(

                'email' => $email
        );

        // Generate JWT
        $token = JWT::encode($payload, $password_Secret_Key, 'HS256');
        setcookie("token", $token, $expiration_time, "/", "", true, true);
        http_response_code(200); // OK
        echo json_encode(array("Message" => "You can reset your password now.", "jwt" => $token));
    exit();

} catch (PDOException $e) {
    // Handle database errors
    http_response_code(500); // Internal Server Error
    echo json_encode(array("Message" => "Database error: " . $e->getMessage()));
    exit();
}