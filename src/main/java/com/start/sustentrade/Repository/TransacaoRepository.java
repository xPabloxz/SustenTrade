package com.start.sustentrade.Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.start.sustentrade.Model.TransacaoModel;

public interface TransacaoRepository extends JpaRepository<TransacaoModel,Long>
{
  
}