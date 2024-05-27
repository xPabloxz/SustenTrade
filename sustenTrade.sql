CREATE DATABASE sustenTrade
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_general_ci;
USE sustenTrade;

CREATE TABLE usuarios (
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(45),
	email VARCHAR(45),
	senha VARCHAR(45),
    tipo ENUM('pessoa','empresa','parceiro')
);

CREATE TABLE pessoas (
    id                    		BIGINT AUTO_INCREMENT PRIMARY KEY,
    sexo                        ENUM('F', 'M'),
    dataNascimento              DATE,
    usuarios_id					BIGINT,
    FOREIGN KEY (usuarios_id)       REFERENCES usuarios(id)
) DEFAULT CHARSET = utf8; 

CREATE TABLE empresas (
    id                            BIGINT AUTO_INCREMENT PRIMARY KEY,
    cnpj                          VARCHAR(14),
    descricaoEmpresa              TEXT,
    usuarios_id					  BIGINT,
    FOREIGN KEY (usuarios_id)       REFERENCES usuarios(id)
);

CREATE TABLE parceiros (
	id                            BIGINT AUTO_INCREMENT PRIMARY KEY,
	motivoParceria	TEXT,
    usuarios_id		BIGINT,
    empresas_id		BIGINT,
    FOREIGN KEY (usuarios_id)		REFERENCES usuarios(id),
    FOREIGN KEY (empresas_id)		REFERENCES empresas(id)
);

CREATE TABLE materiais (
    id                            BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome                          VARCHAR(100) NOT NULL,
    tipo                          ENUM('reutilizavel', 'reciclavel') NOT NULL,
    descricao                     TEXT,
    estado                        ENUM('novo', 'usado') NOT NULL,
    tempo_uso                     INT, -- Tempo de uso em meses
    disponivel                    BOOLEAN NOT NULL DEFAULT TRUE, -- Indica se o material está disponível para transação
    pessoas_id                     BIGINT,
    FOREIGN KEY (pessoas_id)       REFERENCES pessoas(id)
);

CREATE TABLE transacoes (
    id                            BIGINT AUTO_INCREMENT PRIMARY KEY,
    tipo                          ENUM('venda', 'troca', 'doacao') NOT NULL,
    preco                         DECIMAL(10, 2),
    materiais_id                   BIGINT,
    pessoas_id                     BIGINT, -- usuário que comprou/trocou/recebeu a doação
    FOREIGN KEY (materiais_id)     REFERENCES materiais(id),
    FOREIGN KEY (pessoas_id)    REFERENCES pessoas(id)
);

CREATE TABLE anuncios (
    id                            BIGINT AUTO_INCREMENT PRIMARY KEY,
    titulo                        VARCHAR(100) NOT NULL,
    descricao                     TEXT,
    empresas_id                    BIGINT,
    FOREIGN KEY (empresas_id)      REFERENCES empresas(id)
); 

CREATE TABLE pontos_coleta (
    id                            BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome                          VARCHAR(100) NOT NULL,
    endereco                      VARCHAR(255) NOT NULL,
    pontoDereferencia             VARCHAR(255) NOT NULL
); 

INSERT INTO usuarios (nome, email, senha, tipo)
VALUES 
    ('Maria Eduarda', 'mariaduds@email.com', '5002ef','pessoa'),
    ('Lucas', 'Lucas@email.com', '1462sd1','pessoa'),
    ('Pablo', 'pablo@email.com', '8599ds63','pessoa'),
    ('Matheus', 'Matheus@email.com', '123sfd3','pessoa'),
    ('Laura', 'laura@email.com', 'xy78z','pessoa'),
    ('Coltthing Company', 'coltthing@email.com','123243efasd','parceiro'),
    ('Furnture', 'furniture@email.com','saokdsfpodkmfo','parceiro'),
    ('Wave Grife', 'wavegrife@email.com','109388u4ji','parceiro'),
    ('Trapeiros do Emaús', 'trapeiros@email.com','1092iu3iewj','empresa'),
    ('Cataki', 'cataki@email.com','2109i92kmswmdk','empresa');


INSERT INTO pessoas (sexo, dataNascimento,usuarios_id)
VALUES 
    ('F', '1990-03-15',1),
    ('M', '2004-07-20',2),
    ('M', '1993-12-10',3),
    ('M', '2001-09-18',4),
    ('F', '1988-09-03',5);

INSERT INTO empresas (cnpj, descricaoEmpresa, usuarios_id)
VALUES 
    ('12345678000190', 'Reciclagem de Eletronicos', 1),
    ('67891234000156', 'Reutilização de plástico', 2),
    ('89012345000178', 'Doação de roupas usadas', 3),
    ('45678901000123', 'Venda de produtos sustentáveis', 4),
    ('23456789000134','Reciclagem de eletrônicos', 5);


