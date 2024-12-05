<?php
require_once ("./services/NewsServices.php");
class NewsController {
    private $newsServices;
    public function __construct() {
        $this->newsServices = new NewsServices();
    }
    public function index() {
        $news = $this->newsServices->getAllNews();
        include_once ("./views/home/index.php");        
    }
    public function detail($id) {
        $new = $this->newsServices->getNewsDetail($id);
        include_once ("./views/news/detail.php");
    }
}