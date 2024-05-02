package CONTROLLER;
import java.sql.ResultSet;
import java.sql.SQLException;

import DAO.ConexaoDAO;
import DAO.UsuarioPessoaDAO;
import MODEL.UsuarioPessoa;
import VIEW.LoginVIEW;

//pesquisa,exclusão, alteração, gravação. Conhece o DAO, Model e VIEW. (Controller)
public class UsuarioController 

{
  //Instância necessária para pegar o método de autenticação do usuário.
    UsuarioPessoaDAO objUsuarioPessoaDao = new UsuarioPessoaDAO();

    //Instância necessária para usar como parâmetro no método de autenticação do usuário.
    UsuarioPessoa objUsuarioPessoa = new UsuarioPessoa();

    try
    {
     
      ResultSet rsUsuarioDao = objUsuarioPessoaDao.autenticacaoUsuario(objUsuarioPessoa);

      //Caso tenha uma nova linha do sql, ou seja um resultado válido, ele dá a mensagem de seja bem vindo.
      if(rsUsuarioDao.next())
      {
        //Chamar tela que quero abrir
        System.out.printf("Seja bem vindo(a), %s!!!!! ",objUsuarioPessoa.getNome_pessoa());
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

    sc.close();
}
