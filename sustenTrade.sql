CREATE DATABASE sustentrade
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_general_ci;
USE sustentrade;

CREATE TABLE pessoas (
    id                           INT AUTO_INCREMENT PRIMARY KEY,
    nome                         VARCHAR(100) NOT NULL,
    sexo                         ENUM('F','M'),
    dataNascimento               DATE,
    email VARCHAR(100)           NOT NULL UNIQUE,
    senha VARCHAR(100)           NOT NULL UNIQUE 
)DEFAULT CHARSET = utf8;

CREATE TABLE empresas (
    id                           INT AUTO_INCREMENT PRIMARY KEY,
    nome                         VARCHAR(100) NOT NULL,
    email                        VARCHAR(100) NOT NULL UNIQUE, -- Add email 
    cnpj                         VARCHAR(14),
    descricao                    TEXT,
    pessoa_id                   INT,
    FOREIGN KEY (pessoa_id)     REFERENCES pessoas(id)
);


CREATE TABLE materiais (
    id                           INT AUTO_INCREMENT PRIMARY KEY,
    nome                         VARCHAR(100) NOT NULL,
    tipo                         ENUM('reutilizavel', 'reciclavel') NOT NULL,
    descricao                    TEXT,
    estado                       ENUM('novo', 'usado') NOT NULL,
    tempo_uso                    INT, -- Tempo de uso em meses
    disponivel                   BOOLEAN NOT NULL DEFAULT TRUE, -- Indica se o material está disponível para transação
    pessoa_id                   INT,
    FOREIGN KEY (pessoa_id)     REFERENCES pessoas(id)
);


CREATE TABLE transacoes (
    id                           INT AUTO_INCREMENT PRIMARY KEY,
    material_id                  INT,
    tipo                         ENUM('venda', 'troca', 'doacao') NOT NULL,
    preco                        DECIMAL(10, 2),
    comprador_id                 INT, -- pessoa que comprou/trocou/recebeu a doação
    FOREIGN KEY (material_id)    REFERENCES materiais(id),
    FOREIGN KEY (comprador_id)   REFERENCES pessoas(id)
);



CREATE TABLE anuncios (
    id                           INT AUTO_INCREMENT PRIMARY KEY,
    titulo                       VARCHAR(100) NOT NULL,
    descricao                    TEXT,
    empresa_id                   INT,
    FOREIGN KEY (empresa_id)     REFERENCES empresas(id)
);


CREATE TABLE pontos_coleta (
    id                           INT AUTO_INCREMENT PRIMARY KEY,
    nome                         VARCHAR(100) NOT NULL,
    endereco                     VARCHAR(255) NOT NULL,
    pontoDereferencia            VARCHAR(255) NOT NULL
);


INSERT INTO pessoas (nome, sexo, dataNascimento, email, senha)
VALUES 
    ('Maria Eduarda', 'F', '1990-03-15', 'mariaduds@email.com', '5002ef'),
    ('Lucas', 'M', '2004-07-20', 'Lucas@email.com', '1462sd1'),
    ('Pablo', 'M', '1993-12-10', 'pablo@email.com', '8599ds63'),
    ('Matheus', 'M', '2001-09-18', 'Matheus@email.com', '123sfd3'),
    ('Laura', 'F', '1988-09-03', 'laura@email.com', 'xy78z');


INSERT INTO empresas (nome, cnpj, email, descricao, pessoa_id)
VALUES 
    ('Coltthing Company', '12345678000190', 'coltthing@email.com', 'Reciclagem de Eletronicos', 1),
    ('Furnture', '67891234000156', 'furniture@email.com', 'Reutilização de plástico', 2),
    ('Wave Grife', '89012345000178', 'wavegrife@email.com', 'Doação de roupas usadas', 3),
    ('Trapeiros do Emaús', '45678901000123', 'trapeiros@email.com', 'Venda de produtos sustentáveis', 4),
    ('Cataki', '23456789000134', 'cataki@email.com',  'Reciclagem de eletrônicos', 5);


INSERT INTO materiais (nome, tipo, descricao, estado, tempo_uso, pessoa_id)
VALUES 
    ('Maquiagem', 'reutilizavel', 'Maquiagem pra adolecentes', 'novo', 3, 1),
    ('Bike', 'reutilizavel', 'simples, nunca quebrou', 'usado', 6, 2),
    ('Camiseta usada', 'reutilizavel', 'Camiseta de algodão tamanho M', 'usado', 12, 3),
    ('Celular Wave pro 17', 'reutilizavel', 'Smartphone', 'novo', 24, 4),
    ('Garrafas pet', 'reciclavel', 'Garrafas recicladas', 'novo', NULL, 5);


INSERT INTO transacoes (material_id, tipo, preco, comprador_id)
VALUES 
    (1, 'doacao', NULL, 3),
    (2, 'troca', NULL, 1),
    (3, 'doacao', 87.50, 5),
    (4, 'venda', 2000, 2),
    (5, 'doacao', NULL, 1);


INSERT INTO anuncios (titulo, descricao, empresa_id)
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
    ('Ponto de troca de materiais', 'Av. caxangá, 222', 'Parada do BRT');

SELECT u.nome AS nome_pessoa, m.nome AS nome_material                                            -- todos os usuários e seus materiais
FROM pessoas u
INNER JOIN materiais m ON u.id = m.pessoa_id;



SELECT *                                                                                          -- todos os materiais disponíveis para transação
FROM materiais
WHERE disponivel = TRUE;
 
 

SELECT a.titulo, a.descricao, e.nome AS nome_empresa                                              -- anúncios e suas empresas
FROM anuncios a
INNER JOIN empresas e ON a.empresa_id = e.id;



SELECT m.nome AS nome_material, u.nome AS nome_pessoa, e.nome AS nome_empresa                    -- materiais e seus usuários e empresas
FROM materiais m
INNER JOIN pessoas u ON m.pessoa_id = u.id
INNER JOIN empresas e ON u.id = e.pessoa_id;


SELECT u.nome AS nome_pessoa, t.tipo AS tipo_transacao                                           -- usuários que realizaram transações de doação:
FROM pessoas u
INNER JOIN transacoes t ON u.id = t.comprador_id
WHERE t.tipo = 'doacao';

SELECT pc.id, pc.nome AS nome_ponto, pc.endereco, pc.pontoDereferencia, u.id AS id_pessoa, u.nome AS nome_pessoa
FROM pontos_coleta pc
CROSS JOIN pessoas u
WHERE u.nome = 'Matheus';