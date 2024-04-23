CREATE database unitypro;
USE unitypro;
drop database unitypro;


CREATE TABLE usuarioPessoa
(
  id_usuarioPessoa INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  nome_usuarioPessoa VARCHAR(45),
  senha_usuarioPessoa VARCHAR(45)
);

INSERT INTO usuarioPessoa (nome_usuarioPessoa,senha_usuarioPessoa) VALUES
("pablodbandeira@hotmail.com","@1234567O"),("marcosvsantos@gmail.com","@@%%marcos12"),
("paulocsilva@gmail.com","12345**"),("necincarvalho@hotmail.com","#$neci12"),
("andressagsouza@hotmail.com","@$%123456");

select * from usuarioPessoa;


CREATE TABLE usuarioEmpresa
(
	id_usuarioEmpresa INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome_usuarioEmpresa VARCHAR(45),
    senha_usuarioEmpresa VARCHAR(45)
);

CREATE TABLE cadastroEmpresa 
(
  id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  nome varchar(45),
  cnpj INT(14),
  talentosDesejados varchar(100),
  id_usuario INT(16),
  FOREIGN KEY (id_usuario) REFERENCES usuario (id)
);


CREATE TABLE cadastroPessoal 
(
  id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  cpf INT(11),
  idade INT(3),
  id_usuario INT(16),
  dataNascimento DATE,
  sexo ENUM('F','M'),
  talentos VARCHAR(100),
  formacao VARCHAR(90)
  FOREIGN KEY (id_usuario) REFERENCES usuario (id)
);

INSERT INTO usuario 
(nome, dataNascimento, sexo, talentos, formacao) VALUES
('Marcos', '1984-01-02', 'M', 'Engenheiro de machine learning', 'Analise e desenvolvimento de sistemas'),
('Lucas', '1952-04-09', 'M', 'Gestor de tecnologia', 'Engenharia de software'),
('Matheus', '2000-12-07', 'M', 'Analista', 'Tecnologia da informção'),
('Lhays', '2010-11-17', 'F', 'Linguaguem C#', 'Sistemas de informação'),
('Laura', '2012-08-22', 'F', 'Desenvolvedora Back end', 'Ciência da computação');

insert into cadastroEmpresa (nome,cnpj,talentosDesejados,id_usuario) values
("Brasnove",999999999,"C#,Cobol",1),
("Disnove",1010101010,"Java,Python",2),
("Baluarte",2020202020,"C,Linux",3),
("DonaCasa",33333333,"Dart",4),
("MercadoJovem",5555555,"Html,Css,Javascript",5);

INSERT INTO cadastroPessoal (cpf, idade,id_usuario) VALUES
('900289221', '22',1),
('237254871', '33',2),
('258945791', '45',3),
('896547592', '65',4),
('456935791', '25',5);

INSERT INTO usuario 
(nome, dataNascimento, sexo, talentos, formacao) VALUES
('Pablo', '1997-09-19', 'M', 'C#,Html,Css,JavaScript', 'Engenheiro de Software');



select * from usuario;

truncate table cadastroPessoal;