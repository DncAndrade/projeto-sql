create database empresa;
use empresa;

----- // ---- / / --- / / ----

# Criando tabela clientes
create table clientes (
id_cliente int primary key,
nome varchar(40) not null,
estado varchar(40)
);

# Criando tabela pedidos 
create table pedidos (
id_pedido int primary key,
id_cliente int, 
valor_pedido decimal(10,2),
data_pedido date,

# Regra chave estrangeira
foreign key (id_cliente) references clientes(id_cliente)
);

# Adicionando valores as tabelas
insert into clientes (id_cliente, nome, estado) values
(1, 'Ana Silva', 'SP'),
(2, 'Bruno Costa', 'RJ'),
(3, 'Carlos Lima', 'SP');

insert into pedidos (id_pedido, id_cliente, valor_pedido, data_pedido) values
(101, 1, 150.00, '2026-05-01'),
(102, 1, 300.00, '2026-05-15'),
(103, 2, 80.00, '2026-05-16');

-- // ---- / / ----
# Selects:

select nome from clientes 
where estado = 'SP';

select nome, id_pedido, valor_pedido from clientes inner join pedidos on clientes.id_cliente = pedidos.id_cliente;

select 
nome, sum(valor_pedido) from clientes join pedidos on clientes.id_cliente = pedidos.id_cliente
group by nome;

