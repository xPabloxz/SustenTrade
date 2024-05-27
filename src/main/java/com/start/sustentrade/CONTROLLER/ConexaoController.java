package com.start.sustentrade.Controller;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import org.springframework.web.bind.annotation.RestController;


//Classe de conexão para acessar os objetos (Data Access Object), Acesso do objeto a conexão.
@RestController
public class ConexaoController 
{
  //variável do tipo connection

  private Statement sqlmgr = null;

//Método do tipo Connection(envia declarações para o banco de dados) para a abertura do banco de dados.
  public Connection AbreBd()
  {
    Connection con = null;

    //Tentativa de conexão, caso não consiga gera a exceção através do catch e escreve em tela
    try 
    {
      /**Driver de conexão(jdbc:mysql://) + Local do banco de dados e porta(localhost:3306)
        + banco de dados(/sustentrade) + usuário(?user=root) e senha em branco(&password=)
      **/
      String url = "jdbc:mysql://localhost:3306/sustenTrade?user=root&password=" ;
      con = DriverManager.getConnection(url);
      sqlmgr = con.createStatement();
    } 
    catch (SQLException error)
    {
      System.out.println("Erro no AbreBd!  Mensagem: " + error.getMessage());
    }

    return con;
  }

}
