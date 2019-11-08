/*
DADOS AMOSTRAIS
*/
--INSERT INTO genero (id, nome) VALUES (nextval('seq_genero'), 'Terror'),
  --                                   (nextval('seq_genero'), 'Ação'),
  --                                   (nextval('seq_genero'), 'Drama');

INSERT INTO tipo (id, nome, valor, qtd_dias) VALUES
 (nextval('seq_tipo'), 'Lançamento', 8,1),
 (nextval('seq_tipo'), 'Mais antigos', (SELECT valor FROM tipo WHERE nome = 'Lançamento') / 2,3),
 (nextval('seq_tipo'), 'Classicos', 8, 7);

INSERT INTO filme (id, titulo, duracao, sinopese, ano_lancamento, genero, tipo) VALUES
(nextval('seq_filme'), 'Coringa', 190, 'Coringa por Joaquin Phoniex', 2019, 3,1),
(nextval('seq_filme'), 'Rambo - A Missão', 120, 'Ex veterano vs MUNDO', 1979, 2,3),
(nextval('seq_filme'), 'CONSTANTINE', 90, 'Padre vs Demonios', 2005, 1,2);

INSERT INTO cliente (id, nome, cpf, endereco, telefone) VALUES
(nextval('seq_cliente'), 'Joao', '123', 'Rua', '4628'),
(nextval('seq_cliente'), 'Dry', '234', 'Avenida', '1234'),
(nextval('seq_cliente'), 'Ze', '872', 'Casa', '1597');

INSERT INTO dependente (id, nome, responsavel) VALUES
(nextval('seq_dependente'), 'Camargo', 1),
(nextval('seq_dependente'), 'Maria', 3),
(nextval('seq_dependente'), 'Lucas',3);

INSERT INTO locacao (id, cliente, filme, dt_localao, dt_prev_entrega, dt_entrega, total) VALUES
(nextval('seq_filme'),1,1,'2019-11-07','2019-11-08',null,8),
(nextval('seq_filme'),2,1,'2019-11-05','2019-11-06','2019-11-07',16),
(nextval('seq_filme'),3,3,'2019-11-01','2019-11-08','2019-11-05',8);