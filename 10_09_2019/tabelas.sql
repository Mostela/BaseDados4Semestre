create table if not exists passagem
(
  id              int auto_increment primary key,
  fk_cliente      varchar(20) not null,
  horario_partida time default current_time,
  horario_saida   time,
  destino         varchar(60),
  valor           double,
  fk_vendedor     int,
  foreign key fk_cliente (fk_cliente)  REFERENCES cliente (cpf),
  foreign key fk_vendedor (fk_vendedor) references funcionario (id)
);

create view if not exists v_passagem as
  select passagem.id,c.nome,c.cpf,horario_partida,horario_saida,destino,valor,f.nome as nome_funcionario from passagem
    inner JOIN cliente c on passagem.fk_cliente = c.cpf
    inner join funcionario f on passagem.fk_vendedor = f.id