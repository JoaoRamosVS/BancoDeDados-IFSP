/*                                                
 Aplicar os comandos de Criação de Banco de Dados, criação de tabelas, Insert , delete, update e select
*/
-- Criar o Banco do Dados : Bd_Turma
create database Bd_Turma; 
 --  Abrir o Banco de Dados
use Bd_Turma;
-- Criar as Tabelas:
/*
      Depto         
           
 Coluna	        	Tipo		Tam 	Descrição

 DEPTO (PK) 		CHAR	         3      Código do departamento
 DESC_DEPTO             VARCHAR          20     Nome do Departamento   Não nulo

*/
create table Depto(
	DEPTO char(3) primary key,
    DESC_DEPTO varchar(20) NOT NULL
);
 /*        Funcionario
Coluna	          	Tipo		Tam 	            Descrição
NUM_FUNC (PK)            CHAR		6	        Código do  empregado 
NOME			 VARCHAR	12	        Primeiro nome
SOBRENOME	         VARCHAR        25	        Sobrenome aluno - não nulo 
DEPT	(FK)		 CHAR	        3		Código de departamento do empregado
FONE			 CHAR		14		Numero de telefone
DTADIM		         DATE				Data de admissão Data do Sistema como Padrão
NIVEL	        	 Numero(Inteiro)		Educação formal em anos
SEXO			 CHAR		1		Masculino ou Feminico com 'M' para Masculino e 'F' para Feminino
DATANAS		         DATE				Data de nascimento  
SALARIO                  Decimal(10,2)    		Salário Anual
BONUS	                 Decimal(10,2)	        	Bônus Anual    - Valor Padrão  0	
COMIS	                 Decimal (10,2) 	                Comissão Anual
     
Obs.:   Para NIVEL  :-- 
                           1  -> Ensino Fundamental
                           2 –>Ensino Médio
                           3 –> Graduação
                           4 →  Pós-Graduação
             
*/
create 	table Funcionario (
	NUM_FUNC char(6) primary key,
    NOME varchar(12),
    SOBRENOME varchar(25) not null,
    DEPT char(3),
    FONE char(14),
    DTADIM DATE default NOW(),
    NIVEL integer CHECK (NIVEL in (1,2,3,4)),
    SEXO char(1) CHECK (SEXO in ('M','F')),
    DATANAS DATE,
    SALARIO decimal(10,2),
    BONUS decimal(10,2) default 0,
    COMIS decimal(10,2),
    CONSTRAINT FK_FuncionarioDepto foreign key (DEPT) references Depto(DEPTO)
);             

