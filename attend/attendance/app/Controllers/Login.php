<?php
namespace App\Controllers;

use App\Models\loginModel;
use App\Models\homeModel;

class Login extends BaseController {

    public function index() {
        $session = session();
        $data = [];
        if($session->get("user_id")) {
            $company_id = $session->get("company_id");
            $homeModel = new homeModel();
            $ps_list = $homeModel->getProjectList($company_id);
            $data["query_project_list"] = $ps_list;
            return view("home", $data);
        }
        return view("login", $data);
    }

    public function processLogin() {
        $session = session();
        $loginModel = new loginModel();
        $username = $this->request->getPost("username");
        $password = $this->request->getPost("password");
        if(empty($username) || empty($password)) {
            $session->setFlashData("error", "Username and or password is empty.");
            return view("login");
        }
        $user = $loginModel->getUser($username);
        if(!$user) {
            $session->setFlashData("error", "No username found for {$user}.");
            $data["messages"] = "Incorrect username or password.";
            return view("login", $data);
        }
        if(!password_verify($password, $user["user_pass"])) {
            $session->setFlashData("error", "Incorrect password.");
            $data["messages"] = "Incorrect username or password.";
            return view("login", $data);
        }
        $session->set([
            "user_id" => $user["id"],
            "logged_in" => true,
            "company_id" => $user["company_id"],
        ]);
        return redirect()->to(base_url()."home");
    }

    public function logout() {
        $session = session();
        $session->destroy();
        $data["messages"] = "Logout successful.";
        return view("login", $data);
    }

    public function signupProcess() {
        $session = session();
        $company_id = $this->request->getPost("company_id");
        $password = $this->request->getPost("password");
        $email = $this->request->getPost("email");
        $loginModel = new loginModel();
        $email_check = $loginModel->checkEmail($email);
        if($email_check) {
            $signup_data = [
                "COMPANY_ID" => $company_id,
                "PASSWORD" => $password,
                "EMAIL" => $email
            ];
            $loginModel->insertUser($signup_data);
        }
        else {
            $session->setFlash("error", "Failed to register user.");
            return view("login");
        }
    }

}
?>
