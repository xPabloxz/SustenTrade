CREATE DATABASE sustenTrade1
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_general_ci;
USE sustenTrade1;

CREATE TABLE pessoas (
    id                           INT AUTO_INCREMENT PRIMARY KEY,
    nome                         VARCHAR(100) NOT NULL,
    sexo                         ENUM('F','M'),
    dataNascimento               DATE,
    email VARCHAR(100)           NOT NULL UNIQUE,
    senha VARCHAR(100)           NOT NULL  
)DEFAULT CHARSET = utf8;


CREATE TABLE empresas (
    id                           INT AUTO_INCREMENT PRIMARY KEY,
    nome                         VARCHAR(100) NOT NULL,
    email                        VARCHAR(100) NOT NULL UNIQUE, -- Add email field
    cnpj                         VARCHAR(14),
    descricao                    TEXT,
    pessoa_id                    INT,
    FOREIGN KEY (pessoa_id)      REFERENCES pessoas(id)
);


CREATE TABLE materiais (
    id                           INT AUTO_INCREMENT PRIMARY KEY,
    nome                         VARCHAR(100) NOT NULL,
    tipo                         ENUM('reutilizavel', 'reciclavel') NOT NULL,
    descricao                    TEXT,
    estado                       ENUM('novo', 'usado') NOT NULL,
    tempo_uso                    INT, -- Tempo de uso em meses
    disponivel                   BOOLEAN NOT NULL DEFAULT TRUE, -- Indica se o material está disponível para transação
    pessoa_id                    INT,
    FOREIGN KEY (pessoa_id)      REFERENCES pessoas(id)
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


INSERT INTO empresas (nome, email, cnpj, descricao, pessoa_id)
VALUES 
    ('Coltthing Company', 'coltthing@email.com', '12345678000190', 'Empresa de produtos variados', 1),
    ('Furnture', 'furniture@email.com', '67891234000156', 'Bicicletas usadas pra vender', 2),
    ('Wave Grife', 'wavegrife@email.com', '89012345000178', 'Doação de roupas usadas', 3),
    ('Trapeiros do Emaús', 'trapeiros@email.com', '45678901000123', 'Venda de produtos sustentáveis', 4),
    ('Cataki', 'cataki@email.com', '23456789000134', 'Reciclagem de eletrônicos', 5);


INSERT INTO materiais (nome, tipo, descricao, estado, tempo_uso, pessoa_id)
VALUES 
    ('Maquiagem', 'reutilizavel', 'Maquiagem pra adolecentes', 'nova', 3, 1),
    ('Bike', 'reutilizavel', 'seimples, nunca quebrou', 'usado', 6, 2),
    ('Camiseta usada', 'reciclavel', 'Camiseta de algodão tamanho M', 'usado', 12, 3),
    ('Celular Wave pro 17', 'reutilizavel', 'Smartphone', 'novo', 24, 4),
    ('Garrafas pet', 'reciclavel', 'Garrafas encotradas na rua', 'novo', NULL, 5);

INSERT INTO transacoes (material_id, tipo, preco, comprador_id)
VALUES 
    (1, 'doacao', NULL, 3),
    (2, 'troca', NULL, 1),
    (3, 'doacao', NULL, 5),
    (4, 'venda', 2000, 2),
    (5, 'doacao', 20.00, 1);

INSERT INTO anuncios (titulo, descricao, empresa_id)
VALUES 
    ('Doação de Maquiagem', 'Participe da nossa campanha de doação de maquiagem para adolescentes em vulnerabilidade.', 1),
    ('Promoção de Bicicletas Usadas', 'Aproveite nossa promoção de bicicletas usadas em bom estado.', 2),
    ('Doação de moletom', 'Estamos recebendo doações de roupas em bom estado', 3),
    ('Promoção de eletrônicos', 'Descontos especiais em eletrônicos', 4),
    ('Coleta sustentável', 'Confira nossas campanhas sustentáveis esta semana', 5);
    
    
INSERT INTO pontos_coleta (nome, endereco, pontoDereferencia)
VALUES 
    ('Ponto de coleta de papel', 'Rua das Flores, 123', 'Próximo ao mercado Mix Mateus'),
    ('Ponto de coleta de plástico', 'Avenida Principal, 456', 'Em frente à Faculdade FICR'),
    ('Ponto de doação de roupas', 'Rua da Caridade, 789', 'Perto da igreja São João'),
    ('Ponto de coleta de eletrônicos', 'Avenida das Tecnologias, 1010', 'No shopping Boa Vista'),
    ('Ponto de troca de materiais', 'Av. caxangá, 222', 'Parada do BRT');




SELECT p.nome AS nome_pessoa, m.nome AS nome_material                           -- todas as pessoas e seus materiais
FROM pessoas p
INNER JOIN materiais m ON p.id = m.pessoa_id;

SELECT *                                                                                          -- todos os materiais disponíveis para transação
FROM materiais
WHERE disponivel = TRUE;

SELECT a.titulo, a.descricao, e.nome AS nome_empresa                                              -- anúncios e suas empresas
FROM anuncios a
INNER JOIN empresas e ON a.empresa_id = e.id;

SELECT m.nome AS nome_material, p.nome AS nome_pessoa, e.nome AS nome_empresa                    -- materiais e suas pessoas e empresas
FROM materiais m
INNER JOIN pessoas p ON m.pessoa_id = p.id
INNER JOIN empresas e ON p.id = e.pessoa_id;



