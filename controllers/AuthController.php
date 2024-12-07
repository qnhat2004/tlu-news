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
            $_SESSION['user'] = $user;
            header('Location: index.php?controller=home&action=index');
        } else {
            header('Location: index.php?controller=auth&action=login');
        }
    }

    public function logout() {
        $_SESSION['user'] = null;
        header('Location: index.php?controller=auth&action=login');
    }

    public function showRegisterForm() {
        $view = "./views/auth/register.php";
        include_once "./views/layouts/app.php";
    }

    public function register($username, $password) {
        $user = $this->authServ->register($username, $password);
        if ($user) {
            $_SESSION['user'] = $user;
            header('Location: index.php?controller=home&action=index');
        } else {
            header('Location: index.php?controller=auth&action=register');
        }
    }
}