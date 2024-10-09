
     --            Atividade 6 - Criação de Tabelas
 
-- Criar o banco de dados com o nome   'Atividade6';

drop database atividade6;

Create database atividade6;
 
use atividade6;

-- Abrir o banco de dados (criado acima)


 -- Criar a tabela de Forma de Pagto

Create table Forma_Pagto
(
 FormaPagto  Varchar(1),
 Descricao_Pagto varchar(20),
 Primary Key (FormaPagto)  
);    

-- Cadastrar os dados abaixo para o tipo de compra
   
  --   Forma Pagto              Descrição  
        ----                   ---------- 
--        1 --> para compra a  'A vista Dinheiro'
--        2 --> para compra a  'Débito no  Cartão'
--        3 --> Para Compra a  'Crédito no Cartão'
 
insert into Forma_Pagto (FormaPagto,Descricao_Pagto) 
value ('1','A vista Dinheiro');         
insert into Forma_Pagto (FormaPagto,Descricao_Pagto) 
value ('2','Débito no Cartão');  
insert into Forma_Pagto (FormaPagto,Descricao_Pagto) 
value ('3','Crédito no Cartão');
          
-- Criar a tabela abaixo e inserir os dados

Create table Compras
(
    cod_cliente  varchar(4),
	Forma_Pagto   varchar(1),
	comprador     varchar(30),
	Data_Compra timestamp default CURRENT_TIMESTAMP(),
	Vl_compra   Decimal(13,2),
    constraint FK_Cliente_Compra foreign key (Forma_Pagto)
    references Forma_Pagto(FormaPagto)
    );

select cod_cliente, comprador , count(vl_compra) from compras group by cod_cliente having cod_cliente = 'c01';

--  Inserir os dados 
select * from compras;


-- Obs: Qual função devemos utilizar para inserir a data de forma correta
-- Inserir os registros  

insert into Compras 
values ('C01','1','Ana Maria da Cruz',str_to_date('31-12-2022','%d-%m-%Y'),500);

-- Resposta: 
--  caso tenha que trocar a função, mãos a obra


insert into Compras 
values ('C01','1','Ana Maria da Cruz',str_to_date('23/03/2024','%d/%m/%Y') ,500);
insert into Compras values ('C01','2','Ana Maria da Cruz',str_to_date('24/03/2024','%d/%m/%Y'),1500);
insert into Compras values ('C01','3','Ana Maria da Cruz',str_to_date('20/02/2024','%d/%m/%Y'),2500);
insert into Compras values ('C01','3','Ana Maria da Cruz',str_to_date('25/01/2024','%d/%m/%Y'),500);

insert into Compras values ('C02','1', 'Maria de Sousa',str_to_date('23/02/2024','%d/%m/%Y'),7500);
insert into Compras values ('C02','1', 'Maria de Sousa',str_to_date('03/05/2024','%d/%m/%Y'),3500);
insert into Compras values ('C02','2', 'Maria de Sousa',str_to_date('03/05/2024','%d/%m/%Y'),5500);
insert into Compras values ('C02','2', 'Maria de Sousa',str_to_date('05/03/2024','%d/%m/%Y'),6500);
insert into Compras values ('C02','2', 'Maria de Sousa',str_to_date('23/02/2024','%d/%m/%Y'),7500);


insert into Compras values ('C03','1','Amelia da Paz',str_to_date('01/02/2024','%d/%m/%Y'),4500);
insert into Compras values ('C03','1','Amelia da Paz',str_to_date('02/02/2024','%d/%m/%Y'),600);
insert into Compras values ('C03','1','Amelia da Paz',str_to_date('21/03/2024','%d/%m/%Y'),780);
insert into Compras values ('C03','2','Amelia da Paz',str_to_date('04/04/2024','%d/%m/%Y'),1500);
insert into Compras values ('C03','2','Amelia da Paz',str_to_date('23/04/2024','%d/%m/%Y'),3500);
insert into Compras values ('C03','3','Amelia da Paz',str_to_date('25/04/2024','%d/%m/%Y'),7500);
insert into Compras values ('C03','3','Amelia da Paz',str_to_date('27/04/2024','%d/%m/%Y'),5500);
insert into Compras values ('C03','3','Amelia da Paz',str_to_date('30/01/2024','%d/%m/%Y'),8500);


