CREATE DATABASE DB_DSM1
GO

USE DB_DSM1
GO

DROP DATABASE DB_DSM1;
GO

/***********************************/
CREATE TABLE TB_Estabelecimento(
	Id INT IDENTITY,
	Nome VARCHAR (255) NOT NULL,
	Local VARCHAR (255) NOT NULL,
	CEP CHAR (8) NOT NULL,

	CONSTRAINT pk_EstbId PRIMARY KEY (Id)
);
GO

/**/
CREATE TABLE TB_Estoque(
	Id INT IDENTITY,
	FK_EstbId INT NOT NULL,
	Espaco INT NOT NULL CHECK(Espaco IN (1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20)),
	Quantidade INT NULL,
	Data_Entrada DATE,
	Data_Saida TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

	CONSTRAINT pk_EstId PRIMARY KEY (Id),

	CONSTRAINT fk_EstId FOREIGN KEY (Id)
	REFERENCES TB_Estabelecimento(Id)
);
GO

/**/
CREATE TABLE TB_Fornecedor(
	Id INT IDENTITY,
	FK_EstId INT NOT NULL,
	CNPJ CHAR(14) NULL,
    CPF CHAR(11) NOT NULL,
	Nome VARCHAR(255) NOT NULL,
	Ender VARCHAR (255) NULL,
	Ativo INT NOT NULL CHECK(ATIVO IN (0, 1, 2)),
	Obs VARCHAR(15) NOT NULL CHECK (Obs IN('Não Ativo','Ativo','Pendente'))
	
	CONSTRAINT pk_FornId PRIMARY KEY (Id),
	
	CONSTRAINT fk_Est1Id FOREIGN KEY (FK_EstId) 
	REFERENCES TB_Estoque(Id)
);
GO

/**/
CREATE TABLE TB_Produto(
	Id INT IDENTITY,
	FK_EstId INT NOT NULL,
	Tipo VARCHAR (255) NOT NULL,
	Nome VARCHAR (255) NOT NULL,
	Lote CHAR(5),
	Validade DATE NOT NULL,
	Valor_Unitario DECIMAL (10,2) NOT NULL,

	CONSTRAINT pk_ProdId PRIMARY KEY  (Id),
	
	CONSTRAINT fk_Est2Id FOREIGN KEY  (FK_EstId)
	REFERENCES TB_Estoque (Id)
);
GO

/**/
CREATE TABLE TB_Pedido(
	Id INT IDENTITY,
	FK_ClientId INT NOT NULL,

	CONSTRAINT pk_PedId PRIMARY KEY  (Id),
	
	CONSTRAINT fk_Client1Id FOREIGN KEY  (FK_ClientId)
	REFERENCES TB_Estoque (Id)
);
GO

/**/
CREATE TABLE TB_ItensPedidos(
	FK_PedId INT NOT NULL,
	FK_ProdId INT NOT NULL,
	Nome VARCHAR(255) NOT NULL,
	Quantidade FLOAT NOT NULL,
	Valor_Total DECIMAL(10,2) NOT NULL,

	CONSTRAINT fk_Ped1Id FOREIGN KEY  (FK_PedId)
	REFERENCES TB_Pedido (Id),
	
	CONSTRAINT fk_ProdId FOREIGN KEY  (FK_ProdId)
	REFERENCES TB_Produto (Id)
);
GO

/**/
CREATE TABLE TB_Cliente(
	Id INT IDENTITY,
	CPF CHAR (11) NOT NULL UNIQUE,
	Nome VARCHAR (255) NOT NULL,
	Data_Nascimento DATE NOT NULL,
	Ativo INT NOT NULL CHECK(ATIVO IN (0, 1, 2)),
	Obs VARCHAR(15) NOT NULL CHECK (Obs IN('Não Ativo','Ativo','Pendente')),

	CONSTRAINT pk_ClientId PRIMARY KEY (Id)
);
GO

/**/
CREATE TABLE TB_FormaPag(
	Id INT IDENTITY,
	Nome VARCHAR(255) NOT NULL,
	Tipo VARCHAR (255) NOT NULL,
	StatusPag INT NOT NULL CHECK(StatusPag IN (0, 1, 2)),
	Obs VARCHAR(15) NOT NULL CHECK (Obs IN('Não Ativo','Ativo','Pendente')),
	CONSTRAINT pk_FormaPagId PRIMARY KEY (Id)
);
GO

