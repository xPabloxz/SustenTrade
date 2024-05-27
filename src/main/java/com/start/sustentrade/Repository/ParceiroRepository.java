package com.start.sustentrade.Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.start.sustentrade.Model.ParceiroModel;

public interface ParceiroRepository extends JpaRepository<ParceiroModel,Long>
{
  
}