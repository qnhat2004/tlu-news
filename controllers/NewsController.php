<?php
require_once ("./services/NewsServices.php");
require_once ("./services/CategoriesServices.php");
class NewsController {
    private $newsServices;
    private $categoriesServices;
    public function __construct() {
        $this->newsServices = new NewsServices();
        $this->categoriesServices = new CategoriesServices();
    }
    public function index() {
        $news = $this->newsServices->getAll();
        $view = "./views/home/index.php";
        $categories = $this->categoriesServices->getAll();
        include_once ("./views/layouts/app.php");        
    }
    public function detail($id) {
        $new = $this->newsServices->getNewsDetail($id);
        $view = "./views/news/detail.php";
        include_once ("./views/layouts/app.php");
    }
}