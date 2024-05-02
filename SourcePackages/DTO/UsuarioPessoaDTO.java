package DTO;
//Criação de todos os getters e setters. (Data Transfer Object)
public class UsuarioPessoaDTO 
{
  private int id_usuarioPessoa;
  private String nome_usuarioPessoa, senha_usuarioPessoa;

  public int getId_usuarioPessoa()
  {
    return id_usuarioPessoa;
  }

  public void setId_usuarioPessoa(int id_usuarioPessoa)
  {
    this.id_usuarioPessoa = id_usuarioPessoa;
  }

  public String getNome_usuarioPessoa()
  {
    return nome_usuarioPessoa;
  }

  public void setNome_usuarioPessoa(String nome_usuarioPessoa)
  {
    this.nome_usuarioPessoa = nome_usuarioPessoa;
  }

  public String getSenha_usuarioPessoa()
  {
    return senha_usuarioPessoa;
  }

  public void setSenha_usuarioPessoa(String senha_usuarioPessoa)
  {
    this.senha_usuarioPessoa = senha_usuarioPessoa;
  }

}
