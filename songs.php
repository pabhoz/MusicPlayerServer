<?php

require_once './headers.php';
require_once 'libs/Pabhoz/MySQLiManager/MySQLiManager.php';

$db = new MySQLiManager('localhost','root','','AplicacionSuperCool');
$table = "songs";

if(isset($_GET["ejecute"])){
	if($_GET["ejecute"] != null && $_GET["ejecute"] != ""){
			switch ($_GET["ejecute"]){
				case "create":
					create();
                break;
			}
		}else{
			die("La función <b>".$_GET['ejecute']."</b> no existe");
		}
}


function create(){
    global $db,$table;

	$data = $_POST;
	
	file_put_contents("songs/elArchivo.mp3",base64_decode($_POST["file"]));

    $fetch = $db->insert($table,$data);
    print json_encode($fetch);
}