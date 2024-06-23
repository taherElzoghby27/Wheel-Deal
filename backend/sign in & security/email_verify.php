<?php

/* this endpoint takes user token and input (email) and generate token ($jwt) */

require_once("../includes/connection.php"); // Include your database connection file
require __DIR__ . '/../vendor/autoload.php'; // Include JWT library

// Set content type to JSON
header('Content-Type: application/json');

use Firebase\JWT\JWT;
use Firebase\JWT\Key;
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Check if the Authorization header is present and contains a valid JWT token
    $headers = apache_request_headers();
    $authorizationHeader = isset($headers['Authorization']) ? $headers['Authorization'] : null;

    if ($authorizationHeader && preg_match('/Bearer\s+(.*)$/i', $authorizationHeader, $matches)) {
        $token = $matches[1];
        // Decode and verify JWT token
        $Algorithm = 'HS256';
        $AlgorithmArray = [$Algorithm];
        $Secret_Key = 'your_secret_key';
        $object = (object) $AlgorithmArray;
        $email_fetch_key = new Key($Secret_Key, $Algorithm);
        $decoded = JWT::decode($token, $email_fetch_key, $object);
        $token_email = $decoded->email;

        // Function to validate the email format
        function isValidEmail($email) {
            return filter_var($email, FILTER_VALIDATE_EMAIL);
        }

        // Function to generate a random verification code
        function generateVerificationCode($length = 4) {
            return substr(str_shuffle("0123456789"), 0, $length);
        }

        // Function to send the verification code via email using PHPMailer
        function sendVerificationCode($email, $code, $token_email) {
            $mail = new PHPMailer(true);
            try {
                global $token_email;
                //Server settings
                $mail->isSMTP();                                        // Send using SMTP
                $mail->Host       = 'smtp.gmail.com';                 // Set the SMTP server to send through
                $mail->SMTPAuth   = true;                               // Enable SMTP authentication
                $mail->Username   = 'demoCarTrading@gmail.com';           // SMTP username
                $mail->Password   = 'ojlpkrssieynocoj';              // SMTP password
                $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;     // Enable TLS encryption; PHPMailer::ENCRYPTION_SMTPS also accepted
                $mail->Port       = 587;                                // TCP port to connect to

                //Recipients
                $mail->setFrom('demoCarTrading@gmail.com', 'WHEEL DEAL');
                $mail->addAddress($email);                              // Add a recipient

                // Content
                $mail->isHTML(true);                                    // Set email format to HTML
                $mail->Subject = 'Your Verification Code';
                $mail->Body    = "Your verification code is: $code";

                $mail->send();
                return true;
            } catch (Exception $e) {
                echo "Mailer Error: " . $mail->ErrorInfo;
                return false;
            }
        }

        // Get the email from the request
        $email = isset($_POST['email']) ? $_POST['email'] : '';

        if (!$email) {
            http_response_code(400); // Bad Request
            echo json_encode(["status" => "failed", "Message" => 'Email is required']);
            exit;
        }

        if (!isValidEmail($email)) {
            http_response_code(400); // Bad Request
            echo json_encode(["status" => "failed", "Message" => 'Invalid email format']);
            exit;
        }

        if ($email !== $token_email) {
            http_response_code(403); // Forbidden
            echo json_encode(["status" => "failed", "Message" => "Please Enter the Email That Assign To This Account"]);
            exit;
        } else {
            // Generate a verification code
            $verificationCode = generateVerificationCode();
            // Set the JWT payload
            $payload = array(
                "verification_code" => $verificationCode,
                "email" => $email
            );
            // Encode the payload to create the JWT
            $Code_Secret_Key = 'code_secret_key';
            $jwt = JWT::encode($payload, $Code_Secret_Key, 'HS256');
            setcookie("token", $token, 0, "/", "", true, true);

            // Send the verification code
            if (sendVerificationCode($email, $verificationCode, $token_email)) {
                http_response_code(200); // OK
                echo json_encode(["status" => "success", "jwt" => $jwt]);
            } else {
                http_response_code(500); // Internal Server Error
                echo json_encode(["status" => "failed", "Message" => 'Failed to send verification code']);
            }
        }


    } else {
        // Missing or invalid Authorization header
        http_response_code(401); // Unauthorized
        echo json_encode(array("status" => "failed", "Message" => "Unauthorized"));
    }

} else {
    // Invalid HTTP method
    http_response_code(405); // Method Not Allowed
    echo json_encode(array("status" => "failed", "Message" => "Only POST Method is allowed"));
}