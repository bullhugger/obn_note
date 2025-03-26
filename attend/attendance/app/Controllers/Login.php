<?php
namespace App\Controllers;

use App\Models\mobileLoginModel;
use App\Models\mobileHomeModel;
use App\Models\userModel;

class MobileLogin extends BaseController {

    public function index() {
        $session = session();
        $data = [];
        if($session->get("user_id")) {
            $company_id = $session->get("company_id");
            $mobileHomeModel = new mobileHomeModel();
            $ps_list = $mobileHomeModel->getProjectList($company_id);
            $data["query_project_list"] = $ps_list;
            return view("mobile/home", $data);
        }
        return view("mobile/login", $data);
    }

    public function processLogin() {
        $session = session();
        $mobileLoginModel = new mobileLoginModel();
        $username = $this->request->getPost("username");
        $password = $this->request->getPost("password");
        $user = $mobileLoginModel->getUser($username);
        $result = print_r($user, true);
        if(!$user) {
            $session->setFlashData('error', 'No username found for {$user}.');
            $data['messages'] = "Incorrect username or password.";
            return view('mobile/login', $data);
        }
        if(!password_verify($password, $user['user_pass'])) {
            $session->setFlashData('error', 'Incorrect password.');
            $data['messages'] = "Incorrect username or password.";
            return view('mobile/login', $data);
        }
        $session->set([
            'user_id' => $user['id'],
            'logged_in' => true,
            'company_id' => $user['company_id'],
        ]);
        return redirect()->to(base_url().'MobileHome');
    }

    public function logout() {
        $session = session();
        $session->destroy();
        $data['messages'] = "You've been logged out.";
        return view('mobile/login', $data);
    }

    public function checkSession() {
        $session = session();
        if(!$session->get('id')) {
            $data['messages'] = "Please login to continue";
            return view('mobile/login', $data);
        }
    }
}
?>