/**/
CREATE TABLE TB_NotaFiscal(
	Id INT IDENTITY,
	FK_PedId INT NOT NULL,
	FK_ClientId INT NOT NULL,
	FK_FormaPagId INT NOT NULL,
    DataTemp TIMESTAMP NOT NULL,
	Valor_Total NUMERIC (10,2) NOT NULL,

	CONSTRAINT pk_NotaFiscalId PRIMARY KEY (Id),
	
	CONSTRAINT fk_Ped2Id FOREIGN KEY (FK_PedId)
	REFERENCES TB_Pedido (Id),
	
	CONSTRAINT fk_Client2Id FOREIGN KEY (FK_ClientId)
	REFERENCES TB_Cliente (Id),
	
	CONSTRAINT fk_FormaPag2Id FOREIGN KEY (FK_FormaPagId)
	REFERENCES TB_FormaPag (Id)
);
GO

/**/
CREATE TABLE TB_Funcionario(
	Id INT IDENTITY,
	FK_EstbId INT NOT NULL,
	Nome VARCHAR (255) NOT NULL,
	CPF CHAR (9) NOT NULL UNIQUE,
	CEP CHAR (7) NOT NULL,
	Telefone VARCHAR (15) NOT NULL,

	CONSTRAINT pk_Id PRIMARY KEY (Id),

	CONSTRAINT fk_Estb1Id FOREIGN KEY (FK_EstbId)
	REFERENCES TB_Estabelecimento (Id)
);
GO

/**/
CREATE TABLE TB_Setor(
	Id INT IDENTITY,
	NomeSetor VARCHAR(255) NOT NULL,
	FK_EstbId INT NOT NULL,
	FK_FuncId INT NOT NULL,
	NomeFunc VARCHAR(255) NOT NULL, 
	Operacao VARCHAR (255) NOT NULL UNIQUE,
	Ativo INT NOT NULL CHECK(ATIVO IN (0, 1, 2)),
	Obs VARCHAR(15) NOT NULL CHECK (Obs IN('Não Ativo','Ativo','Pendente')),

	CONSTRAINT pk_SetorId PRIMARY KEY (Id),

	CONSTRAINT fk_Estb2Id FOREIGN KEY (FK_EstbId)
	REFERENCES TB_Estabelecimento (Id),

	CONSTRAINT fk_Func2Id FOREIGN KEY (FK_FuncId)
	REFERENCES TB_Funcionario (Id)
);
GO

/**/
CREATE TABLE TB_Caixa(
	Id INT IDENTITY,
	FK_FormaPagId INT NOT NULL,
	DataCompra TIMESTAMP NOT NULL,
	StatusCaixa INT NOT NULL CHECK(StatusCaixa IN (0, 1, 2)),
	Obs VARCHAR(15) NOT NULL CHECK (Obs IN('Não Ativo','Ativo','Pendente')),

	CONSTRAINT pk_CaixaId PRIMARY KEY (Id),

	CONSTRAINT fk_FormaPag3Id FOREIGN KEY (FK_FormaPagId)
	REFERENCES TB_FormaPag (Id)
);
GO

/**/
CREATE TABLE TB_Comissao(
	Id INT IDENTITY,
	FK_SetorId INT NOT NULL,
    FK_CaixaId INT NOT NULL,
	Porcentagem DECIMAL (10,2) NOT NULL,

	CONSTRAINT pk_ComisId PRIMARY KEY (Id),

	CONSTRAINT fk_SetorId FOREIGN KEY (FK_SetorId)
	REFERENCES TB_Setor (Id),

	CONSTRAINT fk_CaixaId FOREIGN KEY (FK_CaixaId)
	REFERENCES TB_Caixa (Id)
);
GO

/****************************************/
INSERT INTO TB_Estabelecimento VALUES
('Empório Abrão Market I','Rua Via Firenze - Jardim Vila Paradiso - Indaiatuba','13331563'),
('Empório Abrão Market II','Rua João Martini - Jardim Morada do Sol - Indaiatuba','13348358');
GO

SELECT * FROM TB_Estabelecimento;
GO

/***************************************/
INSERT INTO TB_Estoque VALUES 
(1,1,30,'2023-01-20',DEFAULT);
GO

SELECT * FROM TB_Estoque;
GO

SELECT * FROM TB_Fornecedor;
GO

SELECT * FROM TB_Produto;
GO

SELECT * FROM TB_Cliente;
GO

SELECT * FROM TB_Pedido;
GO

SELECT * FROM TB_NotaFiscal;
GO

SELECT * FROM TB_FormaPag;
GO

SELECT * FROM TB_Funcionario;
GO

SELECT * FROM TB_Comissao;
GO

SELECT * FROM TB_Caixa;
GO

SELECT * FROM TB_ItensPedidos;
GO

SELECT * FROM TB_Setor;
GO