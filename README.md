# Sistema de Gerenciamento de Padaria

Projeto acadêmico de desenvolvimento de banco de dados para o gerenciamento de uma padaria, utilizando **PostgreSQL**.

## Sobre o projeto

O Sistema de Gerenciamento de Padaria tem como objetivo facilitar a organização e o controle das atividades de uma padaria por meio de um banco de dados relacional.

O sistema permite armazenar informações sobre clientes, funcionários, produtos, categorias, ingredientes, pedidos e itens vendidos, estabelecendo relacionamentos entre essas informações.

A proposta é melhorar o gerenciamento do estabelecimento, facilitar consultas e relatórios, acompanhar as vendas e contribuir para a redução de desperdícios.

## Objetivos

- Organizar o cadastro de clientes e funcionários.
- Gerenciar produtos e suas respectivas categorias.
- Controlar ingredientes e quantidades em estoque.
- Relacionar produtos e ingredientes por meio de fichas técnicas.
- Registrar pedidos, vendas e seus respectivos itens.
- Consultar o histórico de vendas.
- Calcular o faturamento e identificar os produtos mais vendidos.

## Tecnologias utilizadas

- **PostgreSQL** – Sistema gerenciador de banco de dados relacional.
- **SQL** – Linguagem utilizada para criação, manipulação e consulta dos dados.

## Estrutura do banco de dados

O banco de dados é composto pelas seguintes tabelas:

| Tabela | Descrição |
|---|---|
| `cliente` | Armazena os dados dos clientes. |
| `funcionario` | Armazena os dados dos funcionários e supervisores. |
| `categoria` | Organiza os produtos por categorias. |
| `produtos` | Armazena informações dos produtos, preços e custos. |
| `pedidos` | Registra os pedidos realizados. |
| `item_pedido` | Armazena os produtos e quantidades de cada pedido. |
| `ingrediente` | Controla os ingredientes e suas quantidades em estoque. |
| `ficha` | Relaciona produtos aos ingredientes necessários para sua produção. |

## Funcionalidades implementadas

- Criação das tabelas e definição de chaves primárias e estrangeiras.
- Inserção de dados de clientes, funcionários, produtos e ingredientes.
- Atualização de informações cadastradas.
- Exclusão de itens de pedidos.
- Consulta e filtragem de produtos por preço.
- Consulta de pedidos com identificação do cliente e funcionário responsável.
- Consulta dos produtos vendidos em cada pedido.
- Cálculo da quantidade vendida e do faturamento por produto.
- Cálculo da quantidade de pedidos e do valor médio por cliente.
- Consulta do faturamento por categoria.
- Filtragem de pedidos por período.

## Consultas SQL

O projeto utiliza diferentes recursos da linguagem SQL, incluindo:

- `SELECT` – Consulta de informações.
- `INSERT INTO` – Inserção de registros.
- `UPDATE` – Atualização de dados.
- `DELETE` – Exclusão de registros.
- `WHERE` – Filtragem de informações.
- `ORDER BY` – Ordenação de resultados.
- `JOIN` – Relacionamento entre tabelas.
- `GROUP BY` – Agrupamento de registros.
- `SUM()`, `AVG()` e `COUNT()` – Funções de agregação.

## Como executar o projeto

1. Instale o [PostgreSQL](https://www.postgresql.org/).
2. Abra uma ferramenta de gerenciamento de banco de dados, como o pgAdmin ou DBeaver.
3. Crie um novo banco de dados para o projeto.
4. Abra o script SQL do repositório.
5. Execute os comandos na ordem em que estão organizados:
   - Criação das tabelas;
   - Inserção dos dados;
   - Atualização e exclusão de registros;
   - Consultas SQL.
6. Verifique os resultados das consultas.

## Melhorias futuras

- Implementar o cadastro e gerenciamento de fornecedores.
- Desenvolver controle de fornadas e datas de produção.
- Registrar datas de validade dos produtos produzidos.
- Aprimorar o controle de estoque e ingredientes.
- Implementar funcionalidades para acompanhamento da produção.

## Contexto acadêmico

Projeto desenvolvido como atividade acadêmica, com o objetivo de aplicar os conhecimentos de modelagem de banco de dados, relacionamentos, manipulação de registros e consultas SQL utilizando PostgreSQL.

---

**Projeto: Sistema de Gerenciamento de Padaria**

**Disciplina:** Banco de Dados

**Tecnologia principal:** PostgreSQL

