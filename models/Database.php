<?php
class Database {
    public static function connect() {
        $host = 'localhost';
        $dbname = 'news-reading';
        $username = 'root';
        $password = '';
        $option = [
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
        ];
        try {
            $db = new PDO("mysql:host=$host;dbname=$dbname", $username, $password, $option);
        } catch (PDOException $e) {
            echo ''. $e->getMessage();
            exit();
        }
    }
}
