package CONTROLLER;
import java.sql.ResultSet;
import java.sql.SQLException;

import DAO.PessoaDAO;
import MODEL.PessoaMODEL;

//pesquisa,exclusão, alteração, gravação. Conhece o DAO, Model e VIEW. (Controller)
public class UsuarioController 

{

  public void LoginUsuario(String nome_usuario, String senha_usuario)
  {
     //Instância necessária para usar como parâmetro no método de autenticação do usuário.
     PessoaMODEL objPessoaMODEL = new PessoaMODEL();

    //Instância necessária para pegar o método de autenticação do usuário.
    PessoaDAO objPessoaDao = new PessoaDAO();

    objPessoaMODEL.setNome_pessoa(nome_usuario);
    objPessoaMODEL.setSenha_pessoa(senha_usuario); 

    try
    {
     
      ResultSet rsUsuarioDao = objPessoaDao.autenticacaoUsuario(objPessoaMODEL);

      //Caso tenha uma nova linha do sql, ou seja um resultado válido, ele dá a mensagem de seja bem vindo.
      if(rsUsuarioDao.next())
      {
        //Chamar tela que quero abrir
        System.out.printf("Seja bem vindo(a), %s!!!!! ",objPessoaMODEL.getNome_pessoa());
      }
      else
      {
        //Enviar mensagem de erro
        System.out.println("Usuario ou senha inválida!");
      }

    }
    catch(SQLException erro)
    {
      System.out.println("LoginVIEW Error! Message: " + erro);
    }

  }
  
}
