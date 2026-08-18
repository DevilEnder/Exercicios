create database apex;
use apex;

create table cliente(
id int auto_increment,
nome varchar(45) not null,
cpf varchar(14) not null,
email varchar(100) not null,
telefone varchar(11) not null,
rua varchar(40) not null,
numero int not null,
bairro varchar(40) not null,
cidade varchar(40) not null,
cep varchar(8) not null,
primary key(id)
);

create table fornecedor (
id int auto_increment,
nome varchar(45) not null,
cnpj varchar(18) not null,
endereco_completo varchar(150) not null,
data_do_cadastro  date not null,
tempo_de_parceria varchar(45),
primary key (id)
);

create table telefone (
id int auto_increment,
telefone varchar(11) not null,
id_fornecedor int not null,
primary key (id),
foreign key (id_fornecedor) references fornecedor(id)
);

create table email (
id int auto_increment,
email varchar(100) not null,
id_fornecedor int not null,
primary key (id),
foreign key (id_fornecedor) references fornecedor(id)
);

create table transportadora (
id int auto_increment,
site varchar(100),
nome varchar(45) not null,
cnpj varchar(18) not null,
telefone varchar(11) not null,
primary key (id)
);

create table entrega (
id int auto_increment,
data_envio date,
data_prevista date not null,
data_entrega date,
cod_rastreamento varchar(50) not null,
id_transportadora int not null,
primary key (id),
foreign key (id_transportadora) references transportadora(id)
);

create table venda (
id int auto_increment,
data_hora_compra datetime not null,
forma_pagamento varchar(20) not null,
valor_total decimal(10,2) not null,
situacao_pedido varchar(20) not null,
id_cliente int not null,
id_entrega int not null,
primary key (id),
foreign key (id_cliente) references cliente(id),
foreign key (id_entrega) references entrega(id)
);

create table produto (
id int auto_increment,
nome varchar(45) not null,
descricao varchar(200),
categoria varchar(45) not null,
preco_unitario decimal(10,2) not null,
codigo_de_barras varchar(20) not null,
qnt_estoque int not null,
id_fornecedor int,
primary key (id),
foreign key (id_fornecedor) references fornecedor(id)
);
 
create table item_venda (
id_venda int not null,
id_produto int not null,
qnt_comprada int not null,
preco_unitario decimal(10,2) not null,
primary key (id_venda, id_produto),
foreign key (id_venda) references venda(id),
foreign key (id_produto) references produto(id)
);

create table movi_estoque (
id int auto_increment,
quantidade int not null,
tipo_movimentacao varchar(20) not null,
data date not null,
nome_fornecedor varchar(45),
id_produto int not null,
primary key (id),
foreign key (id_produto) references produto(id)
);

-- comando para inserir informaçoes nas tabelas
insert into cliente (nome, cpf, email, telefone, rua, numero, bairro, cidade, cep)
values ('Ana Lima','123.456.789-00', 'ana.lima@email.com', '11987654321', 'Rua das Flores', 100, 'Centro', 'São Paulo', '01310100'),
('Carlos Souza','234.567.890-11', 'carlos.s@email.com', '11976543210', 'Av. Paulista', 500, 'Bela Vista', 'São Paulo', '01310200'),
('Mariana Costa', '345.678.901-22', 'mari.costa@email.com', '21965432109', 'Rua do Ouvidor', 30,  'Centro', 'Rio de Janeiro','20040030'),
('Pedro Alves', '456.789.012-33', 'pedro.a@email.com', '31954321098', 'Av. Afonso Pena', 1000,'Funcionários', 'Belo Horizonte','30130005');

insert into fornecedor (nome, cnpj, endereco_completo, data_do_cadastro, tempo_de_parceria)
values ('TechSupply Ltda', '11.222.333/0001-44', 'Rua Industrial, 200, Santo André, SP', '2020-03-15', '5 anos'),
('Moda Brasil S.A.', '22.333.444/0001-55', 'Av. do Comércio, 750, Fortaleza, CE', '2021-07-01', '3 anos'),
('Casa e Lar Distribuidora', '33.444.555/0001-66', 'Rua dos Fornecedores, 90, Curitiba, PR','2019-01-10', '6 anos'),
('Office Max Ltda', '44.555.666/0001-77', 'Av. Industrial, 400, Campinas, SP', '2022-05-20', '2 anos');