/*
Inserir os dados de   Depto

              DEPTO                              DESC_DEPTO
               001                               DIRETORIA
               002                               GERÊNCIA
               003                               ENGENHARIA
               004                               PRODUÇÃO
               005                               INFORMATICA
               006                               GERÊNCIA INFORMÁTICA
*/
INSERT INTO DEPTO VALUES ('001', 'DIRETORIA');
INSERT INTO DEPTO VALUES ('002', 'GERÊNCIA');
INSERT INTO DEPTO VALUES ('003', 'ENGENHARIA');
INSERT INTO DEPTO VALUES ('004', 'PRODUÇÃO');
INSERT INTO DEPTO VALUES ('005', 'INFORMATICA');
INSERT INTO DEPTO VALUES ('006', 'GERÊNCIA INFORMÁTICA');
/*
      
  Obs.: 1) Os códigos dos Funcionários deverão ser :”F001”,”F002”,”F003” ….
            2) Não inserir dados no campo BONUS
            3)Não inserir registros no Depto de “GERÊNCIA INFORMÁTICA”
            4) Para NIVEL  :--  
                                  1  -> Ensino Fundamental
                                  2  –> Ensino Médio
                                  3  –> Graduação
                                  4  -> Pós-Graduação

       Inserir   2 funcionários para Diretoria
       */
       INSERT INTO Funcionario (NUM_FUNC, NOME, SOBRENOME, DEPT, FONE, DTADIM, NIVEL, SEXO, DATANAS, SALARIO, COMIS) VALUES 
       ('F001', 'João', 'Silva', '001', '(11) 987654321', now(), 4, 'M', '1980-01-01', 10000.00, 2000.00),
       ('F002', 'Maria', 'Santos', '001', '(21) 912345678', now(), 3, 'F', '1985-05-15', 8000.00, 1500.00);
       /*
       Inserir   3 funcionários para Gerência
       */
       INSERT INTO Funcionario (NUM_FUNC, NOME, SOBRENOME, DEPT, FONE, DTADIM, NIVEL, SEXO, DATANAS, SALARIO, COMIS) VALUES 
       ('F003', 'Pedro', 'Almeida', '002', '(19) 978912345', now(), 3, 'M', '1990-11-20', 7000.00, 1200.00),
       ('F004', 'Ana', 'Oliveira', '002', '(27) 965432109', now(), 2, 'F', '1992-03-08', 6000.00, 1000.00),
       ('F005', 'Carlos', 'Pereira', '002', '(16) 952108765', now(), 4, 'M', '1988-07-25', 7500.00, 1300.00);
       /*
       Inserir   3  funcionários para Engenharia
       */
       INSERT INTO Funcionario (NUM_FUNC, NOME, SOBRENOME, DEPT, FONE, DTADIM, NIVEL, SEXO, DATANAS, SALARIO, COMIS) VALUES 
	   ('F006', 'Ana', 'Santos', '003', '(11) 987654321', now(), 3, 'F', '1985-05-15', 7000.00, 1200.00),
	   ('F007', 'Pedro', 'Silva', '003', '(21) 912345678', now(), 4, 'M', '1990-11-20', 8000.00, 1500.00),
	   ('F008', 'Maria', 'Almeida', '003', '(19) 978912345', now(), 2, 'F', '1992-03-08', 6500.00, 1100.00);
       /*
       Inserir   7  funcionários para Produção
       */
       INSERT INTO Funcionario (NUM_FUNC, NOME, SOBRENOME, DEPT, FONE, DTADIM, NIVEL, SEXO, DATANAS, SALARIO, COMIS) VALUES 
		('F009', 'João', 'Oliveira', '004', '(27) 965432109', now(), 1, 'M', '1995-07-25', 5500.00, 1000.00),
		('F010', 'Ana', 'Pereira', '004', '(16) 952108765', now(), 2, 'F', '1998-01-15', 6000.00, 1200.00),
		('F011', 'Carlos', 'Silva', '004', '(11) 987654321', now(), 3, 'M', '1992-05-15', 6500.00, 1300.00),
		('F012', 'Maria', 'Almeida', '004', '(21) 912345678', now(), 2, 'F', '1990-11-20', 6200.00, 1100.00),
		('F013', 'Pedro', 'Santos', '004', '(19) 978912345', now(), 1, 'M', '1997-03-08', 5800.00, 1050.00),
		('F014', 'Ana', 'Costa', '004', '(27) 965432109', now(), 2, 'F', '1999-07-25', 6100.00, 1250.00),
		('F015', 'Carlos', 'Rodrigues', '004', '(16) 952108765', now(), 3, 'M', '1994-01-15', 6300.00, 1350.00);
       /*
       Inserir   5  funcionários para Informática
	   */
       INSERT INTO Funcionario (NUM_FUNC, NOME, SOBRENOME, DEPT, FONE, DTADIM, NIVEL, SEXO, DATANAS, SALARIO, COMIS) VALUES 
		('F016', 'Maria', 'Santos', '005', '(11) 987654321', now(), 4, 'F', '1985-05-15', 8500.00, 1800.00),
		('F017', 'Pedro', 'Silva', '005', '(21) 912345678', now(), 3, 'M', '1990-11-20', 7500.00, 1500.00),
		('F018', 'Ana', 'Almeida', '005', '(19) 978912345', now(), 2, 'F', '1992-03-08', 7000.00, 1400.00),
		('F019', 'João', 'Oliveira', '005', '(27) 965432109', now(), 1, 'M', '1995-07-25', 6500.00, 1300.00),
		('F020', 'Carlos', 'Pereira', '005', '(16) 952108765', now(), 4, 'M', '1988-01-15', 8000.00, 1600.00);
 
-- Alterar  o Depto de um dos funcionários do Depto de Informática para Depto de Engenharia.
UPDATE Funcionario SET DEPT = '003' WHERE NUM_FUNC = 'F016';
--      Alterar o depto de INFORMATICA para INFORMÁTICA
UPDATE Depto SET DESC_DEPTO = 'INFORMÁTICA' WHERE DEPTO = '005';
-- Aumentar  o  Salário dos funcionários em 17%
UPDATE Funcionario SET SALARIO = SALARIO * 1.17;
-- Alterar o campo Bonus  com 5% de Salário para todos os funcionários
UPDATE Funcionario SET BONUS = SALARIO * 0.05;
-- Alterar o campo  Bonus com 15% de Salário para todos os funcionários de Engenharia
UPDATE Funcionario SET BONUS = SALARIO * 0.15 WHERE DEPT = '003';
-- Aumentar em 5% todos os Salários
UPDATE Funcionario SET SALARIO = SALARIO * 1.05;
-- Aumentar em 6% o Salário dos funcionários do Depto da Gerência
UPDATE Funcionario SET SALARIO = SALARIO * 1.06 WHERE DEPT = '002';
-- Diminuir em 2% o Salário dos funcionários de Engenharia
UPDATE Funcionario SET SALARIO = SALARIO * 0.98 WHERE DEPT = '003';
-- Alterar a Descrição do Depto de “INFORMATICA”  para “INFORMÁTICA”
UPDATE Depto SET DESC_DEPTO = 'INFORMÁTICA' WHERE DEPTO = '005';
-- Alterar o fone do Funcionário com código “F004”, para “3643-4576”
UPDATE Funcionario SET FONE = '3643-4576' WHERE NUM_FUNC = 'F004';
-- Excluir todos os registros de  Depto (Conseguiu ? ), se não, explicar o porque não foi possível
DELETE FROM DEPTO; -- Interfere na CONSTRAINT Foreign Key criada na tabela Funcionário, ou seja, por termos registros associados aos registros da tabela Depto
-- Excluir o registro do Depto “GERENCIA INFORMÁTICA”
DELETE FROM DEPTO WHERE DESC_DEPTO = 'GERÊNCIA INFORMÁTICA';
-- Excluir todos os registros de funcionários.
DELETE FROM Funcionario;
-- Incluir todos  os registros do Depto e Funcionários (Novamente ?)
-- Feito utilizando os inserts de cima

