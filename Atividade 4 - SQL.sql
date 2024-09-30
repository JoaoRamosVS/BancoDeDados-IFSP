-- Atividade - Aplicação de Join

-- Crian o banco de dados: BD_Escola
create database BD_Escola;

-- Abrir o banco de dados
use BD_Escola;

-- Criar as tabelas e inserir os dados

create table Instituto_Adm 
(
	Cod_Inst VARCHAR(3),
    Nome_Inst VARCHAR(30) NOT NULL,
    End_Inst VARCHAR(30),
    Bairro_Inst VARCHAR(20),
    Contato_Inst VARCHAR(30),
    CNPJ VARCHAR(19) UNIQUE,
    PRIMARY KEY(Cod_Inst)
);

create table Cursos
(
	Cod_Curso VARCHAR(03),
	Nome_Curso VARCHAR(30),
	Sigla_Curso VARCHAR(03),
	Tempo_Curso VARCHAR(02), -- Nº de semestres ou anos
	Duracao VARCHAR(01) CHECK (duracao IN ('S','A')),  -- Semestral / Anual
	PRIMARY KEY(Cod_Curso)
);

create table Unidades
(
	Cod_Unidade VARCHAR(03),
	Nome_Unidade VARCHAR(30),
	End_Unidade VARCHAR(30),
	Bairro_Unidade VARCHAR(30),
	Fone_Unidade VARCHAR(12),
	Cod_Instituto VARCHAR(03),
	PRIMARY KEY(Cod_Unidade),
	CONSTRAINT Pk_Instituto_Unidade FOREIGN KEY(Cod_Instituto) REFERENCES Instituto_Adm(Cod_Inst)
);

create table Turmas 
(
	Cod_Turma VARCHAR(04),
	Cod_Unidade VARCHAR(03),
	Curso VARCHAR(03),
	Periodo VARCHAR(01) CHECK (periodo IN ('M','T','N')),
	Vagas INT CHECK (Vagas > 0 and Vagas < 40),
	PRIMARY KEY (Cod_Turma),
	CONSTRAINT FK_Turma_Unidade FOREIGN KEY (Cod_Unidade) REFERENCES Unidades(Cod_Unidade)
);

create table Alunos
(
	 Cod_Aluno VARCHAR(06),
	 Nome_Aluno VARCHAR(30),
	 Unidade VARCHAR(03),
	 Curso VARCHAR(03),
	 Turma VARCHAR(04),
	 PRIMARY KEY (Cod_Aluno),
	 CONSTRAINT FK_Alunos_Unid FOREIGN KEY (Unidade) REFERENCES Unidades(Cod_Unidade),
	 CONSTRAINT Fk_Alunos_Curso FOREIGN KEY (Curso) REFERENCES Cursos(Cod_Curso),
	 CONSTRAINT FK_Alunos_Turma FOREIGN KEY (Turma) REFERENCES Turmas(Cod_Turma)
);

 -- INSERIR DADOS DA INSTITUIÇÃO 
 
insert into Instituto_Adm (Cod_Inst, Nome_Inst,End_Inst,Bairro_Inst,Contato_Inst,CNPJ) values
('IES','Instituto Ensino Superior','Rua das Cruzes,233','Santa Isabel','Mario Bross','123.546.345/0001-54');


-- INSERIR UNIDADES 

insert into Unidades (Cod_Unidade,Nome_Unidade,End_Unidade,Bairro_Unidade,Fone_Unidade) values
('U01','UNED Liberdade','Rua dos Marianos,45','Bela Vista','(11)-1223453');
insert into Unidades (Cod_Unidade,Nome_Unidade,End_Unidade,Bairro_Unidade,Fone_Unidade) values
('U02','UNED Guarulhos','Rua Brasil,345','Vila Rio','(11)-3333333');

-- INSERIR DADOS DOS CURSOS
insert into Cursos (Cod_Curso,Nome_Curso,Sigla_Curso,Tempo_Curso,Duracao) values
('C01','Analise e Desenvolvimento Sistemas','ADS','4','S');
insert into Cursos (Cod_Curso,Nome_Curso,Sigla_Curso,Tempo_Curso,Duracao) values
('C02','Engenharia da Computação','ECO','10','S');

-- INSERIR TURMAS
insert into Turmas (Cod_Turma,Cod_Unidade,Curso,Periodo,Vagas) values
('T01','U01','C01','M',39);  
insert into Turmas (Cod_Turma,Cod_Unidade,Curso,Periodo,Vagas) values
('T02','U01','C01','N',35);
insert into Turmas (Cod_Turma,Cod_Unidade,Curso,Periodo,Vagas) values
('T03','U02','C02','M',39);


-- INSERIR ALUNOS

Insert into ALUNOS (Cod_Aluno,Nome_Aluno,Unidade,Curso,Turma) values
('GU001','Fabricio da Silva','U01','C01','T01');    
Insert into ALUNOS (Cod_Aluno,Nome_Aluno,Unidade,Curso,Turma) values
('GU002','Maria Vitalina','U01','C01','T01');   


