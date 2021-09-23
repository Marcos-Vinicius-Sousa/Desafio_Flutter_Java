package com.example.teste_tecnico_api.controller;

import java.util.List;
import org.springframework.http.ResponseEntity;
import com.example.teste_tecnico_api.model.entities.Pessoas;


public class PessoasController implements ControllerInterfaces<Pessoas> {

	@Override
	public ResponseEntity<List<Pessoas>> getAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ResponseEntity<?> get(Long id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ResponseEntity<Pessoas> post(Pessoas obj) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ResponseEntity<?> put(Pessoas obj) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ResponseEntity<?> delete(Long id) {
		// TODO Auto-generated method stub
		return null;
	}

}
