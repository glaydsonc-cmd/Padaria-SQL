-- Restrição de integridade: cliente deve possuir dados básicos válidos,
-- telefone obrigatório e email único quando informado.
CREATE TABLE cliente (
    id_cliente INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    email VARCHAR(100) UNIQUE,
    endereco VARCHAR(200) NOT NULL,
    CHECK (telefone <> ''),
    CHECK (email IS NULL OR email LIKE '%@%.%')
);

-- Restrição de integridade: funcionário precisa ter cargo e telefone válidos,
-- além de manter a hierarquia por meio do supervisor.
CREATE TABLE funcionario (
    id_funcionario INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(50) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    data_admissao DATE NOT NULL,
    id_supervisor INT,
    FOREIGN KEY (id_supervisor)
        REFERENCES funcionario(id_funcionario),
    CHECK (telefone <> ''),
    CHECK (cargo <> '')
);

-- Restrição de integridade: categoria não pode se repetir e o nome deve ser informado.
CREATE TABLE categoria (
    id_categoria INT PRIMARY KEY,
    nome_categoria VARCHAR(100) NOT NULL UNIQUE,
    descricao_categoria TEXT,
    CHECK (nome_categoria <> '')
);

-- Restrição de integridade: produto não pode ter preço inválido,
-- e o preço de venda deve manter consistência com o custo.
CREATE TABLE produtos (
    id_produto INT PRIMARY KEY,
    nome_produto VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco_unitario DECIMAL(10, 2) NOT NULL CHECK (preco_unitario > 0),
    custo DECIMAL(10, 2) NOT NULL CHECK (custo >= 0),
    preco_unidade_venda DECIMAL(10, 2) NOT NULL CHECK (preco_unidade_venda > 0),
    data_validade DATE,
    id_categoria INT NOT NULL,
    FOREIGN KEY (id_categoria)
        REFERENCES categoria(id_categoria),
    CHECK (nome_produto <> ''),
    CHECK (preco_unitario >= custo),
    CHECK (preco_unidade_venda >= custo)
);

-- Restrição de integridade: pedido deve sempre estar relacionado a cliente e funcionário válidos.
CREATE TABLE pedidos (
    id_pedidos INT PRIMARY KEY,
    data_pedido DATE NOT NULL,
    hora_pedido TIME NOT NULL,
    total_pago DECIMAL(10, 2) NOT NULL CHECK (total_pago >= 0),
    id_cliente INT NOT NULL,
    id_funcionario INT NOT NULL,
    FOREIGN KEY (id_cliente)
        REFERENCES cliente(id_cliente),
    FOREIGN KEY (id_funcionario)
        REFERENCES funcionario(id_funcionario),
    CHECK (hora_pedido BETWEEN '00:00:00' AND '23:59:59')
);

-- Restrição de integridade: cada item precisa representar uma quantidade e preço válidos.
CREATE TABLE item_pedido (
    id_item_pedido INT PRIMARY KEY,
    id_pedido INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL CHECK (quantidade > 0),
    preco_unitario DECIMAL(10, 2) NOT NULL CHECK (preco_unitario > 0),
    FOREIGN KEY (id_pedido)
        REFERENCES pedidos(id_pedidos),
    FOREIGN KEY (id_produto)
        REFERENCES produtos(id_produto)
);

-- Restrição de integridade: estoque e custo do ingrediente não podem ser negativos.
CREATE TABLE ingrediente (
    id_ingredientes INT PRIMARY KEY,
    nome_ingrediente VARCHAR(100) NOT NULL,
    quantidade_estoque INT NOT NULL CHECK (quantidade_estoque >= 0),
    unidade_medida VARCHAR(20) NOT NULL,
    custo_unidade DECIMAL(10, 2) NOT NULL CHECK (custo_unidade >= 0),
    CHECK (nome_ingrediente <> ''),
    CHECK (unidade_medida <> '')
);

-- Restrição de integridade: a mesma ficha não pode repetir o mesmo ingrediente.
CREATE TABLE ficha (
    id_ficha INT PRIMARY KEY,
    id_produtos INT NOT NULL,
    id_ingrediente INT NOT NULL,
    quantidade_necessaria DECIMAL(10, 2) NOT NULL CHECK (quantidade_necessaria > 0),
    FOREIGN KEY (id_produtos)
        REFERENCES produtos(id_produto),
    FOREIGN KEY (id_ingrediente)
        REFERENCES ingrediente(id_ingredientes),
    UNIQUE (id_produtos, id_ingrediente)
);


INSERT INTO cliente
    (id_cliente, nome, telefone, email, endereco)
VALUES
    (1, 'João Silva', '123456789', 'joao.silva@email.com', 'Rua Esmeralda, 123'),
    (2, 'Maria Luciana', '84 9767-1234', 'maria.luciana@email.com', 'Avenida Principal, 456'),
    (3, 'David Martins', '84 9666-2410', 'david.martinsweb@gmail.com', 'Rua Maria Guadalupe, 265'),
    (4, 'Michelle Miller', '84 9999-8888', 'michelle.miller@email.com', 'Travessa das Flores, 789'),
    (5, 'Carlos Eduardo', '84 9876-5432', 'carlos.eduardo@email.com', 'Praça da Liberdade, 101'),
    (6, 'Ana Paula', '84 9123-4567', 'ana.paula@email.com', 'Rua das Palmeiras, 456'),
    (7, 'Lucas Fernando', '84 9988-7766', 'lucas.fernando@email.com', 'Praça da Independência, 202'),
    (8, 'Fernanda Souza', '84 9876-5432', 'fernanda.souza@email.com', 'Avenida Brasil, 789');


