package MODEL;

//Criação de todos os getters e setters. (Data Transfer Object) Lugar inalterado.
public class UsuarioEmpresa 
{
  //Atributos privados porque representam o usuario e senha, ou seja, aumento de segurança além do trabalho com encapsulamento.
  private int id_empresa;
  private String nome_empresa, senha_empresa;

  /**Criação de métodos acessores, Getters e Setters. Get para buscar o valor da variável privada e Set para receber do usuario e inserir dentro 
      da variável privada um novo valor.**/
  public int getId_empresa()
  {
    return id_empresa;
  }

  public void setId_empresa(int id_empresa)
  {
    this.id_empresa = id_empresa;
  }

  public String getNome_empresa()
  {
    return nome_empresa;
  }

  public void setNome_empresa(String nome_empresa)
  {
    this.nome_empresa = nome_empresa;
  }

  public String getSenha_empresa()
  {
    return senha_empresa;
  }

  public void setSenha_empresa(String senha_empresa)
  {
    this.senha_empresa = senha_empresa;
  }

}
