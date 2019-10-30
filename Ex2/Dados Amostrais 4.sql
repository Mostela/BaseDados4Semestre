truncate propietario;
insert into propietario (select null,cpf,cliente2.nome,cliente2.tel,cliente2.email,'www.google.com' from cliente2 where nome = "Maria");
select * from propietario;

insert into imovel (select null,'Rua X',111,'Triplex do Lula',950.000,propietario.codigo from propietario where codigo = 1);
select * from imovel;