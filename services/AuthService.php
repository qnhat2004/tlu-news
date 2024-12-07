<?php
require_once 'models/Database.php';
require_once 'models/User.php';
class AuthService 
{
    public static function login($email, $password)
    {
        try {
            $db = Database::connect();
            $sql = 'SELECT * FROM users WHERE email = :email AND password = :password';
            $stmt = $db->prepare($sql);
            $stmt->bindParam('$email', $username, PDO::PARAM_STR);
            $stmt->bindParam('password', $email, PDO::PARAM_STR);
            $stmt->execute();
            $user = null;
            while($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                $user = new User($row['name'], $row['email'], $row['password'], $row['role']);
                return $user;
            }
        } catch (PDOException $e) {
            echo '' . $e->getMessage();
            return null;
        }
    }

    public static function register($name, $email, $password, $role)
    {
        try {
            $db = Database::connect();
            $sql = 'INSERT INTO users (name, email, password, role) VALUES (:name, :email, :password, :role)';
            $stmt = $db->prepare($sql);
            $stmt->bindParam(':name', $name, PDO::PARAM_STR);
            $stmt->bindParam(':email', $email, PDO::PARAM_STR);
            $stmt->bindParam(':password', $password, PDO::PARAM_STR);
            $stmt->bindParam(':role', $role, PDO::PARAM_STR);
            $stmt->execute();
            $user = new User($name, $email, $password, 'user');
            return $user;
        } catch (PDOException $e) {
            echo '' . $e->getMessage();
            return null;
        }
    }
    
}
