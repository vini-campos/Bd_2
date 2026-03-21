create procedure ClientesCidade
	@cidade varchar(50),
	@idade int
as
begin
	select nome, datanascimento, 2026 - year(datanascimento) as idade
	from clientes
	where cidade = @cidade
	and 2026 - year(datanascimento) = @idade;
end;

-- se precisar implementar mais tarde: format(Datanascimento, 'dd/MM/yyyy') as DataNascimento

exec ClientesCidade 'Sorocaba', '41';