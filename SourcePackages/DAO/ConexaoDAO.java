import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import javax.swing.JOptionPane;

//Classe de conexão para acessar os objetos (Data Access Object)
public class ConexaoDAO 
{
  private Connection con = null;
  private Statement sqlmgr = null;

//Método para a abertura do banco de dados
  public Connection OpenDatabase()
  {
    try 
    {
      String url = "jdbc:mysql://localhost:3306/unitypro?user=root&password=" ;
      con = DriverManager.getConnection(url);
      System.out.println("Conectado com Sucesso!");
      sqlmgr = con.createStatement();
    } catch (SQLException error)
    {
      JOptionPane.showMessageDialog(null,"ConexaoDao" + error.getMessage());
    }

    return con;
  }

  // retorna o total de registros afetados, caso dê erro gera o -1
  public int ExecuteQuery(String sql)
  {
    try 
    {
      return sqlmgr.executeUpdate(sql); //insert/delete/update/create
    } catch (Exception error) {
      System.out.println("Error on conection: ");
    }
    return -1;
  }

}
