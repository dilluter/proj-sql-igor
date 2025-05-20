drop database Super_Mangas;
create database Super_mangas;
use Super_mangas;
create table fornecedores (
    idfornecedor int auto_increment primary key,
    nome varchar(256) not null,
    cnpj varchar(18) not null unique,
    telefone varchar(15) not null,
    email varchar(256) not null unique
);
create table cliente(
idcliente int auto_increment primary key,
nome varchar(256) not null,
cpf varchar(14) not null unique,
email varchar(256) not null unique,
telefone varchar(15) not null unique,
endereco varchar (256)
);
create table produtos(
idmanga int auto_increment primary key,
nome varchar(256) not null,
autor varchar(256) not null,
editora varchar(256)not null,
idioma varchar(256),
volume int,
estoque int default 0,
preco decimal(10,2),
id_fornecedor int,
foreign key (id_fornecedor) references fornecedores(idfornecedor)
);
create table funcionario(
idfuncionario int auto_increment primary key,
nome varchar(256) not null,
cpf varchar(14) not null unique,
cargo varchar(256) not null,
telefone varchar(15),
dtcontratacao timestamp not null default current_timestamp()
);
create table pedidos(
idpedido int auto_increment primary key,
dtpedido timestamp not null default current_timestamp(),
id_cliente int,
id_funcionario int,
quantidade int,
vlTotal decimal(10,2),
forma_pagamento varchar (30),
foreign key (id_cliente) references cliente (idcliente),
foreign key (id_funcionario) references funcionario (idfuncionario)
);
create table itens_pedido (
    id_item int auto_increment primary key,
    id_pedido int,
    id_produto int,
    quantidade int,
    preco_unitario decimal(10,2),
    foreign key (id_pedido) references pedidos(idpedido),
    foreign key (id_produto) references produtos(idmanga)
);
select idpedido, vlTotal from pedidos where vlTotal > 100;
select nome, cargo from funcionario where cargo = 'Vendedor';
select idpedido, dtpedido, vlTotal from pedidos where dtpedido > '2025-05-01';
select nome, email from cliente order by nome asc;

