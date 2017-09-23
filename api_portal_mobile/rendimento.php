<?php

	header("Cache-Control: no-store, no-cache, must-revalidate, max-age=0");
    header("Cache-Control: post-check=0, pre-check=0", false);
    header("Pragma: no-cache");
	ini_set('default_charset','UTF-8');	
	header("Content-Type: text/html; charset=ISO-8859-1", true);
	header("Content-Type: text/html; charset=UTF-8", true);
	
	include_once 'conexao_local.php';
	
	$id_aluno = $_POST['id_aluno'];
	$id_materia = $_POST['id_materia'];
	
	$sql = $dbcon->query("call visualizarNotas($id_aluno, $id_materia)");
	
	if(mysqli_num_rows($sql) > 0){
		
		$lista = [];
		
		while($dados = $sql->fetch_array()){
			
			$obj = array("nota" => $dados['nota'] , "nome_professor" => $dados['nome_professor']); 
						
			$lista[] = $obj;
		}
		
		echo json_encode($lista);
			
	} else {
		
		echo("erro");
	}


?>


