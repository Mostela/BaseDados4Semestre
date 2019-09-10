
/*1*/
create table if not exists  proprietario(
	codigo int auto_increment,
	nome varchar (100) not null,
	cpf varchar(15),
	sexo varchar(1),
	idade varchar (2),
	telefone varchar (11) not null,
	constraint pk_cod primary key (codigo),
	constraint ck_idade check (idade >=21 and idade <=80),
	constraint ck_sexo check (sexo in('F','M'))
);
/*2*/
create table imovel(
	codigo int primary key auto_increment,
	endereco varchar(80)not null,
	descricao varchar(200)not null,
	valor_aluguel double,
	tipo varchar (15),
	status varchar (15),
	proprietario integer,
	constraint ck_valor check (valor_aluguel>=500),
	constraint ck_tipo check (tipo in('residencial','comercial')),
	constraint ck_status check (status in('alugado','livre','reforma')),
	constraint fk_proprietario foreign key (proprietario)references proprietario(codigo)
);
/*3*/
create table inquilino(
	codigo int primary key auto_increment,
	nome varchar (50) not null,
	cpf varchar(11) unique,
	sexo varchar(1),
	idade int (2),
	telefone varchar (11) not null,
	constraint ck_idade check (idade >=21 and idade <=80),
	constraint ck_sexo check (sexo in('F','M'))
);
/*4*/
create table corretor(
	codigo integer AUTO_INCREMENT primary key,
	nome varchar (50) not null,
	cpf varchar(11) unique,
	sexo varchar(1),
	dt_nascimento date,
	telefone varchar (11) not null,
	creci varchar(10)not null unique,
	constraint ck_sexo check (sexo in('F','M'))
);
/*5*/
create table aluguel(
	imovel integer,
	inquilino integer,
	corretor integer,
	dt_aluguel date not null,
	dt_vencimento date not null,
	valor_final_aluguel double,
	constraint ck_valor_final check(valor_final_aluguel>=600),
	constraint fk_imovel foreign key (imovel )references imovel(codigo)on update cascade on delete cascade,
	constraint fk_inquilino foreign key(inquilino) references inquilino(codigo),
	constraint fk_corretor foreign key(corretor) references corretor(codigo)
);
/*6*/
create table cliente (
  cpf  varchar(11),
  nome text NOT NULL,
  rua  text,
  numero text,
  cidade text,
  tel varchar(50),
  email  varchar(20),
  CONSTRAINT pk_cliente PRIMARY KEY (cpf),
  CONSTRAINT uk_email UNIQUE (email)
)
/*7*/
CREATE TABLE cliente2(
  cpf  varchar(11),
  nome text NOT NULL,
  tel varchar(50),
  email  varchar(20),
  CONSTRAINT pk_cliente2 PRIMARY KEY (cpf),
  CONSTRAINT uk_email2 UNIQUE (email)
);
/*8*/
CREATE TABLE depto( codigo int auto_increment, nome  varchar(100) NOT NULL,   CONSTRAINT pk_depto PRIMARY KEY (codigo) );

/*9*/
CREATE TABLE func( codigo  integer auto_increment, nome  varchar(100) NOT NULL, depto  integer,   CONSTRAINT pk_func PRIMARY KEY (codigo),   CONSTRAINT fk_func_depto FOREIGN KEY (depto) REFERENCES depto(codigo) );

/*10*/
create table propietario (
  codigo int primary key auto_increment,
  cfp varchar(11),
  nome text,
  tel varchar(13),
  email varchar(20),
  site text
);

create table imovel (
  codigo int primary key auto_increment,
  endereco text,
  matricula int,
  descricao text,
  valor double,
  proprietario_fk int,
  foreign key (proprietario_fk) references propietario (cfp)
);