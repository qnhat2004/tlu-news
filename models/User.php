<?php
class User {
    private $id, $name, $email, $password, $emailVerified, $role, $createdAt, $updatedAt, $rememberToken;

    public function __construct($name, $email, $password, $role) {
        $this->name = $name;
        $this->email = $email;
        $this->password = $password;
        $this->role = $role;
    }

    public function getId() {
        return $this->id;
    }
    public function getName() {
        return $this->name;
    }
    public function getEmail() {
        return $this->email;
    }
    public function getPassword() {
        return $this->password;
    }
    public function getRole() {
        return $this->role;
    }
    public function getCreatedAt() {
        return $this->createdAt;
    }
    public function getUpdatedAt() {
        return $this->updatedAt;
    }
    public function getRememberToken() {
        return $this->rememberToken;
    }
    public function setRememberToken($value) {
        $this->rememberToken = $value;
    }
    
}