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

create table Itens_inventario (
iditem int,
fkinventario int,
fkitem int,
constraint fkitem foreign key (fkitem) references estoque_itens(iditem),
constraint pkcomposta primary key (iditem, fkinventario, fkitem),
constraint fkinventario foreign key (fkinventario) references
inventario(fkusuario)
);


create table baus_inventario(
idbau int,
fkbau int,
fkinventario int,
constraint pkcomposta primary key (idbau, fkinventario, fkbau),
constraint fkbau foreign key (fkbau) references loja_baus(idbau),
constraint fkinventario_baus foreign key (fkinventario) references inventario(fkusuario),
nome varchar(45)
);

create table Quiz(
id int primary key auto_increment,
genero varchar(45)
);

create table Perguntas(
idPergunta int,
fkQuiz int,
constraint pk_perguntas primary key(idPergunta, fkQuiz),
constraint fkQuiz_Perguntas foreign key (fkQuiz) references Quiz(id),
Pergunta TEXT,
Resposta_correta TEXT,
Resposta_falsa TEXT
);

create table Resposta_usuario(
id int,
fkusuario int,
fkpergunta int,
fkquiz int,
constraint pk_resposta_usuario primary key(id, fkusuario, fkpergunta, fkquiz),
constraint fk_usuario_resposta_usuario foreign key(fkusuario) references Usuario(id),
constraint fk_pergunta_resposta_usuario foreign key(fkpergunta) references Perguntas(idPergunta),
constraint fk_quiz_resposta_usuario foreign key(fkquiz) references Quiz(id),
resposta_correta char(3),
constraint resposta_correta_usuario check (resposta_correta in ('Sim', 'Nao'))
);


create table loja_baus(
idBau int primary key auto_increment,
preco int,
nome varchar(45),
porcent_comum int,
porcent_incomum int,
porcent_raro int,
porcent_epico int,
porcent_lendario int
);

create table estoque_itens(
iditem int primary key auto_increment,
nome varchar(45),
raridade varchar(45),
preco int
);

create table url_img_itens(
fkitem int primary key,
constraint fkitem_url_img foreign key(fkitem) references estoque_itens(iditem),
url text
);

insert into loja_baus (preco, nome, porcent_comum, porcent_incomum, porcent_raro, porcent_epico, porcent_lendario) values
(10, 'Baú Comum', 60, 25, 10, 4, 1),
(50, 'Baú Raro', 25, 25, 35, 10, 5),
(100, 'Baú Lendário', 10, 10, 35, 25, 20); 

insert into estoque_itens (iditem, nome, raridade, preco) values
(1,'Winters Approach', 'lendário', 2600),
(2,'Steraks Gage', 'lendário', 3100),
(3,'Seraphs Embrace', 'lendário', 3200),
(4,'Liandrys Anguish', 'lendário', 3200),
(5,'Guinsoos Rageblade', 'lendário', 2600),
(6,'Infinity Edge', 'lendário', 3400),
(7,'Stormrazor', 'lendário', 3000),
(8,'Blade of the Ruined King', 'lendário', 3300),
(9,'Zhonyas Hourglass', 'lendário', 2600),
(10,'Trinity Force', 'lendário', 3333),
(11,'Hextech Alternator', 'épico', 1050),
(12,'Seekers Armguard', 'épico', 1000),
(13,'Oblivion Orb', 'épico', 800),
(14,'Vampiric Scepter', 'épico', 900),
(15,'Verdant Barrier', 'épico', 1100),
(16,'Tiamat', 'raro', 600),
(17,'Punhal Serrilhado', 'raro', 560),
(18,'Cajado do Vazio', 'raro', 670),
(19,'Armadura de Espinhos', 'raro', 700),
(20,'Anjo Guardião', 'raro', 570),
(21,'Arco Recurvo', 'incomum', 300),
(22,'Armadura de Pano', 'incomum', 300),
(23,'Cristal de Rubi', 'incomum', 400),
(24,'Capa de Agilidade', 'incomum', 400),
(25,'Hexdrinker', 'incomum', 350),
(26,'Tomo Amplificador', 'comum', 135),
(27,'Espada Longa', 'comum', 150),
(28,'Poção de Vida', 'comum', 50),
(29,'Anel de Doran', 'comum', 100),
(30,'Escudo de Doran', 'comum', 150);

insert into url_img_itens values
(1,'"./assets/img-icons/lol-icons/Winters_Approach_item_HD.webp"'),
(2,'"./assets/img-icons/lol-icons/Steraks_Gage_item_HD.webp"'),
(3,'"./assets/img-icons/lol-icons/Seraphs_Embrace_item_HD.webp"'),
(4,'"./assets/img-icons/lol-icons/Liandrys_Torment_item.webp"'),
(5,'"./assets/img-icons/lol-icons/Guinsoos_Rageblade_item_HD.webp"'),
(6,'"./assets/img-icons/lol-icons/Infinity_Edge_item_HD.webp"'),
(7,'"./assets/img-icons/lol-icons/Stormrazor_item_HD.webp"'),
(8,'"./assets/img-icons/lol-icons/Blade_of_the_Ruined_King_item_HD.webp"'),
(9,'"./assets/img-icons/lol-icons/Zhonyas_Hourglass_item_HD.webp"'),
(10,'"./assets/img-icons/lol-icons/Trinity_Force_item_HD.webp"'),
(11,'"./assets/img-icons/lol-icons/Hextech_Alternator_item_HD.webp"'),
(12,'"./assets/img-icons/lol-icons/Seekers_Armguard_item_HD.webp"'),
(13,'"./assets/img-icons/lol-icons/Oblivion_Orb_item_HD.webp"'),
(14,'"./assets/img-icons/lol-icons/Vampiric_Scepter_item.webp"'),
(15,'"./assets/img-icons/lol-icons/Verdant_Barrier_item_HD.webp"'),
(16,'"./assets/img-icons/lol-icons/Tiamat_item_HD.webp"'),
(17,'"./assets/img-icons/lol-icons/Serrated_Dirk_item_HD.webp"'),
(18,'"./assets/img-icons/lol-icons/Void_Staff_item_HD.webp"'),
(19,'"./assets/img-icons/lol-icons/Thornmail_item_HD.webp"'),
(20,'"./assets/img-icons/lol-icons/Guardian_Angel_item_HD.webp"'),
(21,'"./assets/img-icons/lol-icons/Recurve_Bow_item.webp"'),
(22,'"./assets/img-icons/lol-icons/Cloth_Armor_item_HD.webp"'),
(23,'"./assets/img-icons/lol-icons/Ruby_Crystal_item_HD.webp"'),
(24,'"./assets/img-icons/lol-icons/Cloak_of_Agility_item_HD.webp"'),
(25,'"./assets/img-icons/lol-icons/Hexdrinker_item_HD.webp"'),
(26,'"./assets/img-icons/lol-icons/Amplifying_Tome_item_HD.webp"'),
(27,'"./assets/img-icons/lol-icons/Long_Sword_item_HD.webp"'),
(28,'"./assets/img-icons/lol-icons/Health_Potion_item_HD.webp"'),
(29,'"./assets/img-icons/lol-icons/Dorans_Ring_item_HD.webp"'),
(30,'"./assets/img-icons/lol-icons/Dorans_Shield_item.webp"');



select * from estoque_itens left join url_img_itens on fkitem = iditem;
select * from baus_inventario where fkinventario = 10;
select * from inventario where fkusuario = 10;




