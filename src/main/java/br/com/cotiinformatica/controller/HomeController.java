package br.com.cotiinformatica.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

	//m?todo para definir uma rota dentro do projeto
	//ROTA -> caminho para acesso a p?ginas
	@RequestMapping("/") //p?gina inicial do projeto
	public String home() {
		
		return "home"; //nome da p?gina que ser? aberta
		//WEB-INF/views/home.jsp
		
		/*
		 * Esta p?gina dever? estar dentro de: '/WEB-INF/views/'
		 * Esta p?gina dever? ter a extens?o '.jsp'
		 */
	}
}
