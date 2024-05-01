CREATE DATABASE sustenTroca
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_general_ci;
USE sustenTroca;

CREATE TABLE usuarios (
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
    cnpj                         VARCHAR(14),
    descricao                    TEXT,
    usuario_id                   INT,
    FOREIGN KEY (usuario_id)     REFERENCES usuarios(id)
);


CREATE TABLE materiais (
    id                           INT AUTO_INCREMENT PRIMARY KEY,
    nome                         VARCHAR(100) NOT NULL,
    tipo                         ENUM('reutilizavel', 'reciclavel') NOT NULL,
    descricao                    TEXT,
    estado                       ENUM('novo', 'usado') NOT NULL,
    tempo_uso                    INT, -- Tempo de uso em meses
    disponivel                   BOOLEAN NOT NULL DEFAULT TRUE, -- Indica se o material está disponível para transação
    usuario_id                   INT,
    FOREIGN KEY (usuario_id)     REFERENCES usuarios(id)
);


CREATE TABLE transacoes (
    id                           INT AUTO_INCREMENT PRIMARY KEY,
    material_id                  INT,
    tipo                         ENUM('venda', 'troca', 'doacao') NOT NULL,
    preco                        DECIMAL(10, 2),
    comprador_id                 INT, -- usuario que comprou/trocou/recebeu a doação
    FOREIGN KEY (material_id)    REFERENCES materiais(id),
    FOREIGN KEY (comprador_id)   REFERENCES usuarios(id)
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


INSERT INTO usuarios (nome, sexo, dataNascimento, email, senha)
VALUES 
    ('Maria Eduarda', 'F', '1990-03-15', 'mariaduds@email.com', '5002ef'),
    ('Lucas', 'M', '2004-07-20', 'Lucas@email.com', '1462sd1'),
    ('Pablo', 'M', '1993-12-10', 'pablo@email.com', '8599ds63'),
    ('Matheus', 'M', '2001-09-18', 'Matheus@email.com', '123sfd3'),
    ('Laura', 'F', '1988-09-03', 'laura@email.com', 'xy78z');


INSERT INTO empresas (nome, cnpj, descricao, usuario_id)
VALUES 
    ('Reecicle', '12345678000190', 'Reciclagem de Eletronicos', 1),
    ('Emlurb', '67891234000156', 'Reutilização de plástico', 2),
    ('Winner', '89012345000178', 'Doação de roupas usadas', 3),
    ('Trapeiros do Emaús', '45678901000123', 'Venda de produtos sustentáveis', 4),
    ('Cataki', '23456789000134', 'Reciclagem de eletrônicos', 5);


INSERT INTO materiais (nome, tipo, descricao, estado, tempo_uso, usuario_id)
VALUES 
    ('Papel para reciclar', 'reciclavel', 'Papel branco A4', 'usado', 3, 1),
    ('Garrafas de plástico', 'reciclavel', 'Garrafas PET de 500ml', 'usado', 6, 2),
    ('Camiseta usada', 'reutilizavel', 'Camiseta de algodão tamanho M', 'usado', 12, 3),
    ('Celular Xiomi', 'reciclavel', 'Smartphone com tela quebrada', 'usado', 24, 4),
    ('Moletom', 'reutilizavel', 'Moletom adidas', 'novo', NULL, 5);


INSERT INTO transacoes (material_id, tipo, preco, comprador_id)
VALUES 
    (1, 'doacao', NULL, 3),
    (2, 'troca', NULL, 1),
    (3, 'venda', 87.50, 5),
    (4, 'doacao', NULL, 2),
    (5, 'venda', 20.00, 1);


INSERT INTO anuncios (titulo, descricao, empresa_id)
VALUES 
    ('Campanha de reciclagem', 'Ajude o meio ambiente, traga seu papel para reciclar', 1),
    ('Nova linha de produtos', 'Conheça nossa linha de produtos feitos com plástico reciclado', 2),
    ('Doação de roupas', 'Estamos recebendo doações de roupas em bom estado', 3),
    ('Promoção de eletrônicos', 'Descontos especiais em eletrônicos reciclados', 4),
    ('Sustentabilidade em destaque', 'Confira nossos produtos sustentáveis em destaque esta semana', 5);


INSERT INTO pontos_coleta (nome, endereco, pontoDereferencia)
VALUES 
    ('Ponto de coleta de papel', 'Rua das Flores, 123', 'Próximo ao mercado Mix Mateus'),
    ('Ponto de coleta de plástico', 'Avenida Principal, 456', 'Em frente à Faculdade FICR'),
    ('Ponto de doação de roupas', 'Rua da Caridade, 789', 'Perto da igreja São João'),
    ('Ponto de coleta de eletrônicos', 'Avenida das Tecnologias, 1010', 'No shopping Boa Vista'),
    ('Ponto de troca de materiais', 'Av. caxangá, 222', 'Parada do BRT');

SELECT u.nome AS nome_usuario, m.nome AS nome_material                                            -- todos os usuários e seus materiais
FROM usuarios u
INNER JOIN materiais m ON u.id = m.usuario_id;



SELECT *                                                                                          -- todos os materiais disponíveis para transação
FROM materiais
WHERE disponivel = TRUE;
 
 

SELECT a.titulo, a.descricao, e.nome AS nome_empresa                                              -- anúncios e suas empresas
FROM anuncios a
INNER JOIN empresas e ON a.empresa_id = e.id;



SELECT m.nome AS nome_material, u.nome AS nome_usuario, e.nome AS nome_empresa                    -- materiais e seus usuários e empresas
FROM materiais m
INNER JOIN usuarios u ON m.usuario_id = u.id
INNER JOIN empresas e ON u.id = e.usuario_id;


SELECT u.nome AS nome_usuario, t.tipo AS tipo_transacao                                           -- usuários que realizaram transações de doação:
FROM usuarios u
INNER JOIN transacoes t ON u.id = t.comprador_id
WHERE t.tipo = 'doacao';
