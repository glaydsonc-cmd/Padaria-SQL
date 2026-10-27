CREATE TABLE CLIENTE (
    id_cliente INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(100),
    endereco VARCHAR(200)
);

CREATE TABLE FUNCIONARIO (
    id_funcionario INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(50),
    telefone VARCHAR(20),
    data_admissao DATE,
    id_supervisor INT,
    FOREIGN KEY (id_supervisor) REFERENCES FUNCIONARIO(id_funcionario)
);

CREATE TABLE CATEGORIA (
    id_categoria INT PRIMARY KEY,
    nome_categoria VARCHAR(100) NOT NULL,
    descricao_categoria TEXT
);

CREATE TABLE PRODUTOS (
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

CREATE TABLE PEDIDOS (
    id_pedidos INT PRIMARY KEY,
    data_pedido DATE NOT NULL,
    hora_pedido TIME NOT NULL,
    total_pago DECIMAL(10, 2),
    id_cliente INT NOT NULL,
    id_funcionario INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES CLIENTE(id_cliente),
    FOREIGN KEY (id_funcionario) REFERENCES FUNCIONARIO(id_funcionario)
);

CREATE TABLE ITEM_PEDIDO (
    id_item_pedido INT PRIMARY KEY,
    id_pedido INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10, 2),
    FOREIGN KEY (id_pedido) REFERENCES PEDIDOS(id_pedidos),
    FOREIGN KEY (id_produto) REFERENCES PRODUTOS(id_produto)
);

CREATE TABLE INGREDIENTE (
    id_ingredientes INT PRIMARY KEY,
    nome_ingrediente VARCHAR(100) NOT NULL,
    quantidade_estoque INT,
    unidade_medida VARCHAR(20),
    custo_unidade DECIMAL(10, 2)
);

CREATE TABLE FICHA (
    id_ficha INT PRIMARY KEY,
    id_produtos INT NOT NULL,
    id_ingrediente INT NOT NULL,
    quantidade_necessaria DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_produtos) REFERENCES PRODUTOS(id_produto),
    FOREIGN KEY (id_ingrediente) REFERENCES INGREDIENTE(id_ingredientes)
);