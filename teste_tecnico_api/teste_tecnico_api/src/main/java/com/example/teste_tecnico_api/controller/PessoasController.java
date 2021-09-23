package com.example.teste_tecnico_api.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import com.example.teste_tecnico_api.model.entities.Pessoas;
import com.example.teste_tecnico_api.service.PessoaService;


@RequestMapping("/pessoa")
public class PessoasController implements ControllerInterfaces<Pessoas> {

	@Autowired
	private PessoaService service;
	
	@Override
	public ResponseEntity<List<Pessoas>> getAll() {
		return ResponseEntity.ok(service.findAll());
	}

	@Override
	@GetMapping(value="/{id}")
	public ResponseEntity<?> get(@PathVariable("id")  Long id) {
			Pessoas _pessoa = service.findById(id);
			return null;
			
	}

	@Override
	@PostMapping
	public ResponseEntity<Pessoas> post(@RequestBody Pessoas obj) {
		service.create(obj);
		return ResponseEntity.ok(obj);
	}

	@Override
	public ResponseEntity<?> put(Pessoas obj) {
		if(service.update(obj)) {
			return ResponseEntity.ok(obj);
		}
		return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
	}

	@Override
	@DeleteMapping(value="/{id}")
	public ResponseEntity<?> delete(Long id) {
		if(service.delete(id)) {
			return ResponseEntity.ok().build();
		}
		
		return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
	}

}
