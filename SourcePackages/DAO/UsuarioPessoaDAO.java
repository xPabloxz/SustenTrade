package DAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.JOptionPane;


public class UsuarioPessoaDAO 
{
  Connection con;

  public ResultSet autenticacaoUsuario(UsuarioPessoaDTO objUsuarioPessoaDto)
  {
    //Estava dando erro aqui.
    DAOConnection con = new DAOConnection();
    con.OpenDatabase();

    try
    {
      PreparedStatement mystm;

       String sql = "select * from usuarioPessoa where nome_usuarioPessoa = ? and senha_usuarioPessoa = ?";
       mystm = ((Connection) con).prepareStatement(sql);
       mystm.setString(1,objUsuarioPessoaDto.getNome_usuarioPessoa());
       mystm.setString(2,objUsuarioPessoaDto.getSenha_usuarioPessoa());

       ResultSet rs = pstm.executeQuery();
       return rs;

    }
    catch(SQLException erro)
    {
      JOptionPane.showMessageDialog(null,"UsuarioDAO: " + erro);
      return null;
    }


  }
}
