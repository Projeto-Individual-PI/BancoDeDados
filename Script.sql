create database Projeto_Pessoal_Pi;
use Projeto_Pessoal_Pi;

create table Usuario (
id int primary key auto_increment,
usuario varchar(45),
email varchar(105),
senha varchar(105)
);

create table Inventario (
fkusuario int primary key,
constraint fkusuario foreign key (fkusuario) 
references Usuario(id),
creditos int
);

create table Itens (
iditem int,
fkinventario int,
constraint pkcomposta primary key (iditem, fkinventario),
constraint fkinventario foreign key (fkinventario) references
inventario(fkusuario),
nome varchar(45),
raridade varchar(45)
);
