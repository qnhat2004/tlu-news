<?php
require_once 'controllers/NewsController.php';
require_once 'controllers/AdminController.php';

$controller = isset($_GET['controller']) ? $_GET['controller'] : 'news';
$action = isset($_GET['action']) ? $_GET['action'] : 'index';
$id = isset($_GET['id']) ? $_GET['id'] : null;

switch ($controller) {
    case 'news':
        $controller = new NewsController();
        break;
    case 'admin':
        $controller = new AdminController();
        break;
}

if ($id !== null) {
    $controller->{$action}($id);
} else {
    $controller->{$action}();
}
?>