INSERT INTO parceiros (motivoParceria, usuarios_id,empresas_id)
VALUES 
    ('Parceria para promover a reciclagem de eletrônicos e aumentar a conscientização ambiental', 1, 1),
    ('Colaboração para desenvolver soluções sustentáveis para reutilização de plásticos', 2, 2),
    ('Objetivo de ajudar comunidades carentes através da doação de roupas', 3, 3),
    ('Promover a venda de produtos sustentáveis e gerar renda para projetos sociais', 4, 4),
    ('Iniciativa para melhorar a coleta e reciclagem de eletrônicos', 5, 5);

INSERT INTO materiais (nome, tipo, descricao, estado, tempo_uso, disponivel, pessoas_id)
VALUES 
    ('Maquiagem', 'reutilizavel', 'Maquiagem para adolescentes', 'novo', 3, TRUE, 1),
    ('Bike', 'reutilizavel', 'Simples, nunca quebrou', 'usado', 6, TRUE, 2),
    ('Camiseta usada', 'reutilizavel', 'Camiseta de algodão tamanho M', 'usado', 12, TRUE, 3),
    ('Celular Wave pro 17', 'reutilizavel', 'Smartphone', 'novo', 24, TRUE, 4),
    ('Garrafas pet', 'reciclavel', 'Garrafas recicladas', 'novo', NULL, TRUE, 5);

INSERT INTO transacoes (materiais_id, tipo, preco, pessoas_id)
VALUES 
    (1, 'doacao', NULL, 3),
    (2, 'troca', NULL, 1),
    (3, 'doacao', 87.50, 5),
    (4, 'venda', 2000, 2),
    (5, 'doacao', NULL, 1);

INSERT INTO anuncios (titulo, descricao, empresas_id)
VALUES 
    ('Doação de Maquiagem', 'Participe da nossa campanha de doação de maquiagem para adolescentes em vulnerabilidade', 1),
    ('Promoção de Bicicletas Usadas', 'Aproveite nossa promoção de bicicletas usadas em bom estado', 2),
    ('Doação de roupas', 'Estamos recebendo doações de roupas em bom estado', 3),
    ('Promoção de eletrônicos', 'Descontos especiais em eletrônicos', 4),
    ('Coleta sustentável', 'Confira nossas campanhas sustentáveis esta semana', 5);

INSERT INTO pontos_coleta (nome, endereco, pontoDereferencia)
VALUES 
    ('Ponto de coleta de papel', 'Rua das Flores, 123', 'Próximo ao mercado Mix Mateus'),
    ('Ponto de coleta de plástico', 'Avenida Principal, 456', 'Em frente à Faculdade FICR'),
    ('Ponto de doação de roupas', 'Rua da Caridade, 789', 'Perto da igreja São João'),
    ('Ponto de coleta de eletrônicos', 'Avenida das Tecnologias, 1010', 'No shopping Boa Vista'),
    ('Ponto de troca de materiais', 'Av. Caxangá, 222', 'Parada do BRT');

-- Consultas

SELECT pessoas.nome, materiais.nome                                          -- todas as pessoas e seus materiais
FROM pessoas
INNER JOIN materiais ON p.id = m.pessoas_id;

SELECT * FROM materiais WHERE disponivel = TRUE;                                                -- todos os materiais disponíveis para transação

SELECT a.titulo, a.descricao, e.nome AS nome_empresa                                             -- anúncios e suas empresas
FROM anuncios a
INNER JOIN empresasParceira e ON a.empresa_id = e.id;

SELECT m.nome AS nome_material, p.nome AS nome_pessoa, e.nome AS nome_empresa                    -- materiais e suas pessoas e empresas
FROM materiais m
INNER JOIN pessoas p ON m.pessoa_id = p.id
INNER JOIN empresasParceira e ON p.id = e.pessoa_id;

SELECT p.nome AS nome_pessoa, t.tipo AS tipo_transacao                                           -- pessoas que realizaram transações de doação:
FROM pessoas p
INNER JOIN transacoes t ON p.id = t.comprador_id
WHERE t.tipo = 'doacao';

SELECT pc.id, pc.nome AS nome_ponto, pc.endereco, pc.pontoDereferencia, p.id AS id_pessoa, p.nome AS nome_pessoa    -- pontos de coleta associados à pessoa chamada 'Matheus'
FROM pontos_coleta pc
CROSS JOIN pessoas p
WHERE p.nome = 'Matheus';