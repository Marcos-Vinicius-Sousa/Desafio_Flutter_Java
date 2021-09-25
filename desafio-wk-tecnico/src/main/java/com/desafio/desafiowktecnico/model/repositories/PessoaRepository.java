package com.desafio.desafiowktecnico.model.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.desafio.desafiowktecnico.model.entities.Pessoas;



public interface PessoaRepository extends JpaRepository<Pessoas, Long>{

}
