package CONTROLLER;
import java.sql.ResultSet;
import java.sql.SQLException;

import DAO.ConexaoDAO;
import DAO.PessoaDAO;
import MODEL.PessoaMODEL;
import VIEW.LoginVIEW;

//pesquisa,exclusão, alteração, gravação. Conhece o DAO, Model e VIEW. (Controller)
public class UsuarioController 

{
  //Instância necessária para pegar o método de autenticação do usuário.
    PessoaDAO objPessoaDao = new PessoaDAO();

    //Instância necessária para usar como parâmetro no método de autenticação do usuário.
    PessoaMODEL objUsuarioPessoa = new PessoaMODEL();

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

    sc.close();
}