-- Excluir os registros dos funcionários do departamento de INFORMÁTICA
DELETE FROM Funcionario WHERE DEPT = '005';
-- Excluir o registro do Depto de GERÊNCIA INFORMÁTICA
DELETE FROM Depto WHERE DEPTO = '006';
-- Listar todos os campos de todos os funcionários
SELECT * FROM Funcionario;
-- Listar todos os campos de todos os Departamentos
SELECT * FROM Depto;
-- Listar os campos Numero  e Nome e Salário  (Colocar um Alias para cada campo)  de todos funcionários
SELECT NUM_FUNC as num, NOME as nm, SALARIO as sal from Funcionario;
-- Listar os campos Numero  e Nome e Salário de todos funcionários do Departamento de informática
SELECT NUM_FUNC, NOME, SALARIO FROM Funcionario WHERE DEPT = '005';
-- Listar os campos Numero  e Nome e Salário de todos funcionários do Departamento de Produção com salário maior que R$ 2.000,00
SELECT NUM_FUNC, NOME, SALARIO FROM Funcionario WHERE DEPT = '004' AND SALARIO > 2000;
-- Listar os campos Numero  e Nome e Salário de todos funcionários do Departamento de Produção com salário menor que R$ 20.000,00
SELECT NUM_FUNC, NOME, SALARIO FROM Funcionario WHERE DEPT = '004' AND SALARIO < 20000;
-- Listar os campos Numero  e Nome e Salário de todos funcionários do Departamento de Informática com salário menor ou igual a  R$ 7.000,00
SELECT NUM_FUNC, NOME, SALARIO FROM Funcionario WHERE DEPT = '005' AND SALARIO <= 7000;
-- Listar os campos Numero  e Nome e Salário de todos funcionários do Departamento de Produção com salário entre R$ 600,00  e  R$ 2.000,00
SELECT NUM_FUNC, NOME, SALARIO FROM Funcionario WHERE DEPT = '004' AND SALARIO BETWEEN 600 AND 2000;
-- Listar os campos Numero  e Nome e Salário de todos funcionários do Departamento de Produção
SELECT NUM_FUNC, NOME, SALARIO FROM Funcionario WHERE DEPT = '004';
-- Listar os campos Número,Nome, Salário em ordem crescente de salário
SELECT NUM_FUNC, NOME, SALARIO FROM Funcionario ORDER BY SALARIO;
-- Listar os campos Número,Nome, Salário do Departamento de produção em ordem decrescente de salário.
SELECT NUM_FUNC, NOME, SALARIO FROM Funcionario WHERE DEPT = '004' ORDER BY SALARIO DESC;
-- Listar os campos Número, Nome, Data de Nascimento e Bonus dos funcionários de Informática.
SELECT NUM_FUNC, NOME, DATANAS, BONUS FROM Funcionario WHERE DEPT = '005';
-- Listar todos os dados dos funcionários com curso Superior (Graduação)  em ordem alfabética de nome (Colocar um apelido para campo)
SELECT NUM_FUNC, NOME AS NM, SOBRENOME, DEPT, FONE, DTADIM, NIVEL, SEXO, DATANAS, SALARIO, BONUS, COMIS FROM Funcionario WHERE NIVEL = 3 ORDER BY NOME;
-- Listar todos dados dos funcionários com curso Pós-Graduação em ordem decrescente de nome
SELECT * FROM Funcionario WHERE NIVEL = 4 ORDER BY NOME DESC;
-- listar os campos dos funcionários do Departamento de Informática com salário entre R$ 5.600,00 e R$ 8.000,00 usando 
SELECT * FROM Funcionario WHERE DEPT = '005' AND SALARIO BETWEEN 5600 AND 8000;