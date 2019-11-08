/*
João Carlos Camargo
11181502906
*/

create table genero(
  id int not null,
  nome varchar(40),
  constraint genero_pkey primary key (id)
);

create table tipo (
  id int not null,
  nome varchar(35),
  valor numeric(5),
  qtd_dias int,
  primary key (id)
);

create table filme (
  id int not null,
  titulo varchar(60) not null,
  duracao numeric(5) not null,
  sinopese varchar(200),
  ano_lancamento int,
  genero int not null,
  tipo int not null,
  primary key (id),
  foreign key (genero) references genero (id),
  foreign key (tipo) references tipo (id)
);

create table cliente (
  id int not null,
  nome varchar(30),
  cpf varchar(15) unique not null,
  endereco varchar(40) not null,
  telefone varchar(30) not null,
  primary key (id)
);

create table dependente (
  id int not null,
  nome varchar(30),
  responsavel int,
  primary key (id),
  foreign key (responsavel) references cliente (id)
);

create table locacao(
  id int not null,
  cliente int not null,
  filme int not null,
  dt_localao date default current_date,
  dt_prev_entrega date,
  dt_entrega date,
  total numeric(5),
  primary key (id),
  foreign key (cliente) references cliente (id),
  foreign key (filme) references filme (id)
);