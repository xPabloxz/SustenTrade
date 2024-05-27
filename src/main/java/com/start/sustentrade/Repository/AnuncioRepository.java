package com.start.sustentrade.Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.start.sustentrade.Model.AnuncioModel;

public interface AnuncioRepository extends JpaRepository<AnuncioModel,Long>
{
  
}