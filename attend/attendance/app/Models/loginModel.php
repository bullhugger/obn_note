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
        $sql = "SELECT ID, USER_NAME, USER_GROUP_ID, USER_PASS, USER_EMAIL FROM USER_user WHERE USER_NAME=?";
        $result = $this->query($sql, [$username])->getRowArray();
        return $result;
    }

}
?>
