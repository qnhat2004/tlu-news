<?php 
    require_once ("./models/Database.php");
    require_once ("./models/News.php");

    class NewsServices {
        public function getAllNews() {
            try {
                $db = Database::connect();
                $sql = "SELECT * FROM news";
                $stmt = $db->query($sql);
                $newsArray = [];
                while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                    $news = new News($row['id'], $row['title'], $row['content'], $row['image'], $row['category_id'], $row['created_at'], $row['deleted_at']);
                    array_push($newsArray, $news);
                }
                return $newsArray;
            } catch (PDOException $e) {
                echo ''. $e->getMessage();
                return null;
            }
        }

        public function getNewsDetail($id) {
            try {
            $db = Database::connect();
            $sql = 'SELECT * FROM news WHERE id = :id';
            $stmt = $db->prepare($sql);
            $stmt->bindParam(':id', $id, PDO::PARAM_INT);
            $stmt->execute();
            $row = $stmt->fetch(PDO::FETCH_ASSOC);
            if ($row) {
                $news = new News($row['id'], $row['title'], $row['content'], $row['image'], $row['category_id'], $row['created_at'], $row['deleted_at']);
                return $news;
            }
            return null;
            } catch (PDOException $e) {
            echo ''. $e->getMessage();
            return null;
            }
        }
    }

?>