-- Nota: Inserir + 8 alunos para cada turma distribuindo-os nos dois cursos  
INSERT INTO Alunos (Cod_Aluno, Nome_Aluno, Unidade, Curso, Turma) VALUES
('GU003', 'Lucas Silva', 'U01', 'C02', 'T01');
INSERT INTO Alunos (Cod_Aluno, Nome_Aluno, Unidade, Curso, Turma) VALUES
('GU004', 'Mariana Costa', 'U01', 'C01', 'T01');
INSERT INTO Alunos (Cod_Aluno, Nome_Aluno, Unidade, Curso, Turma) VALUES
('GU005', 'Thiago Almeida', 'U01', 'C02', 'T01');
INSERT INTO Alunos (Cod_Aluno, Nome_Aluno, Unidade, Curso, Turma) VALUES
('GU006', 'Isabela Santos', 'U01', 'C01', 'T01');
INSERT INTO Alunos (Cod_Aluno, Nome_Aluno, Unidade, Curso, Turma) VALUES
('GU007', 'Gabriel Pereira', 'U01', 'C02', 'T01');
INSERT INTO Alunos (Cod_Aluno, Nome_Aluno, Unidade, Curso, Turma) VALUES
('GU008', 'Ana Paula', 'U02', 'C01', 'T01');
INSERT INTO Alunos (Cod_Aluno, Nome_Aluno, Unidade, Curso, Turma) VALUES
('GU009', 'Rafael Mendes', 'U02', 'C02', 'T01');
INSERT INTO Alunos (Cod_Aluno, Nome_Aluno, Unidade, Curso, Turma) VALUES
('GU010', 'Juliana Rocha', 'U02', 'C01', 'T01');
INSERT INTO Alunos (Cod_Aluno, Nome_Aluno, Unidade, Curso, Turma) VALUES
('GU011', 'Fernanda Lima', 'U01', 'C02', 'T02');
INSERT INTO Alunos (Cod_Aluno, Nome_Aluno, Unidade, Curso, Turma) VALUES
('GU012', 'Diego Martins', 'U01', 'C01', 'T02');
INSERT INTO Alunos (Cod_Aluno, Nome_Aluno, Unidade, Curso, Turma) VALUES
('GU013', 'Patrícia Gomes', 'U01', 'C02', 'T02');
INSERT INTO Alunos (Cod_Aluno, Nome_Aluno, Unidade, Curso, Turma) VALUES
('GU014', 'Carlos Alberto', 'U01', 'C01', 'T02');
INSERT INTO Alunos (Cod_Aluno, Nome_Aluno, Unidade, Curso, Turma) VALUES
('GU015', 'Marcos Vinicius', 'U02', 'C02', 'T02');
INSERT INTO Alunos (Cod_Aluno, Nome_Aluno, Unidade, Curso, Turma) VALUES
('GU016', 'Juliana Mendes', 'U02', 'C02', 'T02');
INSERT INTO Alunos (Cod_Aluno, Nome_Aluno, Unidade, Curso, Turma) VALUES
('GU017', 'Sérgio Ribeiro', 'U02', 'C01', 'T02');
INSERT INTO Alunos (Cod_Aluno, Nome_Aluno, Unidade, Curso, Turma) VALUES
('GU018', 'Natália Soares', 'U02', 'C02', 'T02');

-- Crie as Query (consultas) para:

-- 1) selecionar o nome da Código da Instituição, Nome da Instituição, Codigo da Unidade
--   e nome da unidade
update Unidades set Cod_Instituto = 'IES';
select Cod_Inst, Nome_Inst, Cod_Unidade, Nome_Unidade from Instituto_Adm inner join Unidades on Instituto_Adm.Cod_Inst = Unidades.Cod_Instituto;

-- 2)  Selecionar  o Codigo da Unidade, Nome da Unidade, Codigo Curso, Nome Curso 
--     em ordem alfabética
select Cod_Unidade, Nome_Unidade, Cod_Curso, Nome_Curso from Unidades inner join Cursos order by Nome_Unidade;

-- 3)  Selecione o Código da Unidade, Nome do Curso, Tempo de Curso e Duraçao
select Cod_Unidade, Nome_Curso, Tempo_Curso, Duracao from Unidades inner join Cursos;

-- 4) Selecione o nome da unidade, Codigo do curso, nome do curso, codigo da turma, Periodo e vagas
select Nome_Unidade, Cod_Curso, Nome_Curso, Cod_Turma, Periodo, Vagas from Unidades inner join Cursos inner join Turmas on Turmas.Curso = Cursos.Cod_Curso;

-- 5) Selecione o codigo e nome do curso, codigo da turma, codigo e nome da unidade, vagas para turmas do periodo da manhã
select Cod_Curso, Nome_Curso, Cod_Turma, Unidades.Cod_Unidade, Nome_Unidade, Vagas from Unidades inner join Turmas inner join Cursos on Turmas.Curso = Cursos.Cod_Curso where Turmas.Periodo = 'M'; 

-- 6) Selecione o codigo da turma, codigo e nome do aluno, codigo e nome do curso  
select Turma, Cod_Aluno, Nome_Aluno, Curso, Nome_Curso from Alunos inner join Cursos on Alunos.Curso = Cursos.Cod_Curso;

-- 7) Selecione o codigo e nome do aluno, nome da unidade, nome do curso, 
--    codigo da turma do curso de Engenharia da computação
select Cod_Aluno, Nome_Aluno, Nome_Unidade, Nome_Curso, Cod_Turma from Alunos inner join Unidades on Alunos.Unidade = Unidades.Cod_Unidade inner join Cursos on Alunos.Curso = Cursos.Cod_Curso inner join Turmas on Alunos.Turma = Turmas.Cod_Turma where Alunos.Curso = 'C02';

-- 8) Selecione o codigo e nome da unidade, Codigo da turma, codigo e nome do curso, 
--    codigo da turma e nome dos alunos
select Cod_Unidade, Nome_Unidade, Turma, Cod_Curso, Nome_Curso, Nome_Aluno from Alunos inner join Unidades on Alunos.Unidade = Unidades.Cod_Unidade inner join Cursos on Alunos.Curso = Cursos.Cod_Curso;