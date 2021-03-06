<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home</title>

<!-- Folha de estilo CSS -->
<link rel="stylesheet" href="resources/css/bootstrap.min.css" />

</head>
<body>

	<div class="container mt-4">
	
		<h1>Sistema de Controle de Clientes</h1>
		<p>Projeto desenvolvido em Spring MVC com JdbcTemplate</p>
		<hr/>

		<a href="/springMvc01/formularioCliente" class="btn btn-light">Cadastrar Clientes</a> 
		<a href="/springMvc01/listagemClientes" class="btn btn-light">Consultar Clientes</a>
	
	</div>

	<!-- Arquivos JavaScript -->
	<script src="resources/jquery-3.5.1.min.js"></script>
	<script src="resources/bootstrap.min.js"></script>

</body>
</html>
