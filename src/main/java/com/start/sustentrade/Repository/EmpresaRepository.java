package com.start.sustentrade.Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.start.sustentrade.Model.EmpresaModel;

public interface EmpresaRepository extends JpaRepository<EmpresaModel,Long>
{
  
}