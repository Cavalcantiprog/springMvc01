package br.com.cotiinformatica.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import br.com.cotiinformatica.entities.Cliente;
import br.com.cotiinformatica.repositories.interfaces.IClienteRepository;

@Controller
public class ClientesController {

	@Autowired //Inje??o de depend?ncia (inicializa??o)
	private IClienteRepository clienteRepository;

	// m?todo para abrir a p?gina de cadastro de clientes
	@RequestMapping("/formularioCliente")
	public ModelAndView formularioCliente() {

		// definindo o caminho da p?gina que o m?todo ir? acessar atraves da ROTA..
		ModelAndView modelAndView = new ModelAndView("clientes/formulario-cliente");

		// enviando para a p?gina uma inst?ncia de cliente
		modelAndView.addObject("cliente", new Cliente());

		return modelAndView;
	}

	// m?todo para receber o SUBMIT POST do formul?rio
	@RequestMapping(value = "/cadastrarCliente", method = RequestMethod.POST)
	public ModelAndView cadastrarCliente(Cliente cliente, ModelMap map) {

		try {

			// verificando se o email informado j? encontra-se cadastrado..
			if (clienteRepository.findByEmail(cliente.getEmail()) != null) {
				throw new Exception("O email " + cliente.getEmail() + ", j? encontra-se cadastrado. Tente outro.");
			}

			// gravando o objeto cliente no banco de dados
			clienteRepository.create(cliente);

			// definindo uma mensagem para exibir na p?gina..
			map.addAttribute("mensagem_sucesso", "Cliente " + cliente.getNome() + ", cadastrado com sucesso.");
		} catch (Exception e) {
			map.addAttribute("mensagem_erro", e.getMessage());
		}

		// criando um objeto ModelAndView
		ModelAndView modelAndView = new ModelAndView("clientes/formulario-cliente", map);
		// enviando para a p?gina uma inst?ncia de cliente
		modelAndView.addObject("cliente", new Cliente());
		return modelAndView;
	}

	// m?todo para abrir a p?gina de consulta de clientes
	@RequestMapping("/listagemClientes")
	public ModelAndView listagemClientes(ModelMap map) {

		// WEB-INF/views/clientes/listagem-clientes.jsp
		ModelAndView modelAndView = new ModelAndView("clientes/listagem-clientes");

		try {
			
			//executando a consulta de clientes no banco de dados (reposit?rio)
			//e envia-la para a p?gina atraves da classe ModelAndView
			modelAndView.addObject("clientes", clienteRepository.findAll());			
		}
		catch(Exception e) {
			//mensagem de erro..
			map.addAttribute("mensagem_erro", e.getMessage());
		}
		
		return modelAndView;
	}
	
	//m?todo para realizar a a??o de exclus?o
	@RequestMapping("/excluirCliente")
	public ModelAndView excluirCliente(Integer id, ModelMap map) {
	
		ModelAndView modelAndView = new ModelAndView("clientes/listagem-clientes");
		
		try {
			
			//buscar o cliente no banco de dados atrav?s do id..
			Cliente cliente = clienteRepository.findById(id);
			
			//verificar se o cliente foi encontrado..
			if(cliente != null) {
				
				//excluindo o cliente..
				clienteRepository.delete(id);
				
				//gerando mensagem..
				map.addAttribute("mensagem_sucesso", "Cliente " + cliente.getNome() + ", exclu?do com sucesso.");
			}
			else {
				map.addAttribute("mensagem_erro", "Cliente n?o encontrado.");
			}
			
			//executando a consulta de clientes para exibir na p?gina de listagem..
			modelAndView.addObject("clientes", clienteRepository.findAll());
		}
		catch(Exception e) {
			map.addAttribute("mensagem_erro", e.getMessage());
		}
		
		return modelAndView;
	}
	
	//m?todo para abrir a p?gina de edi??o do cliente
	@RequestMapping("edicaoCliente")
	public ModelAndView edicaoCliente(Integer id, ModelMap map) {
		
		ModelAndView modelAndView = new ModelAndView("clientes/edicao-cliente");
		
		try {
			
			//obter os dados do cliente no repositorio (findById)
			Cliente cliente = clienteRepository.findById(id);
			
			if(cliente != null) { //verificando se o cliente foi encontrado..
				//enviando um objeto cliente para a p?gina (j? preenchido)
				modelAndView.addObject("cliente", cliente);				
			}
			else {
				map.addAttribute("mensagem_erro", "Cliente n?o encontrado.");
				
				modelAndView.setViewName("clientes/listagem-clientes");
				modelAndView.addObject("clientes", clienteRepository.findAll());
			}
		}
		catch(Exception e) {
			map.addAttribute("mensagem_erro", e.getMessage());
		}
		
		return modelAndView;
	}
	
	@RequestMapping(value="atualizarCliente", method =RequestMethod.POST)
	public ModelAndView atualizarCliente(Cliente cliente, ModelMap map) {
		
		ModelAndView modelAndView = new ModelAndView("clientes/edicao-cliente");
		
		try {
			
			Cliente registro = clienteRepository.findByEmail(cliente.getEmail());
			
			if (registro != null && !registro.equals(cliente)) {
				map.addAttribute("mensagem_erro","O email informado j? encontra-se cadastrado para outro Cliente.");
			}
			
			else {
				
				clienteRepository.update(cliente);
				
				map.addAttribute("mensagem_sucesso","Cliente Atualizado com Sucesso");
			}
		}
		
		catch(Exception e) {
			
			map.addAttribute("mensagem_erro", e.getMessage());
		}
		return modelAndView;
	}
}


