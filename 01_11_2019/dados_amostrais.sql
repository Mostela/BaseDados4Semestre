insert into curso (id, nome) values (1, 'tds'); insert into curso (id, nome) values (2, 'sisinfo'); 
 
insert into aluno (rgm, nome, curso) values (1, 'bruno', 1); insert into aluno (rgm, nome, curso) values (2, 'ze', 2); insert into aluno (rgm, nome, curso) values (3, 'joao', 1); 
 
insert into disciplina (codigo, nome) values (1, 'bd'); insert into disciplina (codigo, nome) values (2, 'ioo'); 
 
insert into tiponota (codigo, nome) values (1, 'p1'); insert into tiponota (codigo, nome) values (2, 'p2'); 
 
insert into notas (id, rgm_aluno, codigo_disciplina, tipo_nota, nota)  values (1, 1, 1, 1, 9.00); insert into notas (id, rgm_aluno, codigo_disciplina, tipo_nota, nota)  values (2, 1, 1, 2, 7.00); insert into notas (id, rgm_aluno, codigo_disciplina, tipo_nota, nota)  values (3, 2, 1, 1, 8.00); insert into notas (id, rgm_aluno, codigo_disciplina, tipo_nota, nota)  values (4, 2, 1, 2, 6.00); 
 
insert into situacao (aluno, situacao, disciplina, id)  values (1, 'aprovado', 1, 1); insert into situacao (aluno, situacao, disciplina, id)  values (3, 'reprovado', 1, 2); 