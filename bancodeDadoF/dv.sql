drop database nerd_db;
Create database nerd_db;
use nerd_db;
create table usuarios(
idusuario int auto_increment primary key,
nome varchar (200) not null,
email varchar (200) unique not null,
dtcadastro timestamp not null default current_timestamp()
);
create table categoria(
idcategoria int auto_increment primary key,
nome varchar (100)
);
create table produto(
idproduto int auto_increment primary key,
nome varchar (50) not null,
vlproduto decimal (10,2) not null,
estoque int default 0,
id_categoria int,
foreign key(id_categoria) references categoria(idcategoria)
);
create table pedidos(
idpedidos int auto_increment primary key,
usuarios_id int,
dt_pedido datetime,
status_pedidos varchar(20) default 'Pendente',
foreign key(usuarios_id) references usuarios(idusuario)
);
