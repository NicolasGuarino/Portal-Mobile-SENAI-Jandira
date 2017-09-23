<?php

	header("Cache-Control: no-store, no-cache, must-revalidate, max-age=0");
    header("Cache-Control: post-check=0, pre-check=0", false);
    header("Pragma: no-cache");
	ini_set('default_charset','UTF-8');	
	header("Content-Type: text/html; charset=ISO-8859-1", true);
	header("Content-Type: text/html; charset=UTF-8", true);
	
	include_once 'conexao_local.php';
	
	$id_turma = $_POST['id_turma'];
	
	$sql = $dbcon->query("call materias($id_turma)");
	
	if(mysqli_num_rows($sql) > 0){
		
		$lista = [];
		
		while($dados = $sql->fetch_array()){
			
			$obj = array("id_materia" => utf8_encode($dados['id_materia']) , "nome_materia" => utf8_encode($dados['nome_materia']));
						
			$lista[] = $obj;
		}
		
		echo json_encode($lista);
		
		
	}

?>


