package com.start.sustentrade.Model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="pontos_coleta")
public class PontoColetaModel 
{
  @Id
  @GeneratedValue(strategy=GenerationType.IDENTITY)
  private Long id;
  private String nome,endereco,pontoDeReferencia;

  public PontoColetaModel(){
  }

  public Long getId() {
    return id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public String getNome() {
    return nome;
  }

  public void setNome(String nome) {
    this.nome = nome;
  }

  public String getEndereco() {
    return endereco;
  }

  public void setEndereco(String endereco) {
    this.endereco = endereco;
  }

  public String getPontoDeReferencia() {
    return pontoDeReferencia;
  }

  public void setPontoDeReferencia(String pontoDeReferencia) {
    this.pontoDeReferencia = pontoDeReferencia;
  }

  
}
