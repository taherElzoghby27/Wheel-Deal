<?php
require_once("../includes/connection.php"); // Include database connection
require_once("../includes/function.php"); // Include validation functions
require __DIR__ . '/../vendor/autoload.php';
use Firebase\JWT\JWT;

// Fetch input data from POST request
$first_name = $_POST['first_name'] ?? '';
$last_name = $_POST['last_name'] ?? '';
$email = $_POST['email'] ?? '';
$password = $_POST['password'] ?? '';
$confirm_pwd = $_POST['confirm_pwd'] ?? '';
$phone = $_POST['phone'] ?? '';
$age = $_POST['age'] ?? '';
$gender = $_POST['gender'] ?? '';
$address = $_POST['user_address'] ?? '';
$city = $_POST['city'] ?? '';
$state = $_POST['states'] ?? '';

// Validate input data
$errors = [];

if (is_input_empty($first_name, $last_name, $email, $password, $phone, $age, $gender, $address, $city, $state)) {
    $errors[] = ["message" => "All fields are required."];
}

if (invalid_first_name($first_name)) {
    $errors[] = ["message" => "Invalid first name. Only alphabetic characters are allowed."];
}

if (invalid_last_name($last_name)) {
    $errors[] = ["message" => "Invalid last name. Only alphabetic characters are allowed."];
}

if (invalid_email($email)) {
    $errors[] = ["message" => "Invalid email address."];
}

if (is_email_taken($email)) {
    $errors[] = ["message" => "Email address is already in use."];
}

if (invalid_password($password)) {
    $errors[] = ["message" => "Invalid password. Password must be at least 8 characters long and contain at least one uppercase letter, one lowercase letter, and one digit."];
}

if (invalid_phone($phone)) {
    $errors[] = ["message" => "Invalid phone number. Phone number must be 11 digits and contain only numeric characters."];
}

if (invalid_age($age)) {
    $errors[] = ["message" => "Invalid age. Please enter a valid numeric age."];
}

if (same_pass($password, $confirm_pwd)) {
    $errors[] = ["message" => "Passwords do not match."];
}

// If there are validation errors, return error response
if (!empty($errors)) {
    http_response_code(400);
    echo json_encode($errors);
    exit;
}

// Hash the password
$hashed_password = password_hash($password, PASSWORD_DEFAULT);

try {
    // Insert user data into the database
    $sql = "INSERT INTO users (first_name, last_name, email, `password`, phone, age, gender, user_address, city, states) 
            VALUES (:first_name, :last_name, :email, :password, :phone, :age, :gender, :user_address, :city, :states)";
    $stmt = $pdo->prepare($sql);

    $stmt->bindParam(':first_name', $first_name, PDO::PARAM_STR);
    $stmt->bindParam(':last_name', $last_name, PDO::PARAM_STR);
    $stmt->bindParam(':email', $email, PDO::PARAM_STR);
    $stmt->bindParam(':password', $hashed_password, PDO::PARAM_STR);
    $stmt->bindParam(':phone', $phone, PDO::PARAM_STR);
    $stmt->bindParam(':age', $age, PDO::PARAM_INT);
    $stmt->bindParam(':gender', $gender, PDO::PARAM_STR);
    $stmt->bindParam(':user_address', $address, PDO::PARAM_STR);
    $stmt->bindParam(':city', $city, PDO::PARAM_STR);
    $stmt->bindParam(':states', $state, PDO::PARAM_STR);

    if ($stmt->execute()) {
        // User inserted successfully
        $user_id = $pdo->lastInsertId(); // Get the last inserted user ID

        $secret_key = "your_secret_key";
        $issued_at = time();
        $expiration_time = $issued_at + 60 * 60 * 24 * 7;  // Token valid for 1 week

        // Prepare JWT payload
        $payload = array(
            'user_id' => $user_id,
            'email' => $email
        );

        // Generate JWT
        $token = JWT::encode($payload, $secret_key, 'HS256');
        setcookie("token", $token, $expiration_time, "/", "", true, true);

        // Return success response with JWT
        http_response_code(200);
        echo json_encode(array("Message" => "User submitted successfully", "jwt" => $token));
    } else {
        // Failed to insert user
        http_response_code(500);
        echo json_encode(["error" => "Failed to insert user."]);
    }
} catch (PDOException $e) {
    // Database error
    http_response_code(500);
    echo json_encode(["error" => "Database error: " . $e->getMessage()]);
}