insert into telefone (telefone, id_fornecedor) 
values ('1133334444', 1),
('1133335555', 1),
('8522226666', 2),
('4133337777', 3),
('1933338888', 4),
('1933339999', 4);

insert into email (email, id_fornecedor) 
values ('contato@techsupply.com.br', 1),
('vendas@techsupply.com.br', 1),
('contato@modabrasil.com.br', 2),
('compras@casaelar.com.br', 3),
('vendas@officemax.com.br', 4);

insert into transportadora (nome, cnpj, telefone, site) 
values ('Rapidão Entregas', '55.666.777/0001-88', '1144445555', 'www.rapidao.com.br'),
('LogFast Ltda', '66.777.888/0001-99', '1144446666', 'www.logfast.com.br'),
('EntregaJá S.A.', '77.888.999/0001-00', '1144447777', 'www.entregaja.com.br'),
('TransBrasil Ltda', '88.999.000/0001-11', '1144448888', 'www.transbrasil.com.br');

insert into entrega (data_envio, data_prevista, data_entrega, cod_rastreamento, id_transportadora) 
values ('2024-01-10', '2024-01-15', '2024-01-14', 'BR001234567SP', 1),
('2024-02-05', '2024-02-10', '2024-02-11', 'BR002345678SP', 2),
('2024-03-20', '2024-03-25', null, 'BR003456789RJ', 3),
('2024-04-01', '2024-04-07', null, 'BR004567890MG', 4);
 
 insert into venda (data_hora_compra, forma_pagamento, valor_total, situacao_pedido, id_cliente, id_entrega) 
 values ('2024-01-09 14:30:00', 'cartao_credito', 1250.00, 'entregue', 1, 1),
('2024-02-04 10:15:00', 'pix', 389.90, 'entregue', 2, 2),
('2024-03-19 09:00:00', 'boleto', 750.50, 'enviado', 3, 3),
('2024-03-31 16:45:00', 'cartao_credito', 210.00, 'processando', 4, 4);

insert into produto (nome, descricao, categoria, preco_unitario, codigo_de_barras, qnt_estoque, id_fornecedor) 
values ('Notebook Gamer', 'Notebook com RTX 3060, 16GB RAM, 512GB SSD', 'Eletronicos', 4500.00, '7891234560001', 15,  1),
('Camiseta Polo', 'Camiseta polo masculina algodão 100%', 'Roupas', 89.90, '7891234560002', 200, 2),
('Jogo de Panelas', 'Kit 5 panelas antiaderente com tampa', 'Utensílios', 320.00, '7891234560003', 50, 3),
('Cadeira Escritório', 'Cadeira ergonômica com apoio lombar', 'Escritório', 750.00, '7891234560004', 30, 4),
('Mouse Sem Fio', 'Mouse wireless 2.4GHz com bateria recarregável','Eletronicos', 149.90, '7891234560005', 80, 1),
('Produto Próprio', 'Produto fabricado internamente pela loja', 'Diversos', 50.00, '7891234560006', 100, null);

insert into item_venda (id_venda, id_produto, qnt_comprada, preco_unitario) 
values (1, 1, 1, 4500.00),
(1, 5, 5, 149.90),
(2, 2, 3, 89.90),
(2, 3, 1, 320.00),
(3, 4, 1, 750.50),
(4, 6, 4, 50.00);

insert into movi_estoque (quantidade, tipo_movimentacao, data, nome_fornecedor, id_produto) 
values	(50, 'entrada', '2024-01-05', 'TechSupply Ltda', 1),
(1, 'saida', '2024-01-09', null, 1),
(100, 'entrada', '2024-01-06', 'Moda Brasil S.A.', 2),
(3, 'saida', '2024-02-04', null, 2),
(20, 'entrada', '2024-01-07', 'Casa e Lar Distribuidora', 3),
(1, 'saida', '2024-02-04', null, 3),
(5, 'ajuste', '2024-03-01', null, 4),
(4, 'saida', '2024-03-31', null, 6);

-- 2) Atualiza o email do cliente 1
update cliente
set email = 'ana.lima.novo@email.com'
where id = 1;

-- Atualiza a situação do pedido da venda 3
update venda
set situacao_pedido = 'entregue'
where id = 3;
 
