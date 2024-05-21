package com.start.sustentrade.DAO;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;


//Classe de conexão para acessar os objetos (Data Access Object), Acesso do objeto a conexão.
public class ConexaoDAO 
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
      System.out.println("DAOConnection error!  Message: " + error.getMessage());
    }

    return con;
  }

  // Método para mexer no banco de dados retorna o total de registros afetados, caso dê erro gera o -1
  public int ExecuteQuery(String sql)
  {
    try 
    {
      return sqlmgr.executeUpdate(sql); //insert/delete/update/create
    } 
    catch (Exception error) {
      System.out.println("Error on conection: ");
    }
    return -1;
  }

}