insert into Compras values ('C04','2','Americo Antonio',str_to_date('03/01/2024','%d/%m/%Y'),12500);
insert into Compras values ('C04','2','Americo Antonio',str_to_date('23/02/2024','%d/%m/%Y'),1500);
insert into Compras values ('C04','2','Americo Antonio',str_to_date('25/02/2024','%d/%m/%Y'),15500);
insert into Compras values ('C04','3','Americo Antonio',str_to_date('26/02/2024','%d/%m/%Y'),22500);
insert into Compras values ('C04','3','Americo Antonio',str_to_date('23/03/2024','%d/%m/%Y'),32500);
insert into Compras values ('C04','3','Americo Antonio',str_to_date('30/03/2024','%d/%m/%Y'),25000);
insert into Compras values ('C04','3','Americo Antonio',str_to_date('30/03/2024','%d/%m/%Y'),500);
insert into Compras values ('C04','1','Americo Antonio',str_to_date('30/03/2024','%d/%m/%Y'),4500);
insert into Compras values ('C04','1','Americo Antonio',str_to_date('04/04/2024','%d/%m/%Y'),2500);
insert into Compras values ('C04','2','Americo Antonio',str_to_date('30/04/2024','%d/%m/%Y'),7500);

insert into Compras values ('C05','3', 'Elizabeth Mangaduba',str_to_date('30/03/2024','%d/%m/%Y'),8500);
insert into Compras values ('C05','3', 'Elizabeth Mangaduba',str_to_date('05/04/2024','%d/%m/%Y'),3500);

insert into Compras values ('C06','1','Mario Brosser',str_to_date('23/03/2024','%d/%m/%Y'),8900);
insert into Compras values ('C06','2','Mario Brosser',str_to_date('05/04/2024','%d/%m/%Y'),15500);
insert into Compras values ('C06','1','Mario Brosser',str_to_date('30/04/2024','%d/%m/%Y'),10500);

insert into Compras values ('C07','1','Carlos Magdo de Souza',str_to_date('23/02/2024','%d/%m/%Y'),7500);
insert into Compras values ('C07','2','Carlos Magdo de Souza',str_to_date('26/02/2024','%d/%m/%Y'),890);
insert into Compras values ('C07','3','Carlos Magdo de Souza',str_to_date('27/02/2024','%d/%m/%Y'),980);
insert into Compras values ('C07','2','Carlos Magdo de Souza',str_to_date('28/02/2024','%d/%m/%Y'),7500);
insert into Compras values ('C07','2','Carlos Magdo de Souza',str_to_date('30/03/2024','%d/%m/%Y'),4500);
insert into Compras values ('C07','1','Carlos Magdo de Souza',str_to_date('30/04/2024','%d/%m/%Y'),2500);


insert into Compras values ('C08','1', 'Bianca Souza',str_to_date('23/02/2024','%d/%m/%Y'),6500);
insert into Compras values ('C08','2', 'Bianca Souza',str_to_date('01/04/2024','%d/%m/%Y'),500);
insert into Compras values ('C08','3', 'Bianca Souza',str_to_date('05/04/2024','%d/%m/%Y'),9500);
insert into Compras values ('C08','3', 'Bianca Souza',str_to_date('09/04/2024','%d/%m/%Y'),15500);

insert into Compras values ('C09','1','Maria Silva e Sousa',str_to_date('23/01/2024','%d/%m/%Y'),7500);
insert into Compras values ('C09','1','Maria Silva e Sousa',str_to_date('03/03/2024','%d/%m/%Y'),17500);
insert into Compras values ('C09','1','Maria Silva e Sousa',str_to_date('04/03/2024','%d/%m/%Y'),37500);
insert into Compras values ('C09','1','Maria Silva e Sousa',str_to_date('13/04/2024','%d/%m/%Y'),550);
insert into Compras values ('C09','1','Maria Silva e Sousa',str_to_date('23/04/2024','%d/%m/%Y'),8500);

insert into Compras values ('C10','1', 'Amalia Suzete da Costa',str_to_date('03/01/2024','%d/%m/%Y'),2500);

insert into Compras values ('C11','1','Maria Catarina da silva',str_to_date('13/02/2024','%d/%m/%Y'),3500);

