package com.start.sustentrade.Controller;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.start.sustentrade.Model.UsuarioModel;

//pesquisa,exclusão, alteração, gravação. Conhece o DAO, Model e VIEW. (Controller)
public class LoginController 

{
  public void LoginUsuario(String nome_usuario, String senha_usuario)
  {
     //Instância necessária para usar como parâmetro no método de autenticação do usuário.
     UsuarioModel objUsuarioMODEL = new UsuarioModel();

    //Instância necessária para pegar o método de autenticação do usuário.
    AutenticacaoController objUsuario = new AutenticacaoController();

    objUsuarioMODEL.setNome(nome_usuario);
    objUsuarioMODEL.setSenha(senha_usuario); 

    try
    {
     
      ResultSet rsUsuarioDao = objUsuario.autenticacaoUsuario(objUsuarioMODEL);

      //Caso tenha uma nova linha do sql, ou seja um resultado válido, ele dá a mensagem de seja bem vindo.
      if(rsUsuarioDao.next())
      {
        //Chamar tela que quero abrir
        System.out.printf("Seja bem vindo(a), %s!!!!! ",objUsuarioMODEL.getNome());
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
