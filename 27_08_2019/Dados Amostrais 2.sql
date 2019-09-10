SELECT * FROM cliente; SELECT * FROM cliente2;

INSERT INTO cliente2(SELECT cpf,nome,tel,email FROM cliente);
SELECT * FROM cliente2;