insert into Compras values ('C12','3', 'Catarina do Branco',str_to_date('17/04/2024','%d/%m/%Y'),2500);

insert into Compras values ('C13','3','Juca Xaves',str_to_date('13/01/2024','%d/%m/%Y'),3700);
insert into Compras values ('C13','3','Juca Xaves',str_to_date('23/04/2024','%d/%m/%Y'),3700);

insert into Compras values ('C14','1','Mariano Chaves',str_to_date('30/04/2024','%d/%m/%Y'),3700);
insert into Compras values ('C14','1','Mariano Chaves',str_to_date('03/05/2024','%d/%m/%Y'),3700);


-- 1) Selecionar o código, nome, data da compra, descrição do pagto 
--  e valor da compra dos com valores de Compras de R$ 3000.00 a R$ 5500.00
--    ordem crescente de nome

select cod_cliente, comprador,Descricao_Pagto,vl_compra from compras
inner join forma_pagto on Compras.Forma_Pagto = Forma_Pagto.Formapagto 
 where vl_compra between 3000.00 and 5500.00  order by comprador; 

-- em order crescente de codigo de cliente

select cod_cliente, comprador,Descricao_Pagto,vl_compra from compras
inner join forma_pagto on Compras.Forma_Pagto = Forma_Pagto.Formapagto 
where vl_compra between 3000.00 and 5500.00 order by cod_cliente; 

-- 2) Selecionar o código, nome, data da compra, descrição do pagto e valor da compra os registros
--   com valores de Compras entre R$ 6000.00 a R$ 15000.00 em ordem crescente de valores de compra

select cod_cliente, comprador, Data_Compra, Descricao_Pagto, Vl_compra from compras 
inner join Forma_Pagto on Compras.Forma_Pagto = Forma_Pagto.FormaPagto
where Vl_compra between 6000.00 and 15000.00 order by Vl_compra;

-- 3) Selecionar os registros com Compras a "vista Dinheiro"

select * from compras inner join Forma_Pagto on Compras.Forma_Pagto = Forma_Pagto.FormaPagto
where Descricao_Pagto = 'A vista Dinheiro';

-- 4) Selecionar os registros das Compras a '"vista dinheiro" e a "Débito no Cartão" 
select * from compras inner join Forma_Pagto on Compras.Forma_Pagto = Forma_Pagto.FormaPagto
where Descricao_Pagto in ('A vista Dinheiro','Débito no Cartão'); 

-- 5) Selecionar Total de Compra, descrição do pagto agrupando por tipo de pagto 
select count(*) as 'Total de Compras', Descricao_Pagto from compras inner join Forma_Pagto on Compras.Forma_Pagto = Forma_Pagto.FormaPagto
group by Compras.Forma_Pagto;

-- 6) Selecionar todos os dados dos compradores cujo nome iniciam com  'A'
select * from compras where comprador like 'A%';

-- 7) Selecionar todos os dados dos compradores cujo nome termiman com  'A' em ordem descrecente
select * from compras where comprador like '%a' order by comprador DESC;

-- 8) Selecionar todos os dados dos compradores cujo nome começam com  'Am' em ordem descrecente de compras
select * from compras where comprador like 'Am%' order by Data_Compra desc;

-- 9) Selecionar todos os dados dos compradores cujo nome começam com  'Am' tenham qualquer caracter na 3ª posição e l na 4ª posição
select * from compras where comprador like 'Am%_'; 

-- 10) Selecionar todos os dados dos compradores que tenham a letra 'D' no nome (em qualquer posição)
select * from compras where comprador like '%d%';

-- 11) Selecionar todos os dados dos compradores que tenham a inicam com 'A' OU 'E' em ordem alfabética
select * from compras where comprador like 'A%' or comprador like 'E%' order by comprador;  

-- 12) Selecionar todos os dados dos compradores que tenham a inicam com 'A', 'B', 'C' ,'D' OU 'E'
select * from compras where comprador like 'A%' or comprador like 'B%' or comprador like 'C%' or comprador like 'D%' or comprador like 'E%';

-- 13) Selecionar todos os dados dos compradores que tenham a inicam com 'A','C',OU 'E' e tenhan compras acima de R$ 5000.00 
select * from compras where Vl_compra > 5000.00 and (comprador like 'A%' or comprador like 'B%' or comprador like 'C%' or comprador like 'D%' or comprador like 'E%');

