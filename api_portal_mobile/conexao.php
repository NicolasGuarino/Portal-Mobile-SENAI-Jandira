<?php
	$host = 'localhost';
	$usuario = 'outsidet_root' ;
	$senha = 'bcd127';
	$banco = 'outsidet_portal_educacional';



	$dbcon = new MySQLi("$host", "$usuario", "$senha", "$banco");


	if($dbcon->connect_error){

		echo"conexao_erro";


	}/*else{

		echo"conexao_ok";


	}*/


?>
