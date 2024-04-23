import java.util.Scanner;

import Source.usuarioPessoaDTO;
import java.sql.SQLException;
import DAO.UsuarioPessoaDAO;



public class LoginVIEW
{

    public static void main ( String[] args)
  {
    Scanner sc = new Scanner(System.in);
    String nome_usuarioPessoa, senha_usuarioPessoa, txtNome_usuarioPessoa, txtSenha_usuarioPessoa, btnEntrarSistema;

    try
    {
      System.out.println("Qual o nome do usuário?");
      txtNome_usuarioPessoa = sc.nextLine();
      nome_usuarioPessoa = txtNome_usuarioPessoa.getText();

      System.out.println("Qual a senha do usuário?")
      txtSenha_usuarioPessoa = sc.nextLine();
      senha_usuarioPessoa = txtSenha_usuarioPessoa.getText();

      UsuarioPessoaDTO objUsuarioPessoaDto = new UsuarioPessoaDTO();


      objUsuarioPessoaDto.setNome_usuarioPessoa(nome_usuarioPessoa);
      objUsuarioPessoaDto.setSenha_usuarioPessoa(senha_usuarioPessoa); 
      
      UsuarioDAO objUsuarioPessoaDao = new UsuarioPessoaDAO();
      ResultSet rsUsuarioDao = objUsuarioPessoaDao.autenticacaoUsuario(objUsuarioPessoaDto);

      if(rsUsuarioDao.next())
      {
        //Chamar tela que quero abrir
        System.out.printf("Seja bem vindo, %s!!!!! ",objUsuarioPessoaDto.getNome_usuarioPessoa());
      }
      else
      {
        //Enviar mensagem de erro
        JOptionPane.showMessageDialog(null,"Usuario ou senha inválida!")
      }

    }
    catch(SQLException erro)
    {
      JOptionPane.showMessageDialog(null,"loginVIEW: " + erro);
    }
    
  }
  
}
