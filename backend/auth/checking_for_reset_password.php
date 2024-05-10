<?php
session_start();

require_once("../includes/connection.php"); // Ensure this includes the database connection

// Retrieve and decode JSON data sent from Flutter
$jsonData = file_get_contents('php://input');
$data = json_decode($jsonData, true); // Decode JSON data into associative array

// Check if JSON data was successfully parsed
if ($data === null) {
    echo json_encode(array("Message" => "Invalid JSON data received."));
    exit();
}

// Sanitize and validate input values
$email = isset($data['email']) ? trim($data['email']) : '';
$phone = isset($data['phone']) ? trim($data['phone']) : '';
$age = isset($data['age']) ? intval($data['age']) : 0; // Convert age to an integer

// Validate inputs
if (empty($email) || empty($phone) || $age <= 0) {
    echo json_encode(array("Message" => "Please provide all required information."));
    exit();
}
if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
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
        echo json_encode(array("Message" => "Email not found."));
        exit();
    }

    // Check the age
    if ((int)$age !== (int)$user['age']) {
        echo json_encode(array("Message" => "Incorrect age."));
        exit();
    }

    // Check last three digits of phone number
    $expected_last_digits = substr($user['phone'], -3);

    if ($expected_last_digits !== $phone) {
        echo json_encode(array("Message" => "Incorrect phone."));
        exit();
    }

    // If all checks pass, return success message and store email in session
    $_SESSION['resetEmail'] = $email;
    echo json_encode(array("Message" => "You can reset your password now."));
    exit();

} catch (PDOException $e) {
    // Handle database errors
    echo json_encode(array("Message" => "Database error: " . $e->getMessage()));
    exit();
}