-- Atualiza o preço unitário do produto 5
update produto
set preco_unitario = 129.90
where id = 5;

-- 3) Busca todas as vendas com valor_total >= 300 e < 1000
select * from venda
where valor_total >= 300 and valor_total < 1000;

-- 4) Busca nome, preco_unitario e categoria de produtos, com preço entre 50 e 500
select nome, preco_unitario, categoria from produto
where preco_unitario between 50 and 500;

-- 5) Busca 5 colunas de venda ccom formas de pagamento que sejam pix ou boleto
select id, data_hora_compra, forma_pagamento, valor_total, situacao_pedido from venda
where forma_pagamento in ('pix', 'boleto', 'cartao_credito');

-- 6) Busca todos os clientes que o nome começa com a letra 'A' ou contém 'Costa'
select * from cliente
where nome like 'A%' or nome like '%Costa%';

-- 7) Busca produtos da categoria Eletronicos ou Escritório
select * from produto
where categoria = 'Eletronicos' or categoria = 'Escritório';

-- 8) Busca movimentações do tipo 'entrada' com quantidade > 10, ou do tipo 'ajuste' independente da quantidade
select * from movi_estoque
where tipo_movimentacao = 'entrada' and quantidade > 10
or  tipo_movimentacao = 'ajuste';

-- 9) Busca o maior valor_total entre todas as vendas
select max(valor_total) as maior_venda from venda;

-- 10) Soma o valor total de todas as vendas com situação 'entregue'
select sum(valor_total) as total_vendas_entregues from venda
where situacao_pedido = 'entregue';

-- 11) Lista cada venda com o nome e CPF do cliente que a realizou com uso de alias
select v.id as id_venda, c.nome as cliente, c.cpf, v.forma_pagamento, v.valor_total, v.situacao_pedido
from venda v
inner join cliente c on c.id = v.id_cliente;

-- 12) Lista todos os produtos e se houver, o nome do fornecedor,  (produtos de fabricação própria aparecem com fornecedor null)
select p.id, p.nome as produto, p.categoria, p.preco_unitario, f.nome  as fornecedor
from produto p
left join fornecedor f on f.id = p.id_fornecedor;

-- 13) Lista todos os fornecedores e os produtos, incluindo fornecedores que ainda não têm produto cadastrado
select f.nome as fornecedor, f.cnpj, p.nome as produto, p.categoria
from produto p
right join fornecedor f on f.id = p.id_fornecedor;

-- 14) Lista itens de venda de produtos que o nome contém 'o' e com preco_unitario registrado no item entre 100 e 5000
select iv.id_venda, p.nome as produto, iv.qnt_comprada, iv.preco_unitario
from item_venda iv
inner join produto p on p.id = iv.id_produto
where p.nome like '%o%' and iv.preco_unitario between 100 and 5000;

-- 15) Conta quantos itens (linhas) cada venda possui
select v.id as id_venda, v.data_hora_compra, count(iv.id_produto) as qtd_itens
from venda v
inner join item_venda iv on iv.id_venda = v.id
group by v.id, v.data_hora_compra;

-- 16) Lista cada item de venda com o nome do cliente e do produto
select c.nome as cliente, v.id as id_venda, p.nome as produto, iv.qnt_comprada, iv.preco_unitario
from item_venda iv
inner join venda v on v.id = iv.id_venda
inner join produto p on p.id = iv.id_produto
inner join cliente c on c.id = v.id_cliente;

-- 17) Lista itens de venda onde a quantidade comprada <= 2 ou o preço unitário no item <= 100
select c.nome as cliente, p.nome as produto, iv.qnt_comprada, iv.preco_unitario
from item_venda iv
inner join venda v on v.id = iv.id_venda
inner join produto p on p.id = iv.id_produto
inner join cliente c on c.id = v.id_cliente
where iv.qnt_comprada <= 2 or iv.preco_unitario <= 100;
 
-- 18) Lista produtos das categorias Eletronicos e Escritório, mostrando suas movimentações de estoque, o fornecedor associado (se houver) e as vendas em que o produto aparece.
select p.nome as produto, p.categoria, f.nome as fornecedor, mov_e.tipo_movimentacao, mov_e.quantidade, mov_e.data, iv.qnt_comprada  as qtd_vendida
from movi_estoque mov_e
inner join produto p on p.id = mov_e.id_produto
inner join item_venda iv on iv.id_produto = p.id
left  join fornecedor f on f.id = p.id_fornecedor
where p.categoria in ('Eletronicos', 'Escritório');

