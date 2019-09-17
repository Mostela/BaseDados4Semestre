/*
questão 1
1- Consultas mais simples sem que haja a necessidade de querys extensas enviadas de dentro do sistema com varios Inner Join
2- Gera tabelas apenas de consultando evitando que usuarios possam acabar alterando os dados
3- Regras de negocio podem ser adotadas nas views
 */

 /*
 questão 2 - a
  */
create table if not exists depto(
  cd_depto int auto_increment primary key,
  ds_depto varchar(30)
)engine ="innodb";
insert into depto (ds_depto) values ('Financeiro'),
                         ('Desenvolvimento'),('Contabilidade'),('Administrativo'),('RH');
/*
questão 2 - b
 */
create table if not exists pssoa (
  cd_pssoa int auto_increment primary key,
  cd_depto int,
  ds_pssoa VARCHAR(50),
  constraint fk_depto_pssoa foreign key (cd_depto) REFERENCES depto (cd_depto)
)engine ="innodb";

insert into pssoa (ds_pssoa,cd_depto) values ('João',1),('Glauco',2),('Luiz',3),('Leo',3),('Paulo',5);

/*
questão 2 - c
*/
alter table pssoa
add column dt_nasc datetime default current_date;

/*
questão 2 - d
*/
create view if NOT EXISTS v_pessoas as
  select ds_pssoa,dt_nasc from pssoa where MONTH(dt_nasc) = '09';

/*
questão 2 - e
*/
create view if not exists v_relatorio_mes as
  select * from pssoa inner JOIN depto d on pssoa.cd_depto = d.cd_depto;

/*
questão 2 - f
*/
create view if not exists v_relatorio_pessoa as
  select * from pssoa inner JOIN depto d on pssoa.cd_depto = d.cd_depto;

/*
questão 2 - g
*/
create view if not exists v_dep_vazio as
  select * from depto where cd_depto not in (select cd_depto from pssoa);

/*
quesão 2 - h
*/
create view if not exists v_dep_vazio as
  select * from depto where cd_depto in (select cd_depto from pssoa);

/*
questão 3 - a
*/
create table IF NOT EXISTS usuas (
  cd_usuas int primary key auto_increment,
  cd_pessoa int,
  ds_login varchar(20),
  ds_senha varchar(20),
  constraint fk_pssoa_usuas foreign key (cd_pessoa) REFERENCES pssoa (cd_pssoa)
)engine ="innodb";
insert into usuas (cd_pessoa, ds_login, ds_senha) VALUES (1,'mos','123'),(2,'ass','888'),(3,'aaa','883'),(4,'asf','225'),(5,'som','111');

/*
questão 3 - b
*/
create view IF NOT EXISTS v_usuas as
  select ds_login,ds_senha, d.ds_depto from usuas left join pssoa p on usuas.cd_pessoa = p.cd_pssoa LEFT JOIN depto d on p.cd_depto = d.cd_depto;