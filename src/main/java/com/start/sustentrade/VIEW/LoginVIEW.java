package com.start.sustentrade.VIEW;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

import com.start.sustentrade.CONTROLLER.UsuarioController;

//Conhece o DAO. Lugar de alterações(Model)
public class LoginVIEW
{

    public static void main ( String[] args)
  {
    Scanner sc = new Scanner(System.in);
    String nome_usuario, senha_usuario;

    UsuarioController usuario = new UsuarioController();

    System.out.println("Qual o nome do usuário?");
    nome_usuario = sc.nextLine();

    System.out.println("Qual a senha do usuário?");
    senha_usuario = sc.nextLine();

    usuario.LoginUsuario(nome_usuario, senha_usuario);

    sc.close();

    
  }
  
}

