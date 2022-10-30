DROP DATABASE IF EXISTS readnow;
CREATE DATABASE IF NOT EXISTS readnow;
USE readnow;

CREATE TABLE IF NOT EXISTS usuario
(
cd_usuario int not null auto_increment,
cd_tipo_usuario ENUM('admin','user1','user2'),
-- nm_usuario varchar (80) not null,
nm_senha_usuario varchar(80) not null,
nm_email_usuario varchar(150) not null,
verkey varchar(255),
CONSTRAINT pk_usuario PRIMARY KEY(cd_usuario)
);


insert into usuario(cd_tipo_usuario,nm_senha_usuario,nm_email_usuario)
    value ('admin','123','fulano@gmail.com');
    