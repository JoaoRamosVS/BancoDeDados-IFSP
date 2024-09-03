-- Atividade 1 da Aula 2 sobre constraints e tipos de dados e colunas

create database Shopping;
use Shopping;

create table Shopping (
	Codigo_Shopping varchar(3) PRIMARY KEY,
	Nome_Shopping varchar(40) NOT NULL,
	Endereco_Shopping varchar(30) NOT NULL,
	Bairro_Shopping varchar(30),
	Cidade_Shopping varchar(30),
	UF_Shopping varchar(2),
	Fone_Administrativo varchar(13)
);

create table TB_Lojas (
	Codigo_Loja varchar(3) primary key,
	Nome_Loja varchar(30) NOT NULL,
	CNPJ_Loja varchar(17) UNIQUE,
    Codigo_Shopping varchar(3),
	CONSTRAINT FK_ShoppingLoja foreign key (Codigo_Shopping) references Shopping(Codigo_Shopping)
);

create table TB_Cargo (
	Codigo_Cargo varchar(5) primary key,
	Nome_do_Cargo varchar(5) NOT NULL,
	Comissao_Cargo real
);

create table TB_Funcionarios (
	Codigo_Funcionario varchar(3) primary key,
	Nome_Do_Funcionario varchar(40) NOT NULL,
	Sexo char(1) CHECK (Sexo IN ('M','F')),
	Data_Nascimento date,
	CPF varchar(12) unique,
	Data_Admissao date,
	Cod_Cargo varchar(5),
    CONSTRAINT FK_FuncionarioCargo foreign key (Cod_Cargo) references TB_Cargo(Codigo_Cargo),
	Cod_Loja varchar(3),
    CONSTRAINT FK_FuncionarioLoja foreign key (Cod_Loja) references TB_Lojas(Codigo_Loja)
);

-- Atividade 2

create database BD_Vendas;
use BD_Vendas;

create table Clientes (
	CodigoDoCliente char(6) primary key,
    NomeDoCliente varchar(50) not null,
    Endereco varchar (50) not null,
    Cidade varchar(30) not null,
    CEP char(9) not null,
    UF char(2) not null,
    Pais varchar(30) not null,
    Telefone char(13) not null,
    Fax char(10) 
);

create table Fornecedores (
	CodigoDoFornecedor char(6) primary key,
    NomeDaEmpresa varchar(50) not null,
    NomeDoContato varchar(50) not null,
    CargoDoContato varchar(40) not null,
    Endereco varchar(50) not null,
    Cidade varchar(30) not null,
    UF char(2) not null,
    CEP char(9) not null,
    Pais varchar(30) not null,
    Telefone char(13) not null,
    Fax char(10)
);

create table Categorias (
	CodigoDaCategoria char(3) primary key,
    NomeDaCategoria varchar(40),
    Descricao text,
    Figura longblob
);

create table Pedidos (
	NumeroPedido varchar(7) primary key,
    CodigoCliente char(6) not null,
	CodigoFuncionario char(6) not null,
    DataDoPedido datetime not null,
    DataDeEntrega datetime,
    DataDeEnvio datetime,
    Frete numeric,
    NomeDestinatario varchar(50) not null,
    EnderecoDestinatario varchar(50) not null,
    CidadeDeDestino varchar(30) not null,
    CEPDeDestino char(9) not null,
    PaisDeDestino varchar(30) not null,
    CONSTRAINT FK_ClientePedido foreign key (CodigoCliente) references Clientes(CodigoDoCliente)
);

create table Produtos (
	CodigoProduto varchar(7) primary key,
    NomeDoProduto varchar(50) not null,
    CodigoFornecedor char(6) not null,
    CodigoCategoria char(3) not null,
    QuantidadePorUnidade numeric not null,
    PrecoUnitario numeric not null,
    UnidadesEmEstoque numeric not null,
    UnidadesPedidas numeric not null,
    NivelDeEstoque numeric not null,
    Descontinuado char(1) not null CHECK (Descontinuado in ('S','N')),
    CONSTRAINT FK_CategoriaProduto foreign key (CodigoCategoria) references Categorias(CodigoDaCategoria),
    CONSTRAINT FK_FornecedorProduto foreign key (CodigoFornecedor) references Fornecedores(CodigoDoFornecedor)
);

create table ItensPedidos (
	NumeroDoPedido varchar(7) not null,
    CodigoDoProduto varchar(7) not null,
    PrecoUnitario numeric not null,
    Quantidade numeric not null,
    Desconto numeric,
    CONSTRAINT FK_NumeroPedido foreign key (NumeroDoPedido) references Pedidos(NumeroPedido),
    CONSTRAINT FK_CodigoProduto foreign key (CodigoDoProduto) references Produtos(CodigoProduto)
);