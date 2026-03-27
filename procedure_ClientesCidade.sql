create procedure ClientesCidade
	@cidade varchar(50),
	@idade int
as
begin
	select distinct nome, format(Datanascimento, 'dd/MM/yyyy') as datanascimento, 2026 - year(datanascimento) as idade
	from clientes
	where cidade = @cidade
	and 2026 - year(datanascimento) <= @idade;
end;

exec ClientesCidade 'Sorocaba', '44';