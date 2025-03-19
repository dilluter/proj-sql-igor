-- criando o banco de dados
drop database if exists hproje;
create database hproje;
use hproje;


-- criando a tabela de pessoas
create table tb_pessoas (
    idpessoa int auto_increment not null,
    desnome varchar(256) not null,
    dtcadastro timestamp not null default current_timestamp(),
    constraint pk_pessoas primary key (idpessoa)
) engine=innodb;

-- criando a tabela de funcionários
create table tb_funcionarios (
    idfuncionario int auto_increment not null,
    idpessoa int not null,
    vlsalario decimal(10,2) not null default 1000.00,
    dtadmissao date not null,
    constraint pk_funcionarios primary key (idfuncionario),
    constraint fk_funcionarios_pessoas foreign key (idpessoa) references tb_pessoas (idpessoa)
);

-- criando a tabla de pedidos
create table tb_pedidos (
    idpedido int auto_increment not null,
    idpessoa int not null,
    dtpedido datetime not null,
    vlpedido decimal(10,2),
    constraint pk_pedidos primary key (idpedido),
    constraint fk_pedidos_pessoas foreign key (idpessoa) references tb_pessoas (idpessoa)
);

-- inserindo dados na tabela de pessoas
insert into tb_pessoas (desnome) values ('gabi'), ('igor'), ('wend');

-- inserindo dados na tabela de funcionários
insert into tb_funcionarios values
(null, 1, 5000, current_date()),
(null, 2, 5000, current_date());

-- inserindo dados na tabela de pedidos
insert into tb_pedidos values
(null, 1, now(), 2325.00),
(null, 1, now(), 35325.00),
(null, 2, now(), 25325.00),
(null, 2, now(), 8000.00),
(null, 3, now(), 120000.00);

-- criando uma view para visualizar pedidos
create view v_pedidos as
select 
    b.desnome,
    sum(a.vlpedido) as total,
    convert(avg(a.vlpedido), decimal(10,2)) as media,
    convert(min(a.vlpedido), decimal(10,2)) as menor_valor,
    convert(max(a.vlpedido), decimal(10,2)) as maior_valor,
    count(*) as total_de_pedidos
from tb_pedidos a 
inner join tb_pessoas b using(idpessoa)
group by b.idpessoa
having sum(a.vlpedido) > 34000;

-- consultas úteis
select * from tb_pessoas;
select * from tb_funcionarios;
select * from tb_pedidos;
select * from v_pedidos;

-- contagem de funcionários
select count(*) as total from tb_funcionarios;

-- atualização de salário para funcionário específico
update tb_funcionarios set vlsalario = vlsalario * 1.5 where idfuncionario = 2;

-- selecionando funcionários com salário acima de 1600
select * from tb_funcionarios where vlsalario > 1600;

-- exibindo nome e salário com aumento de 10%
select 
    p.desnome, 
    f.vlsalario as atual, 
    convert(f.vlsalario * 1.1, decimal(10,2)) as 'salario com aumento de 10%'
from tb_funcionarios f
inner join tb_pessoas p on f.idpessoa = p.idpessoa;

-- join entre funcionários e pessoas
select *
from tb_funcionarios a
inner join tb_pessoas b on a.idpessoa = b.idpessoa;

-- left join entre pessoas e funcionários
select *
from tb_pessoas a
left join tb_funcionarios b on a.idpessoa = b.idpessoa;

-- criando procedure para salvar pessoa
delimiter $$

drop procedure if exists sp_pessoa_save;
create procedure sp_pessoa_save(
pdesnome varchar(256)
)
begin
    insert into tb_pessoas (desnome) values (pdesnome);
    select * from tb_pessoas where idpessoa = last_insert_id();
end $$

delimiter ;

call sp_pessoa_save('samuel');

-- criando procedure para salvar funcionário
delimiter $$

drop procedure if exists sp_funcionario_save;
create procedure sp_funcionario_save(
pdesnome varchar(256),
pvlsalario decimal(10,2),
pdtadmissao datetime
)
begin
    declare vidpessoa int;
    
    start transaction;
    
    -- Verifica se a pessoa já existe
    select idpessoa into vidpessoa from tb_pessoas where desnome = pdesnome limit 1;
    
    -- Se não existe, cria a pessoa
    if vidpessoa is null then
        insert into tb_pessoas (desnome) values (pdesnome);
        set vidpessoa = last_insert_id();
    end if;
    
    -- Verifica se a pessoa já é funcionário
    if not exists (select 1 from tb_funcionarios where idpessoa = vidpessoa) then
        insert into tb_funcionarios values (null, vidpessoa, pvlsalario, pdtadmissao);
        commit;
        select 'dados cadastrados com sucesso!' as resultado;
    else
        rollback;
        select 'usuario ja cadastrado' as resultado;
    end if;
    
end $$

delimiter ;

call sp_funcionario_save('israel', 3800, current_date());

-- criando função para calcular imposto
delimiter $$

drop function if exists fn_imposto_renda;
create function fn_imposto_renda(
pvlsalario decimal(10,2)
)
returns decimal(10,2)
deterministic
begin
    declare vimposto decimal(10,2);

    set vimposto = case
        when pvlsalario <= 2259.20 then 0
        when pvlsalario >= 2259.21 and pvlsalario <= 2826.65 then (pvlsalario * 0.075)
        when pvlsalario >= 2826.66 and pvlsalario <= 3751.05 then (pvlsalario * 0.15)
        when pvlsalario >= 3751.06 and pvlsalario <= 4664.68 then (pvlsalario * 0.225)
        when pvlsalario >= 4664.69 then (pvlsalario * 0.275)
    end;

    return vimposto;
end $$

delimiter ;

select 
    f.*, 
    p.desnome, 
    fn_imposto_renda(f.vlsalario) as vlimposto
from tb_funcionarios f
inner join tb_pessoas p using(idpessoa);
