<?php
require_once("./models/Database.php");
require_once("./models/News.php");

class NewsServices
{
    public function getAll()
    {
        try {
            $db = Database::connect();
            $sql = "SELECT * FROM news";
            $stmt = $db->query($sql);
            $newsArray = [];
            while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                $news = new News($row['title'], $row['content'], $row['image'], $row['category_id'], $row['created_at']);
                $news->setID($row['id']);
                array_push($newsArray, $news);
            }
            return $newsArray;
        } catch (PDOException $e) {
            echo '' . $e->getMessage();
            return null;
        }
    }

    public function getNewsDetail($id)
    {
        try {
            $db = Database::connect();
            $sql = 'SELECT * FROM news WHERE id = :id';
            $stmt = $db->prepare($sql);
            $stmt->bindParam(':id', $id, PDO::PARAM_INT);
            $stmt->execute();
            $row = $stmt->fetch(PDO::FETCH_ASSOC);
            if ($row) {
                $news = new News($row['title'], $row['content'], $row['image'], $row['category_id'], $row['created_at']);
                $news->setID($row['id']);
                return $news;
            }
        } catch (PDOException $e) {
            echo '' . $e->getMessage();
            return null;
        }
    }

    public function createNewArticle($title, $content, $image, $category_id, $created_at){
        try {
            $db = Database::connect();
            $sql = 'INSERT INTO news (title, content, image, category_id, created_at) VALUES (:title, :content, :image, :category_id, :created_at)';
            $stmt = $db->prepare($sql);
            $stmt->bindParam(':title', $title, PDO::PARAM_STR);
            $stmt->bindParam(':content', $content, PDO::PARAM_STR);
            $stmt->bindParam(':image', $iamge, PDO::PARAM_STR);
            $stmt->bindParam(':category_id', $category_id, PDO::PARAM_INT);
            $stmt->bindParam(':created_at', $created_at, PDO::PARAM_STR);
            $stmt->execute();

            // Lấy id của bản ghi vừa được thêm vào
            $id = $db->lastInsertId();

            // tạo đối tượng news mới
            $new_article = new News($title, $content, $image, $category_id, $created_at);
            $new_article->setID($id);
        } catch (PDOException $e) {
            echo ''. $e->getMessage();
        }
    }

    public function updateArticle($id, $title, $content, $image, $category_id, $created_at){
        try {
            $db = Database::connect();
            $sql = 'UPDATE FROM news SET title = :title, content = :content, image = :image, category_id = :category_id, created_at = :created_at WHERE id = :id';
            $stmt = $db->prepare($sql);
            $stmt->bindParam(':title', $title, PDO::PARAM_STR);
            $stmt->bindParam(':content', $content, PDO::PARAM_STR);
            $stmt->bindParam(':image', $content, PDO::PARAM_STR);
            $stmt->bindParam(':category_id', $content, PDO::PARAM_INT);
            $stmt->bindParam(':created_at', $content, PDO::PARAM_STR);
            $stmt->bindParam(':id', $content, PDO::PARAM_INT);
            $stmt->execute();
        } catch (PDOException $e) {
            echo ''. $e->getMessage();
        }
    }
    public function deleteArticle($id){
        try {
            $db = Database::connect();
            $sql = 'DELETE FROM news WHERE id = :id';   
            $stmt = $db->prepare($sql);
            $stmt->bindParam(':id', $id, PDO::PARAM_INT);
            $stmt->execute();
        } catch (PDOException $e) {
            echo ''. $e->getMessage();
        }
    }
}

?>