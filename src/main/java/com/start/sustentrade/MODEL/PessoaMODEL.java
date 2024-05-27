package com.start.sustentrade.Model;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

//Criação de todos os getters e setters. (Data Transfer Object) Lugar inalterado.
@Entity //Mapeamento objeto-relacional para informar que é uma entidade, estabelecendo a relação entre a entidade e uma tabela no banco.
@Table(name="pessoas") //Cria a tabela
public class PessoaModel 
{
  //Atributos privados porque representam o usuario e senha, ou seja, aumento de segurança além do trabalho com encapsulamento.
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;

  @ManyToMany
  private Long usuarios_id;

  @Enumerated(EnumType.STRING)
  private Sexo sexo;

  public enum Sexo
  {
    F,
    M;
  }

  @DateTimeFormat(pattern = "dd-MM-yyyy")
  private Date dataNascimento;

  public PessoaModel(){
  }

  public Long getId() {
    return id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public Long getUsuarios_id() {
    return usuarios_id;
  }

  public void setUsuarios_id(Long usuarios_id) {
    this.usuarios_id = usuarios_id;
  }

  public Sexo getSexo() {
    return sexo;
  }

  public void setSexo(Sexo sexo) {
    this.sexo = sexo;
  }

  public Date getDataNascimento() {
    return dataNascimento;
  }

  public void setDataNascimento(Date dataNascimento) {
    this.dataNascimento = dataNascimento;
  }


    
  /**Criação de métodos acessores, Getters e Setters. Get para buscar o valor da variável privada e Set para receber do usuario e inserir dentro 
      da variável privada um novo valor.**/
  
}
