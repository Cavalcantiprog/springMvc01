<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>

	<!-- Folha de estilo CSS -->
	<link rel="stylesheet" href="resources/css/bootstrap.min.css" />
	
	<!-- formata??o CSS para o jquery-validate -->
	<style>
		/* formata??o da mensagem de erro */
		label.error {
			color: #d9534f;
		}
		
		/* formta??o do campo */
		input.error {
			border: 1px solid #d9534f;
		}
	</style>

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
  			<strong>Sucesso!</strong> ${mensagem_erro}
  			<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
		</div>	
		
	</c:if>	

	<div class="container mt-4">

		<h1>Cadastro de Cliente</h1>
		<a href="/springMvc01/" class="btn btn-light">P?gina inicial</a>
		<hr />

		<div class="row">
			<div class="col-md-4">

				<!-- Formul?rio -->
				<form id="formCadastro" action="cadastrarCliente" method="post">

					<div class="mb-4">
						<label>Nome do Cliente:</label> 
						<form:input path="cliente.nome"
							class="form-control" autocomplete="off"
							placeholder="Ex: Jo?o da Silva" />
					</div>

					<div class="mb-4">
						<label>Email:</label> 
						<form:input path="cliente.email"
							class="form-control"
							autocomplete="off" placeholder="Ex: joaosilva@gmail.com" />
					</div>

					<div>
						<button type="submit" class="btn btn-success">Cadastrar
							Cliente</button>
					</div>

				</form>

			</div>
		</div>

	</div>

	<!-- Arquivos JavaScript -->
	<script src="resources/js/jquery-3.5.1.min.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	
	<script src="resources/js/jquery.validate.min.js"></script>
	<script src="resources/js/messages_pt_BR.min.js"></script>
	
	<!-- valida??o do formul?rio -->
	<script>
		//iniciando o jquery..
		$(document).ready(function(){
			
			//ativando a valida??o (jquery.validate) para o formul?rio
			$("#formCadastro").validate({
				
				//definindo a regra de valida??o de cada campo
				rules : {
					'nome' : { //campo
						required : true, //campo obrigat?rio
						minlength : 8, //tamanho minimo do campo
						maxlength : 150 //tamanho m?ximo do campo 
					},
					'email' : { //campo
						required : true, //campo obrigat?rio
						email : true //formato de email v?lido
					}
				}
			});			
		})
	</script>

</body>
</html>


















