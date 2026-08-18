create database exercicio17;
use exercicio17;

create table adulto (
	id int auto_increment,
    nome varchar(50) not null,
    data_nascimento date not null,
    sexo varchar(1) not null,
    estado_civil varchar(20),
    primary key (id)
    );
    
create table bebe(
	id int auto_increment,
    nome varchar(50) not null,
    id_adulto int not null,
    primary key (id),
    foreign key (id_adulto) references adulto(id)
    );
    
    insert into adulto(nome, data_nascimento, sexo, estado_civil)
    values ('pedro','1999-12-20','m','solteiro'),('amora','1980-10-12','f','casado'),('alex','2001-1-02','m','casado'),('lucas', '1995-05-15', 'm', 'solteiro'),('beatriz', '1992-08-24', 'f', 'casado'),('marcos', '1988-11-30', 'm', 'divorciado'),('julia', '2003-02-10', 'f', 'solteiro'),('gabriel', '1975-07-04', 'm', 'casado'),('larissa', '1990-12-12', 'f', 'solteiro'),('thiago', '1982-03-21', 'm', 'viúvo');
    
    insert into bebe ( nome, id_adulto)
    values ('pedrosa','2'),('joao','3'),('livia','3'),('ricardo', '4'),('marina', '5'),('vitor', '6'),('elisa', '7'),('caio', '8');
    
    select * from adulto
    where estado_civil = 'solteiro';
    
    select * from adulto
    where sexo = 'f';
    
    select * from bebe
    where id % 2 != 0 and id_adulto % 2 != 0;
    
   select * from adulto
   inner join bebe on adulto.id = bebe.id_adulto;
   
   select adulto.nome, bebe.nome from adulto
   inner join bebe on adulto.id = bebe.id_adulto;
   
   select adulto.nome, adulto.estado_civil , bebe.nome from adulto
   left join bebe on adulto.id = bebe.id_adulto;