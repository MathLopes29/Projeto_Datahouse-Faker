/* DROP DATABASE Mercado; */

SHOW DATABASES;
CREATE DATABASE Mercado;
USE Mercado;
SHOW TABLES;

CREATE TABLE TB_Estabelecimento(
	Id INT,
    Nome VARCHAR (255) NOT NULL,
    Local_Ender VARCHAR (255) NOT NULL,
    CEP CHAR (8) NOT NULL,
    
    PRIMARY KEY (Id)
);

CREATE TABLE TB_Cliente(
	Id INT,
	CPF CHAR (11) NOT NULL UNIQUE,
	Nome VARCHAR (255) NOT NULL,
	Email VARCHAR (255) NOT NULL,
	Telefone CHAR (15)NOT NULL,
	CEP CHAR (9) NOT NULL,
	Ender VARCHAR (255) NOT NULL,
	Estado CHAR (255) NOT NULL,
	Cidade VARCHAR (255) NOT NULL,
	Ativo INT NOT NULL CHECK (Ativo = 0 OR Ativo = 1 OR Ativo = 2 AND NOT Ativo >= 3),
	/* Obs VARCHAR (20) NULL CHECK (Obs = 'Cancelado' OR Obs = 'Ativo' OR Obs = 'Pendente'), */
    
	PRIMARY KEY (Id)
);

CREATE TABLE TB_Estoque(
	Id INT,
    Estab_Id INT NOT NULL,
    Espaco INT,
    
    PRIMARY KEY (Id),
    
    CONSTRAINT FK_EstbID1 
		FOREIGN KEY (Estab_Id) 
			REFERENCES TB_Estabelecimento (Id)
);

CREATE TABLE TB_Fornecedor (
	Id INT,
	Est_Id INT NOT NULL,
	
	CNPJ CHAR(14) NULL UNIQUE,
  	CPF CHAR(11) NOT NULL UNIQUE,
	Nome VARCHAR(255) NOT NULL ,
	Ender VARCHAR (255) NULL,
	Ativo INT NOT NULL CHECK (Ativo = 0 OR Ativo = 1 OR Ativo = 2 AND NOT Ativo >= 3),
	/* Obs VARCHAR (20) NULL CHECK (Obs = 'Cancelado' OR Obs = 'Ativo' OR Obs = 'Pendente') */

	PRIMARY KEY (Id),

	CONSTRAINT FK_EstID
		FOREIGN KEY (Est_Id)
			REFERENCES TB_Estoque(Id) 

);

CREATE TABLE TB_Produto(
	Id INT,
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
	Valor_Unitario NUMERIC (10,2),
    
    PRIMARY KEY (Id),

    CONSTRAINT FK_EstID2
		FOREIGN KEY (Est_Id) 
			REFERENCES TB_Estoque(Id)	
);

CREATE TABLE TB_Pedido(
	Id INT,
	Cliente_Id INT NOT NULL,
    
    CONSTRAINT PK_PedID 
		PRIMARY KEY (Id),
	
    CONSTRAINT FK_ClienteID
		FOREIGN KEY (Cliente_Id)
			REFERENCES TB_Cliente (Id)
);

CREATE TABLE TB_ItensPedidos(
	Ped_Id INT,             
	Prod_Id INT,
/*	Nome VARCHAR(255) NOT NULL, */
	Quantidade FLOAT NULL,
	Valor_Total NUMERIC (10,2) NOT NULL,

	CONSTRAINT FK_PedID2 
		FOREIGN KEY (Ped_Id)
			REFERENCES TB_Pedido (Id),
            
	CONSTRAINT FK_ProdID 
		FOREIGN KEY (Prod_Id)
			REFERENCES TB_Produto (Id)
);

