create	database turismo
use turismo
create table usuario(
id_usuario int primary key,
nomb_usuario varchar (100),
edad_usuario tinyint,
gener_usuario varchar (20),
telefon_usuario bigint,
correo_usuario varchar (100),
lugar_residenc varchar (100),
id_viaje varchar(12),
constraint apodo foreign key(id_viaje)
references viaje(id_viaje))
select*from usuario
insert into usuario values(123,'mario',33,'masculino',12345,'mario@gmail.com','bello',4567)
insert into usuario values(224,'maria',22,'femenino',12345,'maria@gmail.com','medellin',3458)
insert into usuario values(778,'daniel',23,'masculino',12345,'daniel@gmail.com','bogota',8986)
insert into usuario values (8303,'laura',31,'femenino',12345,'laura@gmail.com','sabaneta',987)

create table guia (
id_guia varchar (12) primary key,
nomb_guia varchar (100),
gener_guia varchar (20),
correo_guia varchar (100))
select*from guia
insert into guia values(1234,'Juan Camino','masculino','juanca23@gmail.com')
insert into guia values(5678,'Camila','femenino','camilao@gmail.com')
insert into guia values(9101,'Pamela','femenino','pamepi@gmail.com')
insert into guia values(3874,'Harold','masculino','haroldbqgmail.com')

create table transporte (
id_transpor varchar (12) primary key,
tipo_transporte varchar (100),
num_acompañante int,
num_ticket int)
select*from transporte
insert into transporte values(345,'carro',3,890)
insert into transporte values(567,'moto',6,780)
insert into transporte values(789,'avion',2,876)
insert into transporte values(890,'tren',4,765)

create table viaje (
id_viaje varchar (12) primary key,
destino_viaje varchar (100),
numero_itenerario int,
fecha_inicio date,
fecha_final date,
motivo_viaje varchar (100))
select*from viaje
select*from usuario
insert into viaje values(4567,'guatape',2,'2024-9-11','2025-2-11','vacaciones')
insert into viaje values(3458,'jardin',2,'2024-10-11','2025-4-11','trabajo')
insert into viaje values(8986,'betania',2,'2024-11-11','2025-5-11','luna de miel')
insert into viaje values(0987,'san rafael',2,'2024-12-11','2025-6-11','fiesta')


create table hospedaje (
id_hotel varchar (12) primary key,
nomb_hotel varchar (100),
ubi_hotel varchar (100),
num_hotel smallint,
correo_hotel varchar (100),
checking varchar (10),
checkout varchar (10))
select*from hospedaje
insert into hospedaje values(4578,'la carmona','guatape',32,'lacarmo9@gmail.com',67539,301582)
insert into hospedaje values(9875,'el catillo','jardin',31,'castll@gmail.com',09075,78953)
insert into hospedaje values(7809,'la penca','betania',30,'lapenca@gmail.com',07235,77798)
insert into hospedaje values(1001,'el paraiso','San rafael',01800,'elparay@gmail.com',57890,08434)

create table tour (
id_tour varchar (12) primary key,
destinoelegidos varchar (100),
alimentacion_tour varchar (100))
select*from tour
insert into tour values (56784,'guatape','desayuno')
insert into tour values (78960,'san rafael','almuerzo')
insert into tour values (23464,' bello', 'comida')
insert into tour values (3456,'medellin','merienda')


create table usuario_guia(
id_guia varchar(12),
id_usuario int,
constraint apodo1 foreign key(id_guia)references guia(id_guia),
constraint apodo2 foreign key(id_usuario)references usuario(id_usuario))
select*from usuario
select*from guia
select*from usuario_guia 
insert into usuario_guia values(1234,123)
insert into usuario_guia values(3874,224)
insert into usuario_guia values(5678,778)
insert into usuario_guia values (9101,8303)


create table usuario_transporte(
id_usuario int,
id_transpor varchar(12),
constraint apodo3 foreign key(id_usuario)references usuario(id_usuario),
constraint apodo4 foreign key(id_transpor)references transporte(id_transpor))
select*from usuario
select*from transporte
select*from usuario_transporte 
insert into usuario_transporte values(123,345)
insert into usuario_transporte values(224,789)
insert into usuario_transporte values(778,567)
insert into usuario_transporte values(8303,890)

create table usuario_hospedaje(
id_usuario int,
id_hotel varchar(12),
constraint apodo5 foreign key(id_usuario)references usuario(id_usuario),
constraint apodo6 foreign key (id_hotel)references hospedaje(id_hotel))
select*from usuario
select*from hospedaje
select*from usuario_hospedaje
insert into usuario_hospedaje values(123,1001)
insert into usuario_hospedaje values(224,4578)
insert into usuario_hospedaje values(778,7809)
insert into usuario_hospedaje values(8303,9875)


create table usuario_tour(
id_usuario int,
id_tour varchar(12),
constraint apodo7 foreign key(id_usuario)references usuario(id_usuario),
constraint apodo8 foreign key (id_tour)references tour(id_tour))
select*from usuario
select*from tour
select*from usuario_tour
insert into usuario_tour values(123,23464)
insert into usuario_tour values(224,3456)
insert into usuario_tour values(778,56784)
insert into usuario_tour values(8303,78960)


--MALAS PRÁCTICAS--
use turismo
--se requiere cambiar  el dato de destino  con el nombre jardín
update viaje set destino_viaje='san francisco' where id_viaje =3458
update viaje set destino_viaje='el retiro' where id_viaje =987

