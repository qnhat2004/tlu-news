<?php
session_start();

function isAdmin() {
    return isset($_SESSION['role']) && $_SESSION['role'] === 'admin';
}

function checkAdminAccess() {
    if (!isAdmin()) {
        header('Location: index.php?controller=auth&action=login');
        exit();
    }
}