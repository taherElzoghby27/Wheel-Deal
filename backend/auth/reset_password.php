<?php
require_once("../includes/connection.php");

// Check if request method is POST
if ($_SERVER['REQUEST_METHOD'] === 'POST') {

    $data = json_decode(file_get_contents("php://input"));

    if (isset($data->email) && isset($data->new_password) && isset($data->confirm_password)) {
        $email = $data->email;
        $newPassword = $data->new_password;
        $confirmPassword = $data->confirm_password;

        // Validate if new password matches confirm password
        if ($newPassword !== $confirmPassword) {

            echo json_encode(array("message" => "New password and confirm password do not match"));
            exit;
        }

        // Hash the new password
        $hashedNewPassword = password_hash($newPassword, PASSWORD_DEFAULT);

        // Update password in the database
        $stmt = $pdo->prepare("UPDATE users SET `password` = :`password` WHERE email = :email");
        $stmt->bindParam(':password', $hashedNewPassword);
        $stmt->bindParam(':email', $email);

        try {
            $stmt->execute();

            // Check if update was successful
            if ($stmt->rowCount() > 0) {
               
                echo json_encode(array("message" => "Password updated successfully"));
            } else {
             
                echo json_encode(array("message" => "User not found"));
            }
        } catch (PDOException $e) {
           
            echo json_encode(array("message" => "Database error: " . $e->getMessage()));
        }
    } else {
     
        echo json_encode(array("message" => "Invalid input data"));
    }
} else {
   
    echo json_encode(array("message" => "Method not allowed"));
}