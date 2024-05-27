package com.start.sustentrade.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.start.sustentrade.Model.UsuarioModel;
import com.start.sustentrade.Repository.UsuarioRepository;

@RestController
@RequestMapping(value="/usuarios")
public class UsuarioController 
{
  @Autowired
  private UsuarioRepository repository;


  @GetMapping
  public List<UsuarioModel> findAll()
  {
    List<UsuarioModel> result = repository.findAll();
    return result;
  }
}





