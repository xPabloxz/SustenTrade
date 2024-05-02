package VIEW;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

import MODEL.PessoaMODEL;

//Conhece o DAO. Lugar de alterações(Model)
public class LoginVIEW
{

    public static void main ( String[] args)
  {
    Scanner sc = new Scanner(System.in);
    String nome_pessoa, senha_pessoa;

    


    System.out.println("Qual o nome do usuário?");
    nome_pessoa = sc.nextLine();

    System.out.println("Qual a senha do usuário?");
    senha_pessoa = sc.nextLine();

    objUsuarioPessoa.setNome_pessoa(nome_pessoa);
    objUsuarioPessoa.setSenha_pessoa(senha_pessoa); 

    
  }
  
}

