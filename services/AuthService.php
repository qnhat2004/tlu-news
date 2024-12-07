<?php
require_once 'models/Database.php';
require_once 'models/User.php';
class AuthService 
{
    public function login($email, $password)
    {
        try {
            $db = Database::connect();
            $sql = 'SELECT * FROM users WHERE email = :email';
            $stmt = $db->prepare($sql);
            $stmt->bindParam(':email', $email, PDO::PARAM_STR);
            $stmt->execute();
            $row = $stmt->fetch(PDO::FETCH_ASSOC);
            if($row && password_verify($password, $row['password'])) {
                return new User($row['name'], $row['email'], $row['password'], $row['role']);
            }
        } catch (PDOException $e) {
            echo '' . $e->getMessage();
            return null;
        }
    }

    public function register($name, $email, $password, $role)
    {
        try {
            $db = Database::connect();
            $hashedPassword = password_hash($password, PASSWORD_DEFAULT);
            $sql = 'INSERT INTO users (name, email, password, role) VALUES (:name, :email, :password, :role)';
            $stmt = $db->prepare($sql);
            $stmt->bindParam(':name', $name, PDO::PARAM_STR);
            $stmt->bindParam(':email', $email, PDO::PARAM_STR);
            $stmt->bindParam(':password', $hashedPassword, PDO::PARAM_STR);
            $stmt->bindParam(':role', $role, PDO::PARAM_STR);
            return $stmt->execute();
        } catch (PDOException $e) {
            echo '' . $e->getMessage();
            return null;
        }
    }
    
}
