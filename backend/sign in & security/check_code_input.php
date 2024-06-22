<?php

/* this endpoint takes verification code token (generated from email_verify.php) 
input (inputCode)  */

require_once("../includes/connection.php"); // Include your database connection file
require __DIR__ . '/../vendor/autoload.php'; // Include JWT library

use Firebase\JWT\JWT;
use Firebase\JWT\Key;

if ($_SERVER['REQUEST_METHOD'] === 'POST') {

    // Check if the Authorization header is present and contains a valid JWT token
    $headers = apache_request_headers();
    $authorizationHeader = isset($headers['Authorization']) ? $headers['Authorization'] : null;

    if ($authorizationHeader && preg_match('/Bearer\s+(.*)$/i', $authorizationHeader, $matches)) {
        $token = $matches[1];
        // Decode and verify JWT token
        $Algorithm = 'HS256';
        $AlgorithmArray = [$Algorithm];
        $Code_Secret_Key = 'code_secret_key';
        $object = (object) $AlgorithmArray;
        $code_fetch__key = new Key($Code_Secret_Key, $Algorithm);
        $decoded = JWT::decode($token, $code_fetch__key, $object);
        $verificationCode = $decoded->verification_code;

        if ($verificationCode) {

            $inputCode = isset($_POST['inputCode']) ? $_POST['inputCode'] : null;
            if ($inputCode === $verificationCode) {

                http_response_code(200);
                echo json_encode(array("status" => "success", "Message" => "Input Code Successeded"));
            } else {
                http_response_code(401);
                echo json_encode(array("status" => "failed", "Message" => "Wrong Code. Please Enter The Right Code"));
            }

        } else {
            http_response_code(401);
            echo json_encode(array("status" => "failed", "Message" => "Unauthorized"));
        }



    } else {
        http_response_code(401);
        echo json_encode(array("status" => "failed", "Message" => "Unauthorized"));
    }

} else {
    http_response_code(405);
    echo json_encode(array("status" => "failed", "Message" => "Only POST Method is allowed"));
}