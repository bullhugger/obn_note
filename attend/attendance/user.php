<?php

namespace App\Controllers;

use App\Models\userModel;

class User extends BaseController {

    public function __construct() {
        $this->db = db_connect();
        $this->module = "Users";
    }

    public function index() {
        $session = session();
        $company_id = $session->get('company_id');
    }
}

?>
