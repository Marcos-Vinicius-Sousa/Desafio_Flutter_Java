package com.desafio.desafiowktecnico.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.desafio.desafiowktecnico.model.entities.Pessoas;
import com.desafio.desafiowktecnico.model.repositories.PessoaRepository;

@Service
public class PessoaService implements ServiceInterface<Pessoas>{
	
	@Autowired
	private PessoaRepository repository;

	@Override
	public Pessoas create(Pessoas obj) {
		repository.save(obj);
		return obj;
	}

	@Override
	public Pessoas findById(Long id) {
		Optional<Pessoas> usuario = repository.findById(id);
		return usuario.orElse(null);
	}

	@Override
	public List<Pessoas> findAll() {
		return repository.findAll();
	}

	@Override
	public boolean update(Pessoas obj) {
		if(repository.existsById(obj.getId())) {
			repository.save(obj);
			return true;
		}
		return false;
	}

	@Override
	public boolean delete(Long id) {
		if(repository.existsById(id)) {
			repository.deleteById(id);
			return true;
		}
			return false;
	}

}
