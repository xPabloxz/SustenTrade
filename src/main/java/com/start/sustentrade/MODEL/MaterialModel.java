package com.start.sustentrade.Model;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="materiais") //Cria a tabela
public class MaterialModel 
{
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;
  private String descricao;
  private int tempo_uso;
  private boolean disponivel;

  @ManyToOne
  private Long pessoas_id;

  @Enumerated(EnumType.STRING)
  private Tipo tipo;

  public enum Tipo
  {
    reutilizavel,
    reciclavel;
  }

  @Enumerated(EnumType.STRING)
  private Estado estado;

  public enum Estado
  {
    novo,
    usado;
  }

  public MaterialModel(){
  }

  public Long getId() {
    return id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public String getDescricao() {
    return descricao;
  }

  public void setDescricao(String descricao) {
    this.descricao = descricao;
  }

  public int getTempo_uso() {
    return tempo_uso;
  }

  public void setTempo_uso(int tempo_uso) {
    this.tempo_uso = tempo_uso;
  }

  public boolean isDisponivel() {
    return disponivel;
  }

  public void setDisponivel(boolean disponivel) {
    this.disponivel = disponivel;
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

  public Estado getEstado() {
    return estado;
  }

  public void setEstado(Estado estado) {
    this.estado = estado;
  }

  
}
