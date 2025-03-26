<?php
namespace App\Models;

use CodeIgniter\Model;

class mobileLoginModel extends Model {

	public function __construct() {
        $this->db = db_connect();
    }

    protected $table = "USER_users";
    protected $primary = "ID";
    protected $returntype = "array";
    protected $allowedColumns = ["USER_NAME", "USER_PASS", "USER_EMAIL", "company_id"];

    public function getUser($username) {
        $sql = "SELECT ID, USER_NAME, USER_GROUP, USER_PASS, USER_EMAIL, company_id FROM USER_users WHERE USER_NAME=?";
        $result = $this->query($sql, [$username])->getRowArray();
        return $result;
    }

    public function checkUsername($user_name) {
        $sql = "SELECT user_name FROM users WHERE user_name=?";
        $result = $this->query($sql, [$user_name])->getResult();
        return $result;
    }

}
?>
