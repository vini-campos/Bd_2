CREATE TABLE produto(
	id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	nome VARCHAR(50),
	descricao VARCHAR(250),
	unidade VARCHAR(10),
	preco FLOAT NOT NULL
)

CREATE TABLE venda(
	id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	id_prod INT FOREIGN KEY REFERENCES produto(id) NOT NULL,
	dia DATETIME NOT NULL,
	id_cliente INT NOT NULL,
	quantidade INT NOT NULL
)

CREATE TABLE compra(
	id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	id_prod INT FOREIGN KEY REFERENCES produto(id) NOT NULL,
	dia DATETIME NOT NULL,
	id_fornecedor INT NOT NULL,
	quantidade INT NOT NULL
)

CREATE TABLE estoque(
	id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	id_prod INT FOREIGN KEY REFERENCES produto(id) NOT NULL,
	quantidade INT NOT NULL
)

/*TRIGGERS*/

/*faz um "cadastro" de um produto no estoque*/
CREATE TRIGGER AdicionarEstoque
ON produto
AFTER INSERT
AS
BEGIN
	INSERT INTO estoque(id_prod, quantidade)
	SELECT id, 0 FROM inserted
END;

/*insert do AdicionarEstoque*/
INSERT INTO produto (nome, descricao, unidade, preco)
VALUES('cheetos', 'salgadinho de queijo', 'pacote', '9.99');

/*faz a adição da quantidades de produtos no estoque depois de serem cadastrados*/
CREATE TRIGGER CompraEstoque
ON compra
AFTER INSERT
AS
BEGIN
    UPDATE estoque
		SET estoque.quantidade = estoque.quantidade + inserted.quantidade
	FROM estoque
	INNER JOIN inserted
		ON estoque.id_prod = inserted.id_prod
END;

/*insert do CompraEstoque*/
INSERT INTO compra (id_prod, dia, id_fornecedor, quantidade)
VALUES ( 1, GETDATE(), 5, 15);

/*faz a subtração da quantidade de produtos no estoque depois de serem cadastrados*/
CREATE TRIGGER VendaEstoque
ON venda
AFTER INSERT
AS
BEGIN
	UPDATE estoque
		SET estoque.quantidade = estoque.quantidade - inserted.quantidade
	FROM estoque
	INNER JOIN inserted
		ON estoque.id_prod = inserted.id_prod
END;

/*insert do VendaEstoque*/
INSERT INTO venda (id_prod, dia, id_cliente, quantidade)
VALUES (1, GETDATE(), 3, 10)