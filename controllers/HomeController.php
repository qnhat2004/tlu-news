<?php
require_once ("./services/NewsServices.php");
require_once ("./services/CategoriesServices.php");
require_once ("./services/HomeService.php");

class HomeController {
    private $newsServices;
    private $categoriesServices;
    private $homeServices;

    public function __construct() {
        $this->newsServices = new NewsServices();
        $this->categoriesServices = new CategoriesServices();
        $this->homeServices = new HomeService();
    }
    
    public function index() {
        $keyword = $_GET['search_input'] ? $_GET['search_input'] : '';
        $news = $this->homeServices->search($keyword);
        $view = "./views/home/index.php";
        $categories = $this->categoriesServices->getAll();
        include_once ("./views/layouts/app.php");
    }
}