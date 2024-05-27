package com.start.sustentrade.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.start.sustentrade.Model.PessoaModel;

public interface PessoaRepository extends JpaRepository<PessoaModel,Long>
{
  
}