--se requiere eliminar el registro 4578 de la tabla hospedaje
delete from hospedaje where id_hotel=4578
delete from hospedaje where id_hotel=7809
select*from hospedaje

-- se requiere adicionar un campo en la tabla tour que se llame transportetour
alter table tour add transportetour varchar(100)
alter table tour add duracion varchar(100)

-- se requiere renombrar el campo num_acompañante por acompañantes
execute sp_rename 'transporte.num_acompañante','acompañantes','column'
execute sp_rename 'transporte.num_ticket','ticket','column'

 --se requiere elinimar el campo gener_guia de la tabla guia
alter table guia drop column  gener_guia

--se requiere renombrar la tabla transporte por transportes
exec sp_rename 'transporte','transportes'

--se requiere eliminar la tabla tour
--drop table tour

--INNER JOIN--
-- se requiere saber en que hotel se encuentra registrado los usuarios
SELECT hospedaje.nomb_hotel, usuario.nomb_usuario from hospedaje
inner join usuario_hospedaje on hospedaje.id_hotel = usuario_hospedaje.id_hotel
inner join usuario on usuario_hospedaje.id_usuario= usuario.id_usuario

--se requiere saber que usuario irá a Jardín- Antioquia
select nomb_usuario, destino_viaje from viaje
inner join usuario on viaje.id_viaje=usuario.id_viaje where destino_viaje='jardin'

--se requiere saber que usuario utilza avion para transportarse
select usuario.nomb_usuario, transporte.tipo_transporte from usuario
inner join usuario_transporte on usuario.id_usuario=usuario_transporte.id_usuario
inner join transporte on usuario_transporte.id_transpor=transporte.id_transpor where tipo_transporte='avion'

-- se requiere saber el nombre del guía que le correspondío a cada usuario
select usuario.nomb_usuario, guia.nomb_guia from usuario
inner join usuario_guia on usuario.id_usuario=usuario_guia.id_usuario
inner join guia on usuario_guia.id_guia=guia.id_guia

--se requiere saber que usuario almorzo en nuestro tour
select usuario.nomb_usuario, tour.alimentacion_tour from usuario
inner join usuario_tour on usuario.id_usuario= usuario_tour.id_usuario
inner join tour on usuario_tour.id_tour=tour.id_tour where alimentacion_tour='almuerzo'

--PROCEDIMIENTOS ALMACENADOS--
-- vamos a crear un procedimiento para insertar registros en la tabla carrera
select*from usuario
create proc insertar_usuario
@idusuario int,
@nombreusuario varchar(100),
@edadusuario tinyint,
@generousuario varchar(20),
@telefonousuario bigint,
@correusuario varchar(100),
@lugaresidencia varchar(100),
@idviaje int
as 
insert into usuario(id_usuario, nomb_usuario,edad_usuario, gener_usuario,telefon_usuario,correo_usuario, lugar_residenc, id_viaje)
values(@idusuario, @nombreusuario, @edadusuario, @generousuario, @telefonousuario, @correusuario, @lugaresidencia, @idviaje)
select*from usuario
--inserción de registro a manera de codigo vivo
EXEC insertar_usuario 1233, 'francisco', 33, 'masculino',3456767,'fran@gmail.com','medellin',987
--se requiere crear un procedimiento almancenado que modifique datos en la tabla tour
select*from usuario
create procedure modificar_tour
@id_tour int,
@destinos varchar(100),
@alimentacion varchar (100)
as
update tour set destinoelegidos=@destinos, alimentacion_tour=@alimentacion where id_tour=@id_tour
 select*from tour

--se requiere realizar una consulta de un registro especifico en la tabla usuario
create proc consultarusuario
@id_usuario int
as 
select*from usuario where id_usuario=@id_usuario
--se requiere crear un procedimiento almacenado donde elimine un registro especifico
create proc eliminardato
@nombrecborrar varchar(50)
as
delete from usuario where nomb_usuario=@nombrecborrar
--se require crear un procedimiento almacenado donde se consulte el total d usuarios
create procedure consultarusuarios
@total_usuarios int 
as
select @total_usuarios=count(@total_usuarios)from usuario

--procedimientos almacenados utilizando exec--
-- se requiere hacer un procedimiento que muestre los usuarios 
CREATE PROCEDURE MostrarUsuarios
AS BEGIN SELECT * FROM usuario; 
END;
EXEC MostrarUsuarios;
--se quiere mostar el el hotel en el que se queda cada usuario
CREATE PROCEDURE MostrarHotelDelUsuario
AS
BEGIN SELECT u.id_usuario, u.nomb_usuario, h.nomb_hotel, h.ubi_hotel FROM usuario u
JOIN usuario_hospedaje uh ON u.id_usuario = uh.id_usuario
JOIN hospedaje h ON uh.id_hotel = h.id_hotel;
END;
EXEC MostrarHotelDelUsuario;
--se requiere ver el tour de un usuario en especifico
CREATE PROCEDURE MostrartourdeunUsuario(@id_usuario_buscar INT)
AS
BEGIN SELECT u.id_usuario, u.nomb_usuario, t.destinoelegidos AS tour
FROM usuario u JOIN usuario_tour uh ON u.id_usuario = uh.id_usuario
JOIN tour t ON uh.id_tour = t.id_tour WHERE u.id_usuario = @id_usuario_buscar;
END;
	