-- 19) envolvendo 4 tabelas, venda, cliente, entrega e transportadora responsável
select c.nome as cliente, v.id as id_venda, v.valor_total, v.situacao_pedido, e.cod_rastreamento, e.data_prevista, e.data_entrega, t.nome as transportadora
from venda v
inner join cliente c on c.id = v.id_cliente
inner join entrega  e on e.id = v.id_entrega
inner join transportadora t on t.id = e.id_transportadora;

-- 20) Une nome de clientes com nome de fornecedores (sem repetição pq é union)
select nome, 'Cliente' as tipo from cliente
union
select nome, 'Fornecedor' as tipo from fornecedor;

-- 21) Une itens de vendas entregues com itens de vendas canceladas, excluindo produtos da categoria 'Diversos' (!=)
select c.nome as cliente, p.nome as produto, iv.qnt_comprada, v.situacao_pedido
from item_venda iv
inner join venda v on v.id = iv.id_venda
inner join produto p on p.id = iv.id_produto
inner join cliente c on c.id = v.id_cliente
where v.situacao_pedido = 'entregue' and p.categoria != 'Diversos'

union all
 
select c.nome as cliente, p.nome as produto, iv.qnt_comprada, v.situacao_pedido
from item_venda iv
inner join venda v on v.id = iv.id_venda
inner join produto p on p.id = iv.id_produto
inner join cliente c on c.id = v.id_cliente
where v.situacao_pedido = 'cancelado' and p.categoria != 'Diversos';

-- 22) simular full join entre produto e fornecedor: mostra todos os produtos e todos os fornecedores, mesmo sem correspondência de ambos os lados
select p.nome as produto, f.nome as fornecedor
from produto p
left join fornecedor f on f.id = p.id_fornecedor
 
union
 
select p.nome as produto, f.nome as fornecedor
from produto p
right join fornecedor f on f.id = p.id_fornecedor;

-- 23) Criar usuário com CRUD em todas as tabelas, exceto produto e fornecedor (somente leitura)
drop user if exists 'vendedor'@'localhost';
create user 'vendedor'@'localhost' identified by '123456';

grant select, insert, update, delete on apex.cliente to 'vendedor'@'localhost';
grant select, insert, update, delete on apex.venda to 'vendedor'@'localhost';
grant select, insert, update, delete on apex.item_venda  to 'vendedor'@'localhost';
grant select, insert, update, delete on apex.entrega to 'vendedor'@'localhost';
grant select, insert, update, delete on apex.transportadora to 'vendedor'@'localhost';
grant select, insert, update, delete on apex.telefone to 'vendedor'@'localhost';
grant select, insert, update, delete on apex.email to 'vendedor'@'localhost';
grant select, insert, update, delete on apex.movi_estoque to 'vendedor'@'localhost';
grant select on apex.produto to 'vendedor'@'localhost';
grant select on apex.fornecedor to 'vendedor'@'localhost';

-- tentei fazer assim, mas só dps lembrei q se vc da apex.* voce só pode fazer revoke on apex*, triste.
-- grant select, insert, update, delete on apex.* to 'vendedor'@'localhost';
-- revoke insert, update, delete on apex.produto from 'vendedor'@'localhost';
-- revoke insert, update, delete on apex.fornecedor from 'vendedor'@'localhost';

-- no slide ta show grants from, mas assim nao estava funcionando, dps de pesquisar deu que era for.
show grants for 'vendedor'@'localhost'; 

-- 24) Alterar estrutura de uma tabela (ALTER TABLE), Adiciona a coluna 'complemento' na tabela cliente colocando ela depois da coluna numero e renomeia 'situacao_pedido' para 'status_pedido' em venda
alter table cliente
add column complemento varchar(50) null after numero;
 
alter table venda
rename column situacao_pedido to status_pedido;

desc cliente;
-- o tab da desc venda fica bem embaixo do read only entao tem q clicar bem no cantinho no read only pra conseguir acessar, ou é só executar essa linha isoladamente.
desc venda;

