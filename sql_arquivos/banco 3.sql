create table tb_pedidos ( 
    idpedido int auto_increment not null,
    idpessoa int not null,
    dtpedido datetime not null,
    vlpedido decimal(10,2),
    constraint pk_pedidos primary key (idpedido),
    constraint fk_pedidos_pessoas foreign key (idpessoa) references tb_pessoas (idpessoa)
tb_funcionarios);

select * from tb_pessoas;

insert into tb_pedidos values (null, 1, current_date(), 2325.00);
insert into tb_pedidos values (null, 1, current_date(), 35325.00);

insert into tb_pedidos values (null, 2, current_date(), 25325.00);
insert into tb_pedidos values (null, 2, current_date(), 8000.00);


insert into tb_pedidos values (null, 3, current_date(), 120000.00);

create view v_pedidos as
select 
    b.desnome,
    sum(a.vlpedido) as total,
    convert(avg(a.vlpedido), decimal(10,2)) as media,
    convert(min(a.vlpedido), decimal(10,2)) as `menor valor`,
    convert(max(a.vlpedido), decimal(10,2)) as `maior valor`,
    count(*) as `total de pedidos`
from tb_pedidos a 
inner join tb_pessoas b using(idpessoa)
group by b.idpessoa
having sum(a.vlpedido) > 34000;

 
 
 