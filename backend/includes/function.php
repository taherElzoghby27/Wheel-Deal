<?php

declare(strict_types=1);

require_once("connection.php");

// SignUp Functions
function is_input_empty(string $first_name, string $last_name, string $email, string $password, string $phone, string $age, string $gender, string $address, string $city, string $state) {
    if (empty($first_name)||empty($last_name||empty($email)||empty($password)||empty($phone)||empty($age)||empty($gender)||empty($address)||empty($city)||empty($state))) {
        return true;
    } else {
        return false;
    }
}

function invalid_first_name(string $first_name) {
    if (!preg_match('/^[a-zA-Z]+$/', $first_name)) {
        return true;
    } else {
        return false;
    }
}

function invalid_last_name(string $last_name) {
    if (!preg_match('/^[a-zA-Z]+$/', $last_name)) {
        return true;
    } else {
        return false;
    }
}

function invalid_email(string $email) {
    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        return true;
    } else {
        return false;
    }
}

function is_email_taken(string $email) {
    global $pdo;
    $Query  = "SELECT * FROM users WHERE email = :email";
    $stmt = $pdo->prepare($Query);
    $stmt->bindParam(':email', $email, PDO::PARAM_STR);
    $stmt->execute();
    $count = $stmt->fetchColumn();

// Check If Email For Someone Else

if ($count > 0)
{
    return true;
}
else
{
    return false;    
}
}

function invalid_password(string $password) {
    // Minimum length requirement
    $minLength = 8;
    
    // Regular expression pattern to enforce password rules
    $pattern = '/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{' . $minLength . ',}$/';

    // Check if password meets the length and pattern requirements
    if (strlen($password) < $minLength || !preg_match($pattern, $password)) {
        return true; // Invalid password
    } else {
        return false;
    }
}

function invalid_phone(string $phone) {
    if (strlen($phone) != 11 || !is_numeric($phone)) {
        return true;
    } else {
        return false;
    }
}

function invalid_age(string $age) {
    if (!is_numeric($age)) {
        return true;
    } else {
        return false;
    }
}

function same_pass(string $password, string $confirm_pwd) {
    if($password !== $confirm_pwd) {
        return true;
    } else {
        return false;
    }
}