INSERT INTO funcionario
    (id_funcionario, nome, cargo, telefone, data_admissao, id_supervisor)
VALUES
    (1, 'Carlos Oliveira', 'Gerente', '84 9123-4567', '2020-01-15', NULL),
    (2, 'Mariana Costa', 'Atendente', '84 9876-5432', '2021-03-10', 1),
    (3, 'Rafael Lima', 'Cozinheiro', '84 9988-7766', '2019-07-20', 1),
    (4, 'Juliana Santos', 'Atendente', '84 9767-1234', '2022-05-05', 1),
    (5, 'Felipe Rocha', 'Cozinheiro', '84 9666-2410', '2020-11-30', 1);


INSERT INTO categoria
    (id_categoria, nome_categoria, descricao_categoria)
VALUES
    (1, 'Bebidas', 'Bebidas alcoólicas e não alcoólicas'),
    (2, 'Lanches', 'Lanches rápidos e sanduíches'),
    (3, 'Sobremesas', 'Sobremesas doces e geladas'),
    (4, 'Pratos Principais', 'Pratos principais e refeições completas');


INSERT INTO produtos
    (id_produto, nome_produto, descricao, preco_unitario, custo,
     preco_unidade_venda, data_validade, id_categoria)
VALUES
    (1, 'Suco de laranja', 'Suco natural de laranja', 8.00, 3.00, 8.00, NULL, 1),
    (2, 'Sanduíche natural', 'Sanduíche de frango', 15.00, 7.00, 15.00, NULL, 2),
    (3, 'Bolo de chocolate', 'Fatia de bolo de chocolate', 10.00, 4.00, 10.00, NULL, 3),
    (4, 'Prato executivo', 'Arroz, feijão e frango grelhado', 25.00, 12.00, 25.00, NULL, 4);


INSERT INTO ingrediente
    (id_ingredientes, nome_ingrediente, quantidade_estoque, unidade_medida, custo_unidade)
VALUES
    (1, 'Laranja', 20, 'unidade', 0.80),
    (2, 'Pão', 30, 'unidade', 1.00),
    (3, 'Frango', 10, 'kg', 18.00),
    (4, 'Chocolate', 5, 'kg', 25.00),
    (5, 'Arroz', 15, 'kg', 6.00),
    (6, 'Feijão', 10, 'kg', 8.00);


INSERT INTO ficha
    (id_ficha, id_produtos, id_ingrediente, quantidade_necessaria)
VALUES
    (1, 1, 1, 3.00),
    (2, 2, 2, 2.00),
    (3, 2, 3, 0.15),
    (4, 3, 4, 0.10),
    (5, 4, 3, 0.20),
    (6, 4, 5, 0.10),
    (7, 4, 6, 0.08);


INSERT INTO pedidos
    (id_pedidos, data_pedido, hora_pedido, total_pago, id_cliente, id_funcionario)
VALUES
    (1, '2026-11-03', '12:30:00', 23.00, 1, 2),
    (2, '2026-11-03', '13:15:00', 35.00, 2, 4);


INSERT INTO item_pedido
    (id_item_pedido, id_pedido, id_produto, quantidade, preco_unitario)
VALUES
    (1, 1, 1, 1, 8.00),
    (2, 1, 2, 1, 15.00),
    (3, 2, 3, 1, 10.00),
    (4, 2, 4, 1, 25.00);



SELECT * FROM cliente ORDER BY id_cliente;
SELECT * FROM funcionario ORDER BY id_funcionario;
SELECT * FROM categoria ORDER BY id_categoria;
SELECT * FROM produtos ORDER BY id_produto;
SELECT * FROM ingrediente ORDER BY id_ingredientes;
SELECT * FROM ficha ORDER BY id_ficha;
SELECT * FROM pedidos ORDER BY id_pedidos;
SELECT * FROM item_pedido ORDER BY id_item_pedido;

SELECT p.id_pedidos, c.nome AS cliente, f.nome AS funcionario, p.data_pedido, p.total_pago
FROM pedidos p
JOIN cliente c ON c.id_cliente = p.id_cliente
JOIN funcionario f ON f.id_funcionario = p.id_funcionario
ORDER BY p.id_pedidos;

SELECT ip.id_pedido, pr.nome_produto, ip.quantidade, ip.preco_unitario,
       (ip.quantidade * ip.preco_unitario) AS valor_item
FROM item_pedido ip
JOIN produtos pr ON pr.id_produto = ip.id_produto
ORDER BY ip.id_pedido, ip.id_produto;

SELECT pr.id_produto, pr.nome_produto, cat.nome_categoria, pr.preco_unidade_venda, pr.custo
FROM produtos pr
JOIN categoria cat ON cat.id_categoria = pr.id_categoria
ORDER BY pr.id_produto;

SELECT pr.nome_produto, ing.nome_ingrediente, f.quantidade_necessaria, ing.unidade_medida
FROM ficha f
JOIN produtos pr ON pr.id_produto = f.id_produtos
JOIN ingrediente ing ON ing.id_ingredientes = f.id_ingrediente
ORDER BY pr.id_produto, ing.nome_ingrediente;

SELECT ing.id_ingredientes, ing.nome_ingrediente, ing.quantidade_estoque, ing.unidade_medida
FROM ingrediente ing
WHERE ing.quantidade_estoque <= 10
ORDER BY ing.quantidade_estoque;