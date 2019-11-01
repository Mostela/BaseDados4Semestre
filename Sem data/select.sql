/*
 1 - Exibir o id e o nome dos funcionários, o nome do projeto e do micro usado no mesmo. Ordenar o resultado pelo nome
 do projeto e pelo nome do funcionário.
*/
select f.id,f.nome,p.nome,c.nome from alocacao RIGHT JOIN funcionario f on alocacao.funcionario = f.id
  RIGHT JOIN projeto p on alocacao.projeto = p.id
  RIGHT JOIN computador c on alocacao.computador = c.id order by p.nome,f.nome;

/*
2 - Exibir a quantidade de funcionários alocados em cada projeto. Ordenar o resultado pelo nome do projeto.
 */
 select count(f.nome), p.nome from alocacao
   right join projeto p on alocacao.projeto = p.id
   RIGHT JOIN funcionario f on alocacao.funcionario = f.id
group by p.id ORDER BY p.nome;

/*
3 - Exibir o nome de cada funcionário acompanhado do nome do seu respectivo gerente. Ordenar o resultado pelo nome do gerente.
 */
select p.nome as funcionario, f.nome as gerente  from funcionario as f left join funcionario as p on p.gerente = f.id where f.id = p.gerente order by p.gerente;