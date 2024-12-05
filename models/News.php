<?php
require 'models/Database.php';

class News {
    public static function getAll() {
        $db = Database::connect();
        $stmt = $db->prepare("SELECT * FROM news");
        return $stmt->fetchAll();
    }

    public static function getById($id) {
        $db = Database::connect();
        $stmt = $db->prepare("SELECT * FROM news WHERE id = ?");
        $stmt->execute([$id]);
        return $stmt->fetch();
    }
}
?>