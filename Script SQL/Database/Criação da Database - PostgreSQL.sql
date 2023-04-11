SELECT NOW();
SHOW DATESTYLE;

CREATE SEQUENCE IDSerial;
DROP SEQUENCE IDSerial;
/***********************************/
CREATE TABLE IF NOT EXISTS TB_Estabelecimento(
	Id SERIAL PRIMARY KEY,
	Nome VARCHAR (255) NOT NULL,
	Local VARCHAR (255) NOT NULL,
	CEP CHAR (8) NOT NULL
);

/**/
CREATE TYPE ObservacaoCliente AS Enum ('Cancelado','Pago','Pendente')
CREATE TYPE StatusCliente as Enum ('0','1','2')
CREATE TABLE IF NOT EXISTS TB_Cliente(
	Id SERIAL PRIMARY KEY,
	CPF CHAR (11) NOT NULL UNIQUE,
	Nome VARCHAR (255) NOT NULL,
	Data_Nascimento DATE NOT NULL,
	Ativo StatusCliente,
	Obs ObservacaoCliente
);

/**/
CREATE TABLE IF NOT EXISTS TB_Estoque(
	Id SERIAL PRIMARY KEY,
	
	Estb_Id INT NOT NULL 
		REFERENCES TB_Estabelecimento(Id)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	
	Espaco INT NOT NULL CHECK(Espaco IN (1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20)),
	Quantidade INT NULL,
	Data_Entrada TIMESTAMP,
	Data_Saida TIMESTAMP
);

/**/
CREATE TYPE ObservacaoFornecedor AS Enum ('Cancelado','Pago','Pendente')
CREATE TYPE StatusFornecedor as enum ('1', '2', '0')
DROP TYPE Status;

CREATE TABLE IF NOT EXISTS TB_Fornecedor(
	Id SERIAL PRIMARY KEY,
	
	Est_Id INT NOT NULL
			REFERENCES TB_Estoque(Id)
			ON DELETE CASCADE
			ON UPDATE CASCADE,
	
	CNPJ CHAR(14) NULL UNIQUE,
    CPF CHAR(11) NOT NULL UNIQUE,
	Nome VARCHAR(255) NOT NULL ,
	Ender VARCHAR (255) NULL,
	Ativo StatusFornecedor,
	Obs ObservacaoFornecedor 
);

/**/
CREATE TABLE IF NOT EXISTS TB_Produto(
	Id SERIAL PRIMARY KEY,
	
	Est_Id INT NOT NULL 
		REFERENCES TB_Estoque(Id)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	
	Tipo VARCHAR (255) NOT NULL,
	Nome VARCHAR (255) NOT NULL,
	Lote CHAR(5),
	Validade DATE NOT NULL,
	Valor_Unitario NUMERIC (10,2)
);

/**/
CREATE TABLE IF NOT EXISTS TB_Pedido(
	Id SERIAL PRIMARY KEY,
	
	Client_Id INT NOT NULL 
		REFERENCES TB_Cliente (Id)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

/**/
CREATE TABLE IF NOT EXISTS TB_ItensPedidos(
	Ped_Id INT NOT NULL 
		REFERENCES TB_Pedido (Id)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	
	Prod_Id INT NOT NULL 
		REFERENCES TB_Produto (Id)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	
	Nome VARCHAR(255) NOT NULL,
	Quantidade FLOAT NULL,
	Valor_Total NUMERIC (10,2) NOT NULL
);


/**/
CREATE TYPE StatusPagamento AS Enum ('0','1','2')
CREATE TYPE ObservacaoPag AS Enum ('Cancelado','Pago','Pendente')
CREATE TABLE IF NOT EXISTS TB_FormaPag(
	Id SERIAL PRIMARY KEY,
	Nome VARCHAR(255) NOT NULL ,
	Tipo VARCHAR (255) NOT NULL ,
	Status StatusPagamento,
	Obs ObservacaoPag
);

/**/
CREATE TABLE IF NOT EXISTS TB_NotaFiscal(
	Id SERIAL PRIMARY KEY,
	
	Ped_Id INT NOT NULL
		REFERENCES TB_Pedido (Id)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
			
	Client_Id INT NOT NULL
		REFERENCES TB_Cliente (Id)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	
	FormaPag_Id INT NOT NULL
		REFERENCES TB_FormaPag (Id)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
    
	DataFiscal TIMESTAMP NOT NULL,
	Valor_Total NUMERIC (10,2) NOT NULL
);

/**/
CREATE TABLE IF NOT EXISTS TB_Funcionario(
	Id SERIAL PRIMARY KEY,
	
	Estb_Id INT NOT NULL
		REFERENCES TB_Estabelecimento (Id)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
			
	Nome VARCHAR (255) NOT NULL,
	CPF CHAR (9) NOT NULL UNIQUE,
	CEP CHAR (7) NOT NULL,
	Telefone VARCHAR (15) NOT NULL
);

/**/
CREATE TYPE StatusSetor as Enum ('0','1','2')
CREATE TYPE ObservacaoSetor as Enum ('Não Ativo','Ativo','Pendente')
CREATE TABLE IF NOT EXISTS TB_Setor(
	Id SERIAL PRIMARY KEY,
	Setor VARCHAR(255) NOT NULL,
	
	EstbId INT NOT NULL 
		REFERENCES TB_Estabelecimento (Id),
	
	FuncId INT NOT NULL
		REFERENCES TB_Funcionario (Id),
	
	NomeFunc VARCHAR(255) NOT NULL, 
	Operacao VARCHAR (255) NOT NULL UNIQUE,
	Ativo StatusSetor,
	Obs ObservacaoSetor
);

/**/
CREATE TYPE StatusCaixa as Enum ('0','1') 
CREATE TYPE ObservacaoCaixa as Enum ('Cancelado','Pago')
CREATE TABLE IF NOT EXISTS TB_Caixa(
	Id SERIAL PRIMARY KEY,
	
	FormaPag_Id INT NOT NULL
			REFERENCES TB_FormaPag (Id),
	
	DataCompra TIMESTAMP NOT NULL,
	Status StatusCaixa,
	Obs ObservacaoCaixa
);

/**/
CREATE TABLE IF NOT EXISTS TB_Comissao(
	Id SERIAL PRIMARY KEY,
	
	Setor_Id INT NOT NULL
			REFERENCES TB_Setor (Id),
	
    Caixa_Id INT NOT NULL
			REFERENCES TB_Caixa (Id),
	
	Porcentagem DECIMAL (10,2) NOT NULL
);

/****************************************/
INSERT INTO TB_Estabelecimento VALUES
(nextval('IDSerial'),'Empório Abrão Market I','Rua Via Firenze - Jardim Vila Paradiso - Indaiatuba','13331563'),
(nextval('IDSerial'),'Empório Abrão Market II','Rua João Martini - Jardim Morada do Sol - Indaiatuba','13348358');


SELECT * FROM TB_Estabelecimento;

