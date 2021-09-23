package com.example.teste_tecnico_api.model.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.teste_tecnico_api.model.entities.Pessoas;


public interface PessoaRepository extends JpaRepository<Pessoas, Long>{

}
