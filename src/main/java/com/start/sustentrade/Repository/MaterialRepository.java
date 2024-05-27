package com.start.sustentrade.Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.start.sustentrade.Model.MaterialModel;

public interface MaterialRepository extends JpaRepository<MaterialModel,Long>
{
  
}