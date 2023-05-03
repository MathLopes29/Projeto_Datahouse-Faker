CREATE DATABASE DB_DSM1
GO

USE DB_DSM1
GO

DROP DATABASE DB_DSM1;
GO

/***********************************/
CREATE TABLE TB_Estabelecimento(
	Id INT PRIMARY KEY,
	Nome VARCHAR (255) NOT NULL,
	Local_Ender VARCHAR (255) NOT NULL,
	CEP CHAR (9) NOT NULL
);
GO

/**/
CREATE TABLE TB_Cliente(
	Id INT PRIMARY KEY,
	CPF CHAR (11) NOT NULL UNIQUE,
	Nome VARCHAR (255) NOT NULL,
	Email VARCHAR (255) NOT NULL,
	Telefone CHAR (15)NOT NULL,
	CEP CHAR (9) NOT NULL,
	Ender VARCHAR (255) NOT NULL,
	Estado CHAR (255) NOT NULL,
	Cidade VARCHAR (255) NOT NULL,
	Ativo INT NOT NULL CHECK(ATIVO IN (0, 1, 2)),
	
	/* Obs VARCHAR(15) NOT NULL CHECK (Obs IN('N�o Ativo','Ativo','Pendente')), */
);	
GO

/**/
CREATE TABLE TB_Estoque(
	Id INT PRIMARY KEY,
	Estab_Id INT NOT NULL,
	Espaco INT,
	
	CONSTRAINT FK_EstabID1
		FOREIGN KEY (Estab_Id)
			REFERENCES TB_Estabelecimento(Id)
);
GO

/**/
CREATE TABLE TB_Fornecedor(
	Id INT PRIMARY KEY,
	Est_Id INT NOT NULL,

	CNPJ CHAR(14) NULL,
    CPF CHAR(11) NOT NULL,
	Nome VARCHAR(255) NOT NULL,
	Ender VARCHAR (255) NULL,
	Ativo INT NOT NULL CHECK(ATIVO IN (0, 1, 2)),
	
	/* Obs VARCHAR(15) NOT NULL CHECK (Obs IN('N�o Ativo','Ativo','Pendente')) */
	
	CONSTRAINT FK_EstID1
		FOREIGN KEY (Est_Id) 
			REFERENCES TB_Estoque(Id)
);
GO

/**/
CREATE TABLE TB_Produto(
	Id INT PRIMARY KEY,
	Est_Id INT NOT NULL,
	Lote_Cod CHAR(10) NOT NULL,
	Lote_Caixa INT NOT NULL,
	Lote_Quantidade INT NOT NULL,
	Data_DiaEntrada DATE,
    Data_HoraEntrada TIME,
    Data_Saida DATETIME,
	Validade DATE NOT NULL,
	Tipo VARCHAR (255) NOT NULL,
	Nome VARCHAR (255) NOT NULL,
	Valor_Unitario DECIMAL (10,2) NOT NULL,
	
	CONSTRAINT FK_EstID2 
		FOREIGN KEY  (Est_Id)
			REFERENCES TB_Estoque (Id)
);
GO

/**/
CREATE TABLE TB_Pedido(
	Id INT PRIMARY KEY,
	Cliente_Id INT NOT NULL,
	
	CONSTRAINT FK_ClienteID1 
		FOREIGN KEY  (Cliente_Id)
			REFERENCES TB_Cliente (Id)
);
GO

/**/
CREATE TABLE TB_ItensPedidos(
	Id INT PRIMARY KEY,
	Ped_Id INT NOT NULL,
	Prod_Id INT NOT NULL,
	/* Nome VARCHAR(255) NOT NULL, */
	Quantidade FLOAT NOT NULL,
	Valor_Total NUMERIC(10,2) NOT NULL,

	CONSTRAINT FK_PedID2 
		FOREIGN KEY  (Ped_Id)
			REFERENCES TB_Pedido (Id),
	
	CONSTRAINT FK_ProdID2 	
		FOREIGN KEY  (Prod_Id)
			REFERENCES TB_Produto (Id)
);
GO


/**/
CREATE TABLE TB_FormaPag(
	Id INT PRIMARY KEY,
	Nome VARCHAR(255) NOT NULL,
	Tipo VARCHAR (255) NOT NULL,
	Ativo INT NOT NULL CHECK(Ativo IN (0, 1, 2)),
	
	/* Obs VARCHAR(15) NOT NULL CHECK (Obs IN('N�o Ativo','Ativo','Pendente')), */ 
);
GO

/**/
CREATE TABLE TB_NotaFiscal(
	Id INT PRIMARY KEY,
	ItensPed_Id INT NOT NULL,
	Cliente_Id INT NOT NULL,
	FormaPag_Id INT NOT NULL,
    DataFiscal DATETIME,
	
	CONSTRAINT FK_ItensPedID1
		FOREIGN KEY (ItensPed_Id)
			REFERENCES TB_ItensPedidos(Id),
	
	CONSTRAINT FK_ClienteID2 
		FOREIGN KEY (Cliente_Id)
			REFERENCES TB_Cliente (Id),
	
	CONSTRAINT FK_FormaPagID1 
		FOREIGN KEY (FormaPag_Id)
			REFERENCES TB_FormaPag (Id)
);
GO

/**/
CREATE TABLE TB_Funcionario(
	Id INT PRIMARY KEY,
	Estab_Id INT NOT NULL,
	Nome VARCHAR (255) NOT NULL,
	CPF CHAR (11) NOT NULL UNIQUE,
	CEP CHAR (9) NOT NULL,
	Telefone CHAR (15) NOT NULL,

	CONSTRAINT FK_EstabID2 
		FOREIGN KEY (Estab_Id)
			REFERENCES TB_Estabelecimento (Id)
);
GO

/**/
CREATE TABLE TB_Caixa(
	Id INT PRIMARY KEY,
	FormaPag_Id INT NOT NULL,
	DataCompra DATETIME,
	StatusCaixa INT NOT NULL CHECK(StatusCaixa IN (0, 1, 2)),

	/* Obs VARCHAR(15) NOT NULL CHECK (Obs IN('N�o Ativo','Ativo','Pendente')), */


	CONSTRAINT FK_FormaPagID2 
		FOREIGN KEY (FormaPag_Id)
			REFERENCES TB_FormaPag (Id)
);
GO

/**/
CREATE TABLE TB_Setor(
	Id INT PRIMARY KEY,
	Setor VARCHAR(255) NOT NULL,
	Func_Id INT NOT NULL,
	
	/*
	Nome VARCHAR(255) NOT NULL, 
	Operacao VARCHAR (255) NOT NULL UNIQUE,
	*/
	
	Ativo INT NOT NULL CHECK(ATIVO IN (0, 1, 2)),
	
	/* Obs VARCHAR(15) NOT NULL CHECK (Obs IN('N�o Ativo','Ativo','Pendente')), */


	CONSTRAINT FK_FuncID2 
		FOREIGN KEY (Func_Id)
			REFERENCES TB_Funcionario (Id)
);
GO


/**/
CREATE TABLE TB_Comissao(
	Id INT PRIMARY KEY,
	Setor_Id INT NOT NULL,
    Caixa_Id INT NOT NULL,
	Porcentagem NUMERIC (10,2) NOT NULL,

	CONSTRAINT FK_SetorID1 
		FOREIGN KEY (Setor_Id)
			REFERENCES TB_Setor (Id),

	CONSTRAINT FK_CaixaID1 
		FOREIGN KEY (Caixa_Id)
			REFERENCES TB_Caixa (Id)
);
GO
