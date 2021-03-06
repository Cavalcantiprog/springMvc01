package br.com.cotiinformatica.repositories.interfaces;

import br.com.cotiinformatica.entities.Cliente;

public interface IClienteRepository extends IBaseRepository<Cliente, Integer> {

	Cliente findByEmail(String email) throws Exception;
	
}