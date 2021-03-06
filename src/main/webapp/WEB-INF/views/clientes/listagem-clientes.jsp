<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Consulta</title>

	<!-- Folhas de estilo CSS do bootstrap-->
	<link rel="stylesheet" href="resources/css/bootstrap.min.css"/>
	
	<!-- Folha de estilo CSS do Jquery DataTables -->
	<link rel="stylesheet" href="//cdn.datatables.net/1.10.23/css/jquery.dataTables.min.css"/>

</head>
<body>
	
	<c:if test="${not empty mensagem_sucesso}">
	
		<div class="alert alert-success alert-dismissible fade show" role="alert">
  			<strong>Sucesso!</strong> ${mensagem_sucesso}
  			<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
		</div>	
		
	</c:if>	
	
	<c:if test="${not empty mensagem_erro}">
	
		<div class="alert alert-danger alert-dismissible fade show" role="alert">
  			<strong>Erro!</strong> ${mensagem_erro}
  			<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
		</div>	
		
	</c:if>	

	<div class="container mt-4">
	
		<h1>Consulta de Clientes</h1>
		<a href="/springMvc01/" class="btn btn-light">P?gina inicial</a>
		<hr />
				
		<table id="tabelaClientes" class="table table-light table-striped table-hover table-sm">
			<thead>
				<tr>
					<th>Nome do Cliente</th>
					<th>Email</th>
					<th>Opera??es</th>
				</tr>
			</thead>
			<tbody>
			
				<c:forEach var="cli" items="${clientes}">
					<tr>
						<td>${cli.nome}</td>
						<td>${cli.email}</td>
						<td>
							<a href="/springMvc01/edicaoCliente?id=${cli.idCliente}" 
								class="btn btn-primary btn-sm">
								Atualizar
							</a>
							
							<a href="/springMvc01/excluirCliente?id=${cli.idCliente}" 
								class="btn btn-danger btn-sm"
								onclick="return window.confirm('Deseja realmente excluir o cliente ${cli.nome}?')">
								Excluir
							</a>
						</td>
					</tr>
				</c:forEach>			
				
			</tbody>
			<tfoot>
				<tr>
					<td colspan="3">
						Quantidade de clientes obtidos: ${clientes.size()}
					</td>
				</tr>
			</tfoot>
		</table>
	
	</div>

	<!-- Arquivos JavaScript JQuery / Bootstrap -->
	<script src="resources/js/jquery-3.5.1.min.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	
	<!-- JavaScript do JQuery DataTables -->
	<script src="//cdn.datatables.net/1.10.23/js/jquery.dataTables.min.js"></script>
	
	<script>
	$(document).ready( 
		function() {
			//capturando a tabela pelo id (#)
			$('#tabelaClientes').DataTable({
				lengthMenu: [ 5, 10, 25, 50, 75, 100 ],
				language: {
					url : '//cdn.datatables.net/plug-ins/1.10.22/i18n/Portuguese-Brasil.json'
				}
			});
		});
	</script>

</body>
</html>