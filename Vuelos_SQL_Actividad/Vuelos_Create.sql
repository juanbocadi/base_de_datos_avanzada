--PONER EN USO LA BD
use vuelos
--CREAR LAS ENTIDADES
create table localidades(
cp int primary key,
localidad nvarchar(60))

create table pasajeros(
id_pasajero int primary key,
dni nvarchar(10),
nombre nvarchar(60),
apellido nvarchar(60),
mail nvarchar(100),
telefono nvarchar(60),
domicilio nvarchar(60),
cp int foreign key references localidades(cp)) 

create table propietarios(
id_propietario int primary key,
cuit nvarchar(11),
razon_social nvarchar(60),
cp int references localidades(cp))

create table aviones(
id_avion int primary key,
id_propietario int references propietarios(id_propietario),
cantidad int,
tipo nvarchar(60),
modelo int)

create table vuelos(
id_vuelo int primary key,
origen nvarchar(60),
destino nvarchar(60),
km int,
fecha date,
hora_0 nvarchar(5),
hora_1 nvarchar(5),
id_avion int references aviones(id_avion))

create table vuelos_pasajeros(
id_vuelo int references vuelos(id_vuelo),
id_pasajero int references pasajeros(id_pasajero)
primary key(id_vuelo,id_pasajero))
