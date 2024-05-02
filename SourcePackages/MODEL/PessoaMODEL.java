package MODEL;

//Criação de todos os getters e setters. (Data Transfer Object) Lugar inalterado.
public class PessoaMODEL 
{
  //Atributos privados porque representam o usuario e senha, ou seja, aumento de segurança além do trabalho com encapsulamento.
  private int id_pessoa;
  private String nome_pessoa, senha_pessoa,dataNascimento;
  private char sexo;

  /**Criação de métodos acessores, Getters e Setters. Get para buscar o valor da variável privada e Set para receber do usuario e inserir dentro 
      da variável privada um novo valor.**/
  public int getId_pessoa()
  {
    return id_pessoa;
  }

  public void setId_pessoa(int id_pessoa)
  {
    this.id_pessoa = id_pessoa;
  }

  public String getNome_pessoa()
  {
    return nome_pessoa;
  }

  public void setNome_pessoa(String nome_pessoa)
  {
    this.nome_pessoa = nome_pessoa;
  }

  public String getSenha_pessoa()
  {
    return senha_pessoa;
  }

  public void setSenha_pessoa(String senha_Pessoa)
  {
    this.senha_pessoa = senha_Pessoa;
  }

}
