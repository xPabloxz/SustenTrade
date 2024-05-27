package com.start.sustentrade.Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.start.sustentrade.Model.UsuarioModel;

public interface UsuarioRepository extends JpaRepository<UsuarioModel,Long>
{
  
}