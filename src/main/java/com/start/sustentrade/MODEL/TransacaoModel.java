package com.start.sustentrade.Model;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="transacoes")
public class TransacaoModel 
{
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;
  private double preco;

  @OneToOne
  private Long materiais_id;

  @ManyToOne
  private Long pessoas_id;

  @Enumerated(EnumType.STRING)
  private Tipo tipo;

  public enum Tipo
  {
    venda,
    troca,
    doacao;
  }

  public TransacaoModel(){
  }

  public Long getId() {
    return id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public double getPreco() {
    return preco;
  }

  public void setPreco(double preco) {
    this.preco = preco;
  }

  public Long getMateriais_id() {
    return materiais_id;
  }

  public void setMateriais_id(Long materiais_id) {
    this.materiais_id = materiais_id;
  }

  public Long getPessoas_id() {
    return pessoas_id;
  }

  public void setPessoas_id(Long pessoas_id) {
    this.pessoas_id = pessoas_id;
  }

  public Tipo getTipo() {
    return tipo;
  }

  public void setTipo(Tipo tipo) {
    this.tipo = tipo;
  }

  

}
