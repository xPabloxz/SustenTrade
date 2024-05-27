package com.start.sustentrade.Model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

//Criação de todos os getters e setters. (Data Transfer Object) Lugar inalterado.
@Entity
@Table(name="empresas") //Cria a tabela
public class EmpresaModel 
{
  //Atributos privados porque representam o usuario e senha, ou seja, aumento de segurança além do trabalho com encapsulamento.
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;
  private String cnpj, descricaoEmpresa;

  
  @ManyToMany
  private Long usuarios_id;

  public EmpresaModel(){
  }
  /**Criação de métodos acessores, Getters e Setters. Get para buscar o valor da variável privada e Set para receber do usuario e inserir dentro 
      da variável privada um novo valor.**/

  public Long getId() {
    return id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public String getCnpj() {
    return cnpj;
  }

  public void setCnpj(String cnpj) {
    this.cnpj = cnpj;
  }

  public String getDescricaoEmpresa() {
    return descricaoEmpresa;
  }

  public void setDescricaoEmpresa(String descricaoEmpresa) {
    this.descricaoEmpresa = descricaoEmpresa;
  }

  public Long getUsuarios_id() {
    return usuarios_id;
  }

  public void setUsuarios_id(Long usuarios_id) {
    this.usuarios_id = usuarios_id;
  }

  
  
}
