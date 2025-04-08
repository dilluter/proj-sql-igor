use hcode;

select count(*) as total from tb_funcionarios;
select nome, salario as atual, 
convert(salario * 1.1, dec(10,2)) as 'salario com aumento de 10%'
from tb_funcionarios;
