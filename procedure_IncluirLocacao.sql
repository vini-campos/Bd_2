--executar antes de rodar a procedure

alter table locacoes
add Data_devolucao datetime;

alter table locacoes
add status varchar(10);

alter table locacoes
drop column data_retirada;

alter table locacoes
drop column data_devolucao;

alter table locacoes
add data_retirada datetime;

alter table locacoes
add data_devolucao datetime;
-------------------------------------

create procedure IncluirLocacao
    @ID_Cliente int,
    @ID_Filme int
as
begin
    insert into locacoes(cod_cliente, cod_filme, data_retirada)
    values (@ID_Cliente, @ID_Filme, getdate());

    -- Atualiza status 
    update filmes
    set status = 'alugado'
    where cod_filme = @ID_Filme;
end

exec IncluirLocacao @ID_Cliente = 3, @ID_Filme = 5;
