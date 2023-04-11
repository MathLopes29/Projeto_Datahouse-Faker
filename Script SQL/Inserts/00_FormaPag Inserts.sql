/* 4 Formas de Pagamento */

INSERT INTO TB_FormaPag VALUES( 2, 'Cartão',  'Debito / Credito', 1 );
INSERT INTO TB_FormaPag VALUES( 1, 'Dinheiro',  'Inteiro', 1 );
INSERT INTO TB_FormaPag VALUES( 3, 'Pix',  'Transferencia', 1 );
INSERT INTO TB_FormaPag VALUES( 4, 'Bit Coin',  'Transferência', 0 );

SELECT * FROM TB_FormaPag