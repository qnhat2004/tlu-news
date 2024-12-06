<?php
class News {
    private $id;
    private $title;
    private $content;
    private $image;
    private $category_id;
    private $created_at;
    private $deleted_at;

    public function __construct($title, $content, $image, $category_id, $created_at) {
        $this->title = $title;
        $this->content = $content;
        $this->image = $image;
        $this->category_id = $category_id;
        $this->created_at = $created_at;
    }

    public function getId() {
        return $this->id;
    }
    
    public function setID($id) {
        $this->id = $id;
    }

    public function getTitle() {
        return $this->title;
    }

    public function getContent() {
        return $this->content;
    }

    public function getImage() {
        return $this->image;
    }

    public function getCategoryId() {
        return $this->category_id;
    }

    public function getCreatedAt() {
        return $this->created_at;
    }

    public function getDeletedAt() {
        return $this->deleted_at;
    }

    public function setCategoryId($category_id) {
        $this->category_id = $category_id;
    }

    public function setCreatedAt($created_at) {
        $this->created_at = $created_at;
    }

    public function setDeletedAt($deleted_at) {
        $this->deleted_at = $deleted_at;
    }
}
?>