INSERT INTO depto VALUES (null,'Compras'); INSERT INTO depto VALUES (null,'RH'); INSERT INTO depto VALUES (null,'CPD'); INSERT INTO depto VALUES (null,'Jurídico'); 
 
SELECT * FROM depto; 
 
INSERT INTO func VALUES (null,'Maria',(SELECT codigo FROM depto WHERE nome = 'Compras')); INSERT INTO func VALUES (null,'João',(SELECT codigo FROM depto WHERE nome = 'Jurídico')); INSERT INTO func VALUES (null,'José',(SELECT codigo FROM depto WHERE nome = 'RH')); INSERT INTO func VALUES (null,'Claudia',(SELECT codigo FROM depto WHERE nome = 'CPD')); INSERT INTO func VALUES (null,'Luana',(SELECT codigo FROM depto WHERE nome = 'CPD')); INSERT INTO func VALUES (null,'Valéria',(SELECT codigo FROM depto WHERE nome = 'Compras'));

select * from func;