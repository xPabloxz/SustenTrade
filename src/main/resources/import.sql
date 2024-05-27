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
