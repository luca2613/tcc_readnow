DROP DATABASE IF EXISTS readnow;
CREATE DATABASE IF NOT EXISTS readnow;
USE readnow;

CREATE TABLE IF NOT EXISTS tipo_usuario
(
cd_tipo_usuario int not null auto_increment,
nm_tipo_usuario varchar(20) not null,
CONSTRAINT pk_tipo_usuario PRIMARY KEY(cd_tipo_usuario)
);

CREATE TABLE IF NOT EXISTS usuario
(
cd_usuario int not null auto_increment,
cd_tipo_usuario int not null,
nm_usuario varchar (80) not null,
nm_senha_usuario varchar(80) not null,
nm_email_usuario varchar(150) not null,
--  verkey
CONSTRAINT pk_usuario PRIMARY KEY(cd_usuario),
CONSTRAINT fk_usuario_tipo_usuario FOREIGN KEY usuario(cd_tipo_usuario) REFERENCES tipo_usuario(cd_tipo_usuario)
);

CREATE TABLE IF NOT EXISTS autor
(
cd_autor int not null auto_increment,
cd_tipo_usuario int not null,
nm_autor varchar (80) not null,
ds_autor text,
nm_senha_autor varchar(80) not null,
nm_email_autor varchar(150) not null,
cd_img_autor longtext,
CONSTRAINT pk_autor PRIMARY KEY(cd_autor),
CONSTRAINT fk_autor_tipo_usuario FOREIGN KEY autor(cd_tipo_usuario) REFERENCES tipo_usuario(cd_tipo_usuario)
);

CREATE TABLE IF NOT EXISTS categoria 
(
cd_categoria int not null auto_increment,
nm_categoria varchar(80) not null,
CONSTRAINT pk_categoria PRIMARY KEY(cd_categoria)
);

CREATE TABLE IF NOT EXISTS livro
(
cd_livro int not null auto_increment,
cd_categoria int not null,
cd_autor int not null,
nm_livro varchar(150) not null,
ds_livro text not null,
dt_lancamento date not null,
vl_livro decimal(10,2),
cd_img_livro longtext not null,
CONSTRAINT pk_livro PRIMARY KEY(cd_livro),
CONSTRAINT fk_livro_autor FOREIGN KEY livro(cd_autor) REFERENCES autor(cd_autor),
CONSTRAINT fk_livro_categoria FOREIGN KEY livro(cd_categoria) REFERENCES categoria(cd_categoria)
);





CREATE TABLE IF NOT EXISTS favorito
(
cd_favorito int not null auto_increment,
cd_livro int not null,
cd_usuario int not null,
CONSTRAINT pk_favorito PRIMARY KEY(cd_favorito),
CONSTRAINT fk_favorito_livro FOREIGN KEY favorito(cd_livro) REFERENCES livro(cd_livro),
CONSTRAINT fk_favorito_usuario FOREIGN KEY favorito(cd_usuario) REFERENCES usuario(cd_usuario)
);

INSERT INTO CATEGORIA VALUES 
(DEFAULT, "A????o"),
(DEFAULT, "Aventura"),
(DEFAULT, "Fantasia"),
(DEFAULT, "Fic????o"),
(DEFAULT, "Romance"),
(DEFAULT, "Suspense"),
(DEFAULT, "Terror");

insert into tipo_usuario values
(default, 'adm'),
(default, 'autor'),
(default, 'cliente');

insert into autor values
(default,2,'autor1','autor 1, nascido em tal',md5('123'),'autor@gmail.com', 'imgAutor1.jpg');

insert into usuario values
(default,3,'usuario', md5('123'),'usuario@gmail.com');

insert into autor values
(default,2,'autor2','autor 1, nascido em tal',md5('123'),'autor2@gmail.com', 'img');

insert into livro values
(default, 1, 1, "Harry Potter e o prisioneiro de azkaban", "O PHP est?? passando por um renascimento, embora possa ser dif??cil perceber, com tantos tutoriais PHP online desatualizados. Com este guia pr??tico, voc?? ver?? como o PHP se tornou uma linguagem cheia de recursos e madura, orientada a objetos, com namespaces e uma cole????o crescente de bibliotecas de componentes reutiliz??veis.

O autor Josh Lockhart ??? criador do PHP The Right Way, uma iniciativa popular para incentivar as melhores pr??ticas associadas ao PHP ??? mostra os recursos dessa nova linguagem em a????o. Voc?? conhecer?? as melhores pr??ticas para a arquitetura e o planejamento de aplica????es, bancos de dados, seguran??a, testes, debugging e implanta????o. Se tiver uma compreens??o b??sica de PHP e quiser aperfei??oar suas habilidades, este livro foi escrito para voc??.", '2022-09-30',10.90,'livro1.jpg');

insert into livro values
(default,2,  2, "Jogos Vorazes", "ivro harry potter...", '2022-09-29',10.90,'livro2.jpg');

insert into livro values
(default,3, 2, "Anne de Green Gables", "ivro harry potter...", '2022-09-23',10.90,'livro3.jpg');

insert into livro values
(default,4, 1, "O labirinto do fauno", "ivro harry potter...", '2022-09-22',10.90,'livro4.jpg');

insert into livro values
(default,4, 1, "autor 1", "pao de que", '2022-09-22',10.90,'livro4.jpg');

insert into livro(cd_livro,cd_categoria,cd_autor,nm_livro,ds_livro,dt_lancamento,cd_img_livro) values
(default,4, 1, "O labirinto do fauno2", "ivro harry potter...2", '2022-09-12','livro4.jpg');

select * from livro;





