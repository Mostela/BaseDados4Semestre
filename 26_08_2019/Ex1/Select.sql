select alocacao.id,funcionario.nome,projeto.nome,computador.nome from alocacao,funcionario,projeto,computador
where alocacao.id=funcionario.id and projeto.id=alocacao.projeto and computador.id=alocacao.computador
order by projeto.nome,funcionario.nome;

select*from alocacao;

select projeto.nome, count(alocacao.funcionario) from projeto,alocacao
where projeto.id = alocacao.projeto group by projeto.nome order by projeto.nome;

select ger.nome, fun.nome from funcionario as fun, funcionario as ger where ger.gerente = fun.id;