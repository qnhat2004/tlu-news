<?php
require_once("./models/Database.php");
require_once("./models/News.php");

class HomeService
{
    public function search($keyword)
    {
        try {
            $db = Database::connect();
            $sql = "SELECT * FROM news, categories WHERE news.category_id = categories.id AND (title LIKE :keyword OR content LIKE :keyword OR categories.name LIKE :keyword)";
            $stmt = $db->prepare($sql);
            $keyword = '%' . $keyword . '%';
            $stmt->bindParam(':keyword', $keyword, PDO::PARAM_STR);
            $stmt->execute();
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
}