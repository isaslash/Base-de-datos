-- Creo el esquema inmobiliaria
create schema inmobiliaria;
use inmobiliaria; 

-- 1) primer paso creo la tabla sede provincial que engloba todas las inmobiliarias registradas en el pais

create table if not exists sedes_provinciales(
id_sedes_provinciales int auto_increment primary key,
nombre_provincia varchar(20) not null,
cantidad_de_inmo int,
Cantidad_de_propiedades int,
Cantidad_de_Alquileres int,
Promedio_ventas_mes decimal(10,2),
Promedio_Alquileres_mes decimal(10,2),
cantidad_habitantes varchar(20) not null
);

-- 2) segundo paso creo la segunda tabla que engloba los municipios donde se encuentran las inmobiliarias dentro de las provincias 

create table if not exists sedes_por_municipio(
id_sedes_municipales int auto_increment primary key,
nombre_de_municipio varchar(20),
cantidad_de_inmo int,
cantidad_de_propiedades int,
cantidad_de_alquileres int,
promedio_ventas_mes decimal(10,2),
promedio_alquileres_mes decimal(10,2),
cantidad_habitantes int,
id_sedes_provinciales int,
FOREIGN KEY (id_sedes_provinciales) REFERENCES sedes_provinciales(id_sedes_provinciales)
);

-- 3) tercer paso creo la tabla que englobara a las distintas sedes (inmobiliarias) que se encuentran en los municipios

create table if not exists sucursal(
id_sucursal int auto_increment primary key,
nombre_sede varchar(20),
calle_ubicacion varchar(20),
altura_calle int not null,
numero_telefonico int not null,
año_apertura int not null,
dias_en_servicio int not null,
dias_fuera_servicio int not null,
cantidad_empleados int,
id_sedes_municipales int,
foreign key (id_sedes_municipales) references sedes_por_municipio(id_sedes_municipales)
);

-- 4) cuarto paso ahora armo la tabla donde se identificara cada uno de los encargados de cada sede

create table if not exists encargado_sede(
id_encargado_sede int auto_increment primary key,
nombre_encargado varchar(20) not null,
apellido_encargado varchar(20) not null,
telefono int not null,
calle varchar(20),
altura varchar(20),
año_ingreso int not null,
años_antiguedad int not null,
id_sucursal int,
foreign key (id_sucursal) references sucursal(id_sucursal)
);

-- 5) quinto paso lo siguiente es armar la tabla donde se registran el numero de ventas ,alquileres y reservas pertenecientes al administrador de area (encargado de sede)

create table if not exists registro_ventas(
id_registro_ventas int auto_increment primary key,
cantidad_ventas int not null,
cantidad_alquileres int not null,
cantidad_reservas int not null,
dinero_ingresado_ventas int not null,
dinero_ingresado_alquileres int not null,
promedio_ventas decimal(10,2) not null,
promedio_alquileres decimal(10,2) not null,
egresos_reservas int not null,
id_encargado_sede int,
foreign key (id_encargado_sede) references encargado_sede(id_encargado_sede)
);

-- 6) sexto paso se crea la table que lleva los registros de gastos pertenecientes al administrador de area (encargado de sede)

create table if not exists gastos_sede(
id_gastos_sede int not null auto_increment primary key,
sueldo_encargado decimal(10,2) not null,
sueldo_empleado decimal(10,2) not null,
gasto_matricula decimal(10,2) not null,
gastos_impuesto_municipal decimal(10,2) not null,
gastos_servicios decimal(10,2) not null,
gastos_limpieza decimal (10,2) not null,
gastos_insumos decimal (10,2) not null,
id_encargado_sede int,
foreign key (id_encargado_sede) references encargado_sede(id_encargado_sede)
);

-- 7) septimo paso se crea la tabla empleados pertenecientes a la sede 

create table if not exists empleados_sede(
id_empleados_sede int auto_increment primary key,
nombre varchar(20),
telefono int,
calle varchar(20),
altura int,
promedio_ventas decimal(10,2),
promedio_alquileres decimal(10,2),
propiedades_tomadas int,
cantidad_ventas int,
id_sucursal int,
foreign key (id_sucursal) references sucursal(id_sucursal)
);

-- octavo paso y ultimo se crea la tabla donde ingresan las propiedades de la sede

create table if not exists propiedades(

id_propiedades int auto_increment primary key,
calle varchar(20),
altura int not null,
valor_venta int not null, 
valor_aquiler int not null,
ambientes int not null,
m2_totales decimal (10,2) not null,
años_antiguedad int not null,
toma_empleado varchar(20),
id_sucursal int,
foreign key (id_sucursal) references sucursal(id_sucursal)

);
