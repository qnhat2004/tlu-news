<?php
require_once ('./models/Category.php');
require_once ('./models/Database.php');

class CategoriesServices {
    public function getAll() {
        try {
            $db = Database::connect();
            $sql = 'SELECT * FROM categories';
            $stmt = $db->query($sql);
            $cateArray = [];
            while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                $category = new Category($row['id'], $row['name']);
                array_push($cateArray, $category);
            }
            return $cateArray;
        } catch (PDOException $e) {
            echo '' . $e->getMessage();
            return null;
        }
    }
    public function getCategoryNameById($id) {
        try {
            $db = Database::connect();
            $sql = 'SELECT name FROM categories WHERE id = :id';
            $stmt = $db->prepare($sql);
            $stmt->bindParam(':id', $id, PDO::PARAM_INT);
            $stmt->execute();
            $row = $stmt->fetch(PDO::FETCH_ASSOC);
            if ($row) {
                return $row['name'];
            }
        } catch (PDOException $e) {
            echo ''. $e->getMessage();
            return null;
        }
    }

    public function getAllNameCategory() {
        try {
            $db = Database::connect();
            $sql = 'SELECT name FROM categories';
            $stmt = $db->query($sql);
            $namesArray = [];
            while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                $namesArray[] = $row['name'];
            }
            return $namesArray;
        } catch (PDOException $e) {
            echo ''. $e->getMessage();
            return null;
        }
    }
}