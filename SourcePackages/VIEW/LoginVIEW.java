package VIEW;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

import DTO.UsuarioPessoaDTO;
import DAO.UsuarioPessoaDAO;

public class LoginVIEW
{

    public static void main ( String[] args)
  {
    Scanner sc = new Scanner(System.in);
    String nome_pessoa, senha_pessoa;

    //Instância necessária para pegar o método de autenticação do usuário.
    UsuarioPessoaDAO objUsuarioPessoaDao = new UsuarioPessoaDAO();

    //Instância necessária para usar como parâmetro no método de autenticação do usuário.
    UsuarioPessoaDTO objUsuarioPessoaDto = new UsuarioPessoaDTO();


    System.out.println("Qual o nome do usuário?");
    nome_pessoa = sc.nextLine();

    System.out.println("Qual a senha do usuário?");
    senha_pessoa = sc.nextLine();

    objUsuarioPessoaDto.setNome_pessoa(nome_pessoa);
    objUsuarioPessoaDto.setSenha_pessoa(senha_pessoa); 

    try
    {
     
      ResultSet rsUsuarioDao = objUsuarioPessoaDao.autenticacaoUsuario(objUsuarioPessoaDto);

      //Caso tenha uma nova linha do sql, ou seja um resultado válido, ele dá a mensagem de seja bem vindo.
      if(rsUsuarioDao.next())
      {
        //Chamar tela que quero abrir
        System.out.printf("Seja bem vindo(a), %s!!!!! ",objUsuarioPessoaDto.getNome_pessoa());
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
  
}

