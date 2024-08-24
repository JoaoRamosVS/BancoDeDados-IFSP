create database IFSP;
use IFSP;

create table TBcurso (
	Cod_curso varchar(10),
	Nome varchar(55),
    Sigla varchar(10),
    primary key (Cod_curso)
);

create table TBalunos (
	Prontuario varchar(10),
    Nome_aluno varchar(50),
    Cod_curso varchar(10),
    primary key (Prontuario),
    foreign key (Cod_curso) references TBcurso(Cod_curso)
);

insert into TBcurso (Cod_curso, Nome, Sigla) values ('C01', 'Informatica', 'Inf');
insert into TBcurso (Cod_curso, Nome, Sigla) values ('M01', 'Mecatronica', 'Meca');

insert into TBalunos (Prontuario, Nome_aluno, Cod_curso) values ('GU3055591', 'Joao Vitor', 'M01');

select * from TBcurso as TBC left join TBalunos as TBA on TBA.Cod_curso = TBC.Cod_curso;