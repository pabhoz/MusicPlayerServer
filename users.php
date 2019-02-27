<?php

require_once './headers.php';
require_once 'libs/Pabhoz/MySQLiManager/MySQLiManager.php';

$db = new MySQLiManager('localhost','root','','AplicacionSuperCool');
$table = "users";

if(isset($_GET["ejecute"])){
	if($_GET["ejecute"] != null && $_GET["ejecute"] != ""){
			switch ($_GET["ejecute"]){
				case "select":
					select();
                break;
                case "login":
					login();
                break;
                case "signup":
                    signUp();
                break;
			}
		}else{
			die("La función <b>".$_GET['ejecute']."</b> no existe");
		}
}

function login(){
    global $db,$table;

    if (!isset($_POST["username"])) die("Username must be provided");

    $where = (isset($_POST["username"])) ? "username = '$_POST[username]'" : "";
    $fetch = $db->select("*",$table,$where);
    $fetch = ($fetch == NULL) ? [] : $fetch;
    $response = ($fetch[0]["password"] == $_POST["password"]) ? 1 : 0;

    print json_encode(["login"=> $response]);
}

function select(){
    
    global $db,$table;

    $where = (isset($_POST["username"])) ? "username = '$_POST[username]'" : "";

    $fetch = $db->select("*",$table,$where);
    $fetch = ($fetch == NULL) ? [] : $fetch;
    print json_encode($fetch);	

}

function signUp(){
    global $db,$table;

    $data = $_POST;
    $data["id"] = "";

    $fetch = $db->insert($table,$data);
    print json_encode($fetch);
}
