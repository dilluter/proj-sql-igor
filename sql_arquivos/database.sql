create database LojaPc;
use LojaPc;
create table clientes(
idclientes int auto_increment primary key,
nome varchar (100) not null,
email varchar (100) not null unique
);
insert into clientes(nome,email) values
('igor','igor@gmail.com');
select * from clientes;

create table funcionarios(
idfuncionario int auto_increment primary key,
nome varchar (100) not null,
email varchar (100) not null unique
);


