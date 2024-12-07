<?php
require_once 'controllers/NewsController.php';
require_once 'controllers/AdminController.php';
require_once 'controllers/HomeController.php';
require_once 'controllers/AuthController.php';

$controller = isset($_GET['controller']) ? $_GET['controller'] : 'news';
$action = isset($_GET['action']) ? $_GET['action'] : 'index';
$id = isset($_GET['id']) ? $_GET['id'] : null;

// if ($controller === 'admin' && !isAdmin()) {
//     header('Location: index.php?controller=auth&action=login');
//     exit();
// }

switch ($controller) {
    case 'news':
        $controller = new NewsController();
        break;
    case 'admin':
        $controller = new AdminController();
        break;
    case 'home':
        $controller = new HomeController();
        break;
    case 'auth':
        $controller = new AuthController();
        break;
}

if ($id !== null) {
    $controller->{$action}($id);
} else {
    $controller->{$action}();
}
?>