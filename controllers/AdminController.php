<?php
require_once ('./services/NewsServices.php');
require_once ('./services/CategoriesServices.php');
require_once ('./auth/session.php');

class AdminController {
    private $newsServices;
    private $categoryServices;

    public function __construct() {
        // checkAdminAccess();
        $this->newsServices = new NewsServices();
        $this->categoryServices = new CategoriesServices();
    }

    public function index() {
        $news = $this->newsServices->getAll();
        $view = "./views/admin/index.php";
        $categories = $this->categoryServices->getAll();
        include_once ("./views/layouts/app.php");  
    }

    public function add() {
        $view = "./views/admin/create.php";
        $categories = $this->categoryServices->getAll();
        include_once ("./views/layouts/app.php");  
    }

    public function store() {
        $title = $_POST['title'];
        $content = $_POST['content'];
        $category_id = $_POST['category'];
        $image = $_POST['image'];

        // validate data
        foreach ($_POST as $key => $value) {
            if ($key === '') {
                echo 'Please fill all fields';
                return;
            }
            if (strlen($value) > 255) {
                echo 'Data too long';
                return;
            }
        }

        $this->newsServices->createNewArticle($title, $content, $image, $category_id, date('Y-m-d H:i:s'));
        header('Location: index.php?controller=admin');
    }
    
    public function edit($id) {
        $article = $this->newsServices->getNewsDetail($id);
        $view = "./views/admin/edit.php";
        $category = $this->categoryServices->getCategoryNameById($id);
        include_once ("./views/layouts/app.php");  
    }

    public function update($id) {
        $title = $_POST['title'];
        $content = $_POST['content'];
        $category_id = $_POST['category'];
        $image = $_POST['image'];

        // validate data
        foreach ($_POST as $key => $value) {
            if ($key === '') {
                echo 'Please fill all fields';
                return;
            }
            if (strlen($value) > 255) {
                echo 'Data too long';
                return;
            }
        }

        $this->newsServices->updateArticle($id, $title, $content, $image, $category_id, date('Y-m-d H:i:s'));
        header('Location: index.php?controller=admin');
    }

    public function destroy($id) {
        $this->newsServices->deleteArticle($id);
        header('Location: index.php?controller=admin');
    }
}