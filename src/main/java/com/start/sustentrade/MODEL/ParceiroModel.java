package com.start.sustentrade.Model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import org.hibernate.annotations.ManyToAny;

@Entity
@Table(name="parceiros")
public class ParceiroModel 
{
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;
  private String motivoParceria;

  @ManyToMany
  private Long usuarios_id;
  @ManyToMany
  private Long empresas_id;

  public ParceiroModel(){
  }
  
  public Long getId() {
    return id;
  }
  public void setId(Long id) {
    this.id = id;
  }
  public String getMotivoParceria() {
    return motivoParceria;
  }
  public void setMotivoParceria(String motivoParceria) {
    this.motivoParceria = motivoParceria;
  }
  public Long getUsuarios_id() {
    return usuarios_id;
  }
  public void setUsuarios_id(Long usuarios_id) {
    this.usuarios_id = usuarios_id;
  }
  public Long getEmpresas_id() {
    return empresas_id;
  }
  public void setEmpresas_id(Long empresas_id) {
    this.empresas_id = empresas_id;
  }

  
}
