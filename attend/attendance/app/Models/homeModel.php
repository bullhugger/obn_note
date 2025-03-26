<?php
namespace App\Models;

use CodeIgniter\Model;

class homeModel extends Model {

    public function __construct() {
        $this->db = db_connect();
    }

    public function getUserRole($user_id) {
        $query = "SELECT USER_ROLE FROM USER_users WHERE ID=? LIMIT 1";
        $result = $this->db->query($query, [$user_id])->getRowArray();
        if(!$result) {
            $session->setFlash("error", "User not found, please re-login.");
            return;
        }
        else {
            return $result;
        }
    }

    public function getResidentWorkers($resident_id) {
        $query = "SELECT ID, FULL_NAME, tl.TITLE FROM ATTENDANCE_worker_type_list wtl
            LEFT JOIN ATTENDANCE_trade_list tl ON tl.ID=wtl.WORKER_TRADE_ID
            WHERE RESIDENT_ID=?";
        $result = $this->db->query($query, [$resident_id])->getResultArray();
        if(!$result) {
            $session->setFlash("error", "User not found, please re-login.");
            return;
        }
        else {
            return $result;
        }
    }

    public function getResidentTrades($resident_id) {
        $query = "SELECT ID, TITLE FROM ATTENDANCE_trade_list WHERE RESIDENT_ID=?";
        $result = $this->db->query($query, [$resident_id])->getResultArray();
        if(!$result) {
            $session->setFlash("error", "User not found, please re-login.");
            return;
        }
        else {
            return $result;
        }
    }

}

?>
