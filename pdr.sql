--criando as tabelas do banco de dados
CREATE TABLE cliente (
    id_cliente INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(100),
    endereco VARCHAR(200)
);

CREATE TABLE funcionario (
    id_funcionario INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(50),
    telefone VARCHAR(20),
    data_admissao DATE,
    id_supervisor INT,
    FOREIGN KEY (id_supervisor) REFERENCES FUNCIONARIO(id_funcionario)
);

CREATE TABLE categoria (
    id_categoria INT PRIMARY KEY,
    nome_categoria VARCHAR(100) NOT NULL,
    descricao_categoria TEXT
);

CREATE TABLE produtos (
    id_produto INT PRIMARY KEY,
    nome_produto VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco_unitario DECIMAL(10, 2),
    custo DECIMAL(10, 2),
    preco_unidade_venda DECIMAL(10, 2),
    data_validade DATE,
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES CATEGORIA(id_categoria)
);

CREATE TABLE pedidos (
    id_pedidos INT PRIMARY KEY,
    data_pedido DATE NOT NULL,
    hora_pedido TIME NOT NULL,
    total_pago DECIMAL(10, 2),
    id_cliente INT NOT NULL,
    id_funcionario INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES CLIENTE(id_cliente),
    FOREIGN KEY (id_funcionario) REFERENCES FUNCIONARIO(id_funcionario)
);

CREATE TABLE item_pedido (
    id_item_pedido INT PRIMARY KEY,
    id_pedido INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10, 2),
    FOREIGN KEY (id_pedido) REFERENCES PEDIDOS(id_pedidos),
    FOREIGN KEY (id_produto) REFERENCES PRODUTOS(id_produto)
);

CREATE TABLE ingrediente (
    id_ingredientes INT PRIMARY KEY,
    nome_ingrediente VARCHAR(100) NOT NULL,
    quantidade_estoque INT,
    unidade_medida VARCHAR(20),
    custo_unidade DECIMAL(10, 2)
);

CREATE TABLE ficha (
    id_ficha INT PRIMARY KEY,
    id_produtos INT NOT NULL,
    id_ingrediente INT NOT NULL,
    quantidade_necessaria DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_produtos) REFERENCES PRODUTOS(id_produto),
    FOREIGN KEY (id_ingrediente) REFERENCES INGREDIENTE(id_ingredientes)
);
-- Inserindo dados para cada tabela:

--Inserindo dados na tabela cliente
INSERT INTO cliente (id_cliente, nome, telefone, email, endereco) VALUES
(1, 'João Silva', '123456789', 'joao.silva@email.com', 'Rua Esmeralda, 123'),
(2, 'Maria Luciana', '84 9767-1234', 'maria.luciana@email.com', 'Avenida Principal, 456'),
(3, 'David Martins', '84 9666-2410', 'david.martinsweb@gmail.com', 'Rua Maria Guadalupe, 265'),
(4, 'Michelle Miller', '84 9999-8888', 'michelle.miller@email.com', 'Travessa das Flores, 789'),
(5, 'Carlos Eduardo', '84 9876-5432', 'carlos.eduardo@email.com', 'Praça da Liberdade, 101'),
(6, 'Ana Paula', '84 9123-4567', 'ana.paula@email.com', 'Rua das Palmeiras, 456'),
(7, 'Lucas Fernando', '84 9988-7766', 'lucas.fernando@email.com', 'Praça da Independência, 202'),
(8, 'Fernanda Souza', '84 9876-5432', 'fernanda.souza@email.com', 'Avenida Brasil, 789');
SELECT * FROM cliente;

--Inserindo dados na tabela funcionario
INSERT INTO funcionario (id_funcionario, nome, cargo, telefone, data_admissao, id_supervisor) VALUES
(1, 'Carlos Oliveira', 'Gerente', '84 9123-4567', '2020-01-15', NULL),
(2, 'Mariana Costa', 'Atendente', '84 9876-5432', '2021-03-10', 1),
(3, 'Rafael Lima', 'Cozinheiro', '84 9988-7766', '2019-07-20', 1),
(4, 'Juliana Santos', 'Atendente', '84 9767-1234', '2022-05-05', 1),
(5, 'Felipe Rocha', 'Cozinheiro', '84 9666-2410', '2020-11-30', 1);

SELECT * FROM funcionario;
--Inserindo dados na tabela categoria
INSERT INTO categoria (id_categoria, nome_categoria, descricao_categoria) VALUES
(1, 'Bebidas', 'Categoria de bebidas alcoólicas e não alcoólicas'),
(2, 'Lanches', 'Categoria de lanches rápidos e sanduíches'),
(3, 'Sobremesas', 'Categoria de sobremesas doces e geladas'),
(4, 'Pratos Principais', 'Categoria de pratos principais e refeições completas');
SELECT * FROM categoria;