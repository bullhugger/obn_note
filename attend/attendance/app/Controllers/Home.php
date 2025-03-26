<?php

namespace App\Controllers;

use App\Models\homeModel;

class Home extends BaseController
{
    public function index(): string
    {
        $session = session();
        $homeModel = new homeModel();
        $user_id = $session->user_id;
        $data["user_role"] = $homeModel->getUserRole($user_id);
        switch($data["user_role"]) {
            case "administrator": 
                $data["user_role"] = "administrator";
                break;
            case "director":
                $data["user_role"] = "director";
                break;
            case "hr":
                $data["user_role"] = "hr";
                break;
            case "account":
                $data["user_role"] = "account";
                break;
            case "permit":
                $data["user_role"] = "permit";
                break;
            case "purchasing":
                $data["user_role"] = "purchasing";
                break;
            case "quantity_surveyor":
                $data["user_role"] = "quantity_surveyor";
                break;
            case "manager":
                $data["user_role"] = "manager";
                break;
            case "supervisor":
                $data["worker_list"] = $homeModel->getResidentWorkers($resident_id);
                $data["trade_list"]  = $homeModel->getResidentTrades($resident_id); 
                $data["user_role"] = "supervisor";
                break;
            case "subcon":
                $data["user_role"] = "subcon";
                break;
            case "worker":
                $data["user_role"] = "worker";
                break;
        }
        return view('welcome_message', $data);
    }
}
