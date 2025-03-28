<?php
namespace App\Models;

use CodeIgniter\Model;

class loginModel extends Model {

	public function __construct() {
        $this->db = db_connect();
    }

    protected $table = "USER_user";
    protected $primary = "ID";
    protected $returntype = "array";
    protected $allowedColumns = ["USER_NAME", "USER_PASS", "USER_EMAIL"];

    public function getUser($username) {
        $query = "SELECT ID, USER_NAME, USER_GROUP_ID, USER_PASS, USER_EMAIL FROM USER_user WHERE USER_NAME=?";
        $result = $this->query($query, [$username])->getRowArray();
        return $result;
    }

    public function checkEmail($email) {
        $query = "SELECT id FROM USER_user WHERE EMAIL=? LIMIT 1";
        $result = $this->query($query, [$email])->getRowArray();
        $result = empty($result) ? false : true;
        return $result;
    }

    public function insertUser($signup_data) {
        $result = $this->db->table("USER_user")->insert($signup_data);
        return $result;
    }

}
?>