-- 14) Selecionar a quantidade de compras 
select count(*) as 'Total de Compras' from compras;   

-- 15)  Selecionar o total das compras 
select sum(Vl_compra) as 'Valor Total das Compras' from compras;

-- 16)  Selecionar o valor da maior compra 
select max(Vl_compra) as 'Compra de maior valor' from compras;
  
-- 17)  Selecionar o valor da menor compra 
select min(Vl_compra) as 'Compra de menor valor' from compras;
  
-- 18)  Selecionar a médias das compra 
select avg(Vl_compra) as 'Média dos valores das compras' from compras;  
  
-- 19) Selecionar o  valor da maior compra do cliente 'C02' 
select max(Vl_compra) from compras where cod_cliente = 'C02';
   
 -- 20) Selecionar o codigo e  valor da maior compra compra de cada cliente
select cod_cliente, max(Vl_compra) from compras group by cod_cliente; 
   
 -- 21) Selecionar o codigom nome e valor da maior compra compra de cada cliente
select cod_cliente, comprador, max(Vl_compra) from compras group by cod_cliente; 

-- 22) Selecionar o codigo, nome,  quantidade de compras e total de compras de cada cliente em ordem crescente de comprador
select cod_cliente, comprador, count(*) as 'Quantidade de compras', sum(Vl_compra) 'Total das compras' from compras 
group by cod_cliente order by comprador;  

 -- 23) Selecionar o codigo, nome, quantidade , maior , menor ,  total  e média de compras de cada cliente em ordem crescente de codigo do comprador
select cod_cliente, comprador, count(*) as 'Quantidade de compras', sum(Vl_compra) as 'Total das compras', avg(Vl_compra) as 'Média de compras'
from compras group by cod_cliente order by cod_cliente;

-- 24) Selecionar o tipo e total de compras por tipo de compra
select count(*) as 'Total de compras', Descricao_Pagto as 'Tipo de compra' from compras inner join Forma_Pagto
on compras.Forma_Pagto = Forma_Pagto.FormaPagto group by compras.Forma_Pagto;

-- 25) Selecionar o tipo, descrição de compras  e total de compras por tipo de compra do comprador 'c03'
select count(*) as 'Total de compras', Descricao_Pagto as 'Tipo de compra' from compras inner join Forma_Pagto
on compras.Forma_Pagto = Forma_Pagto.FormaPagto where cod_cliente = 'C03' group by compras.Forma_Pagto;

-- 26) Selecionar o tipo, descrição da compra e total de compras para as compras  com cartão  (débito e crédito)
select count(*) as 'Total de compras', Descricao_Pagto as 'Tipo de compra' from compras inner join Forma_Pagto
on compras.Forma_Pagto = Forma_Pagto.FormaPagto where Forma_Pagto.FormaPagto in ('2','3') group by compras.Forma_Pagto;  
        
-- 26.5 Selecionar a quantidade de compras e Total de compras  a Débito no cartão
select count(*) as 'Quantidade de compras', sum(Vl_compra) as 'Total de compras' from compras 
where Forma_Pagto = '2';  

-- 27) Selecionar a quantidade de clientes e  Total de compras que compraram a crédito no cartão
select count(*) as 'Quantidade de clientes', sum(Vl_compra) as 'Total de compras no crédito' from compras 
where Forma_Pagto = '3'; 

-- 28) Selecionar a quantidade de compras, media e total de valores das compras crédito no cartão por cliente 
select cod_cliente, count(*) as 'Quantidade de compras', sum(Vl_compra) as 'Total de compras no crédito', avg(Vl_compra) as 'Média das compras ' 
from compras where Forma_Pagto = '3' group by cod_cliente; 

-- 29) Selecionar a maior e a menor compra de cada cliente
select max(Vl_compra) as 'Maior compra', min(Vl_compra) as 'Menor compra' from compras group by cod_cliente;
 
-- 30) Selecionar o código, maior e a menor compra de cada cliente
select cod_cliente, max(Vl_compra) as 'Maior compra', min(Vl_compra) as 'Menor compra' from compras group by cod_cliente;

-- 31) Selecionar todos os dados dos compradores com sobrenome souza ou sousa
select * from compras where comprador like '%souza%' or comprador like '%sousa%';
