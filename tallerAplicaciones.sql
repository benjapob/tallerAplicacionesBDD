create database proyectoInventario;
use proyectoInventario;

create table producto (
	idProducto int not null auto_increment,
    nombreProducto varchar(50),
    descripcionProducto varchar(200),
    autorProducto varchar(100),
    idEditorial int not null,
    idCategoria int not null,
    primary key (idProducto)
);

create table categoria(
    idCategoria int not null auto_increment,
    nombreCategoria varchar(50),
    primary key (idCategoria)
);

create table editorial(
    idEditorial int not null auto_increment,
    nombreEditorial varchar(50),
    primary key (idEditorial)
);

create table rol(
    idRol int not null auto_increment,
    nombreRol varchar(50),
    primary key (idRol)
);

create table tipo_movimiento(
    idTipo int not null auto_increment,
    nombreTipo varchar(50),
    primary key (idTipo)
);

create table detalle_movimiento(
    idDetalle int not null auto_increment,
    cantidadProducto int,
    idProducto int not null,
    idRegistro int not null,
    primary key (idDetalle)
);

create table trabajador(
    idTrabajador int not null auto_increment,
    nombreTrabajador varchar(50),
    apellidoTrabajador varchar(50),
    rutTrabajador varchar(10) not null unique,
    correo varchar(100) not null,
    contraseña varchar(100) not null,
    idRol int not null,
    primary key (idTrabajador)
);

create table registro_movimiento(
    idRegistro int not null auto_increment,
    fechaCreacion date,
    idTipo int not null,
    idBodega int not null,
    idTrabajador int not null,
    primary key (idRegistro)
);

create table bodega(
    idBodega int not null auto_increment,
    capacidadBodega int,
    numBodega int,
    idTrabajador int not null,
    primary key (idBodega)
);

alter table producto add constraint fkProducto1 foreign key (IdEditorial)
references editorial (idEditorial) on delete restrict on update restrict;

alter table producto add constraint fkProducto2 foreign key (idCategoria)
references categoria (idCategoria) on delete restrict on update restrict;

alter table detalle_movimiento add constraint fkDetalle1 foreign key (idProducto)
references producto (idProducto) on delete restrict on update restrict;

alter table detalle_movimiento add constraint fkDetalle2 foreign key (idRegistro)
references registro_movimiento (idRegistro) on delete restrict on update restrict;

alter table registro_movimiento add constraint fkRegistro1 foreign key (idTipo)
references tipo_movimiento (idTipo) on delete restrict on update restrict;

alter table registro_movimiento add constraint fkRegistro2 foreign key (idBodega)
references bodega (idBodega) on delete restrict on update restrict;

alter table registro_movimiento add constraint fkRegistro3 foreign key (idTrabajador)
references trabajador (idTrabajador) on delete restrict on update restrict;

alter table trabajador add constraint fkTrabajador1 foreign key (idRol)
references rol (idRol) on delete restrict on update restrict;

alter table bodega add constraint fkBodega1 foreign key (idTrabajador)
references trabajador (idTrabajador) on delete restrict on update restrict;

insert into rol values (null, 'ADMINISTRADOR');
insert into rol values (null, 'JEFE DE BODEGA');
insert into rol values (null, 'BODEGUERO');

INSERT INTO `categoria` VALUES (null,'LIBRO');
INSERT INTO `categoria` VALUES (null,'REVISTA');
INSERT INTO `categoria` VALUES (null,'ENCICLOPEDIA');

insert into trabajador values (null, 'BENJAMIN', 'POBLETE', '1-1', 'CORREO@CORREO.COM', '81DC9BDB52D04DC20036DBD8313ED055', 1);
insert into trabajador values (null, 'JUAN', 'SOTO', '1-2', 'CORREO2@CORREO.COM', '81DC9BDB52D04DC20036DBD8313ED055', 2);
insert into trabajador values (null, 'JOSE', 'SOTO', '1-3', 'CORREO3@CORREO.COM', '81DC9BDB52D04DC20036DBD8313ED055', 3);
