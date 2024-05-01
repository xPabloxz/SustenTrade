package DAO;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;


//Classe de conexão para acessar os objetos (Data Access Object)
public class DAOConnection 
{
  //variável do tipo connection

  private Statement sqlmgr = null;

//Método do tipo Connection(envia declarações para o banco de dados) para a abertura do banco de dados.
  public Connection OpenDatabase()
  {
    Connection con = null;

    //Tentativa de conexão, caso não consiga gera a exceção através do catch e escreve em tela
    try 
    {
      /**Driver de conexão(jdbc:mysql://) + Local do banco de dados e porta(localhost:3306)
        + banco de dados(/sustentrade) + usuário(?user=root) e senha em branco(&password=)
      **/
      String url = "jdbc:mysql://localhost:3306/sustentrade?user=root&password=" ;
      con = DriverManager.getConnection(url);
      sqlmgr = con.createStatement();
    } 
    catch (SQLException error)
    {
      System.out.println("DAOConnection error" + error.getMessage());
    }

    return con;
  }

  // retorna o total de registros afetados, caso dê erro gera o -1
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
