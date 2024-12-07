<?php
require_once 'services/AuthService.php';

class AuthController {
    private $authServ;

    public function __construct() {
        $this->authServ = new AuthService();
    }

    public function showLoginForm() {
        $view = "./views/auth/login.php";
        include_once "./views/layouts/app.php";
    }

    public function login() {
        $email = $_POST['email'];
        $password = $_POST['password'];
        $user = $this->authServ->login($email, $password);
        
        if ($user) {
            $_SESSION['name'] = $user->getName();
            $_SESSION['role'] = $user->getRole();
            header('Location: index.php?controller=news');
        } else {
            header('Location: index.php?controller=auth&action=showLoginForm');
        }
    }

    public function logout() {
        session_destroy();
        header('Location: index.php?controller=auth&action=login');
    }

    public function showRegisterForm() {
        $view = "./views/auth/register.php";
        include_once "./views/layouts/app.php";
    }

    public function register() {
        $name = $_POST["name"];
        $email = $_POST["email"];
        $role = $_POST["role"];
        $password = $_POST["password"];

        $user = $this->authServ->register($name, $email, $password, $role);
        if ($user) {
            $_SESSION['user'] = $user;
            header('Location: index.php?controller=news');
        } else {
            header('Location: index.php?controller=auth&action=register');
        }
    }
}