CREATE TABLE TB_FormaPag(
	Id INT,
	Nome VARCHAR(255) NOT NULL ,
	Tipo VARCHAR (255) NOT NULL ,
	Ativo INT NOT NULL CHECK (Ativo = 0 OR Ativo = 1 OR Ativo = 2 AND NOT Ativo >= 3),
	
	/*
	Obs VARCHAR (20) NULL CHECK (Obs = 'Pagamento Cancelado' OR Obs = 'Pagamento Concluido' OR Obs = 'Pagamento Pendente'),
	*/

    PRIMARY KEY (Id)
);

CREATE TABLE TB_NotaFiscal(
	Id INT,
	ItensPed_Id INT NOT NULL,
	Cliente_Id INT NOT NULL, 
	FormaPag_Id INT NOT NULL,
	DataFiscal DATETIME,
    
    PRIMARY KEY (Id),
    
    CONSTRAINT FK_ItensPedID
			FOREIGN KEY (ItensPed_Id) 
				REFERENCES TB_ItensPedidos (Ped_Id),
                
	CONSTRAINT FK_ClienteID2 
		FOREIGN KEY (Cliente_Id) 
			REFERENCES TB_Cliente (Id),
            
	CONSTRAINT FK_FormaPagID 
		FOREIGN KEY (FormaPag_Id) 
			REFERENCES TB_FormaPag (Id)
);

CREATE TABLE TB_Funcionario(
	Id INT,
	Estab_Id INT NOT NULL,		
	Nome VARCHAR (255) NOT NULL, 
	CPF CHAR (11) NOT NULL UNIQUE,
	CEP CHAR (9) NOT NULL,
	Telefone VARCHAR (15) NOT NULL,
    
    PRIMARY KEY (Id),
    
    CONSTRAINT FK_EstabID2 
		FOREIGN KEY (Estab_Id) 
			REFERENCES TB_Estabelecimento (Id)
);

CREATE TABLE TB_Caixa(
	Id INT,
	FormaPag_Id INT NOT NULL,
	Data_Compra DATETIME,
	Status INT CHECK (Status = 0 OR Status = 1 AND Status != 2),
	
	/*
	Obs VARCHAR (20) CHECK (Obs = 'Pagamento Cancelado' OR Obs = 'Pagamento Feito'),
    */

    PRIMARY KEY (Id),
    
    CONSTRAINT FK_FormaPagID2 
		FOREIGN KEY (FormaPag_Id) 
			REFERENCES TB_FormaPag (Id)
);

CREATE TABLE TB_Setor(
	Id INT,
	Setor VARCHAR(255) NOT NULL,
	Estab_Id INT NOT NULL,	
	Func_Id INT NOT NULL,
	/* Operacao VARCHAR (255) NOT NULL UNIQUE, */
	/* Nome VARCHAR(255) NOT NULL, */ 
	Ativo INT NOT NULL CHECK (Ativo = 0 OR Ativo = 1 OR Ativo = 2 AND NOT Ativo >= 3),
	
	/*
	Obs VARCHAR (20) NULL CHECK (Obs = 'Pagamento Cancelado' OR Obs = 'Pagamento Concluido' OR Obs = 'Pagamento Pendente'),
    */

    PRIMARY KEY (Id),
    
    CONSTRAINT FK_EstabID3 
		FOREIGN KEY (Estab_Id)
			REFERENCES TB_Estabelecimento (Id),
            
    CONSTRAINT FK_FuncID       
		FOREIGN KEY (Func_Id)
            REFERENCES TB_Funcionario (Id)
);


CREATE TABLE TB_Comissao(
	Id INT,
	Setor_Id INT NOT NULL,
    Caixa_Id INT NOT NULL,
	Porcentagem DECIMAL (10,2) NOT NULL,
    
    PRIMARY KEY (Id),
    
    CONSTRAINT FK_SetorID 
		FOREIGN KEY (Setor_Id) 
			REFERENCES TB_Setor (Id),
            
    CONSTRAINT  FK_CaixaID 
		FOREIGN KEY (Caixa_Id) 
			REFERENCES TB_Caixa (Id)        
);

/*****************************/


