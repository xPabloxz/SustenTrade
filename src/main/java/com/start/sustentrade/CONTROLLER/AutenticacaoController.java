package com.start.sustentrade.Controller;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.web.bind.annotation.RestController;

import com.start.sustentrade.Model.EmpresaModel;
import com.start.sustentrade.Model.PessoaModel;
import com.start.sustentrade.Model.UsuarioModel;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


//Classe do Usuario. Acesso do objeto ao usuário. Os comandos sql acontecem aqui.
@RestController //Responde por requisições
@RequestMapping(value="/Autenticacao")
public class AutenticacaoController 
{
  Connection con;

  //Método de autenticação do usuário através do objUsuarioPessoaDto que recebe os gets and sets da tela de usuario.
  public ResultSet autenticacaoUsuario(UsuarioModel objUsuario)
  {
    //Antes de fazer qualquer entrada sql é necessário a conexão como está sendo feita aqui.
    con = new ConexaoController().AbreBd();
    
    try
    {
       String sql = "select * from usuarios where nome = ? and senha = ?";
       
       PreparedStatement pstm = con.prepareStatement(sql);

      // No 1º ponto de interrogação ele pega o valor da variável nome e no 2º o valor da variável senha.
       pstm.setString(1,objUsuario.getNome());
       pstm.setString(2,objUsuario.getSenha());

       /**ResultSet promove métodos getters, ou seja, guarda resultados provenientes de uma query SQL através de um preparedStatement. 
          Aqui na variável rs do ResultSet é guardado a execução do método executeQuery que pede para fazer todo o processo com o pstm acima**/
      ResultSet rs = pstm.executeQuery();

       return rs;
    }
    catch(SQLException erro)
    {
      System.out.println("Erro na AutenticacaoController! Mensagem: " + erro);
      return null;
    }

  }





}
