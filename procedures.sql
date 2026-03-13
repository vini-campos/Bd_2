-- Cadastro Clientes
create procedure CadastroCliente
	@rg VARCHAR(9),
    @nome VARCHAR(50), 
    @endereco VARCHAR(50), 
    @bairro VARCHAR(30), 
    @cidade VARCHAR(30), 
    @estado CHAR(2),
    @telefone VARCHAR(15),
    @email VARCHAR(30), 
    @datanasc DATE, 
    @sexo CHAR(1)
as
begin
	insert into dbo.clientes ([rg], [nome], [endereco], [bairro], [cidade], [estado], [telefone], [email], [datanascimento], [sexo]) 
	values (@rg, @nome, @endereco, @bairro, @cidade, @estado, @telefone, @email, @datanasc, @sexo)
end;

exec CadastroCliente '9865673216', 'Agnaldo Inácio Peixe da Silva', 'Rua Natal, 241', 'Jd. Paulistano', 'Salto de Pirapora', 'SP', '400028922', 'agnaldo.inacio13@outlook.com', '1945-04-29', 'M';


-- Alterar Clientes
create procedure UpdateDadosCliente
	@cod_cliente numeric(18,0),
	@rg VARCHAR(9),
    @nome VARCHAR(50), 
    @endereco VARCHAR(50), 
    @bairro VARCHAR(30), 
    @cidade VARCHAR(30), 
    @estado CHAR(2),
    @telefone VARCHAR(15),
    @email VARCHAR(30), 
    @datanascimento DATETIME, 
    @sexo CHAR(1)
as
begin
    update CLIENTES
    set
        RG = @rg,
        NOME = @nome,
        ENDERECO = @endereco,
        BAIRRO = @bairro,
        CIDADE = @cidade,
        ESTADO = @estado,
        TELEFONE = @telefone,
        EMAIL = @email,
        DATANASCIMENTO = @datanascimento,
        Sexo = @sexo
    Where COD_CLIENTE = @cod_cliente
end;

exec UpdateDadosCliente 12, '123456789', 'Carlinhos Maia', 'Rua Natal, 241', 'Jd Santa Rosália', 'São Paulo', 'SP', '11123456789', 'CarlinhosM@hotmail.com', '1981-07-21', 'M';


-- Selecionar Cliente
create procedure SelecionarCliente
    @ID_cliente int
as
begin
    select COD_CLIENTE, nome
    from dbo.CLIENTES
    where COD_CLIENTE = @ID_cliente;
end;

exec SelecionarCliente '11';


-- Deletar Clientes
create procedure ExcluirCliente
	@ID_cliente int
as
begin
	delete from dbo.CLIENTES
	where COD_CLIENTE = @ID_cliente
end;

exec ExcluirCliente '11';
