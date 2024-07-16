-- Crear la base de datos si aún no existe
CREATE DATABASE IF NOT EXISTS inmobiliaria;

-- Usar la base de datos inmobiliaria
USE inmobiliaria;

-- Tabla que engloba todas las inmobiliarias registradas en el país por provincia
CREATE TABLE IF NOT EXISTS sedes_provinciales (
    id_sedes_provinciales INT PRIMARY KEY AUTO_INCREMENT,
    nombre_provincia VARCHAR(20) NOT NULL,
    cantidad_de_inmo INT,
    Cantidad_de_propiedades INT,
    Cantidad_de_Alquileres INT,
    Promedio_ventas_mes DECIMAL(10,2),
    Promedio_Alquileres_mes DECIMAL(10,2),
    cantidad_habitantes VARCHAR(20) NOT NULL
);

-- Tabla que engloba los municipios donde se encuentran las inmobiliarias dentro de las provincias
CREATE TABLE IF NOT EXISTS sedes_por_municipio (
    id_sedes_municipales INT PRIMARY KEY AUTO_INCREMENT,
    nombre_de_municipio VARCHAR(20),
    cantidad_de_inmo INT,
    cantidad_de_propiedades INT,
    cantidad_de_alquileres INT,
    promedio_ventas_mes DECIMAL(10,2),
    promedio_alquileres_mes DECIMAL(10,2),
    cantidad_habitantes INT,
    id_sedes_provinciales INT,
    FOREIGN KEY (id_sedes_provinciales) REFERENCES sedes_provinciales(id_sedes_provinciales)
);

-- Tabla que registra las sedes (inmobiliarias) en los municipios
CREATE TABLE IF NOT EXISTS sucursal (
    id_sucursal INT AUTO_INCREMENT PRIMARY KEY,
    nombre_sede VARCHAR(20),
    calle_ubicacion VARCHAR(20),
    altura_calle INT NOT NULL,
    numero_telefonico INT NOT NULL,
    año_apertura INT NOT NULL,
    dias_en_servicio INT NOT NULL,
    dias_fuera_servicio INT NOT NULL,
    cantidad_empleados INT,
    id_sedes_municipales INT,
    FOREIGN KEY (id_sedes_municipales) REFERENCES sedes_por_municipio(id_sedes_municipales)
);

-- Tabla que identifica a los encargados de cada sede
CREATE TABLE IF NOT EXISTS encargado_sede (
    id_encargado_sede INT AUTO_INCREMENT PRIMARY KEY,
    nombre_encargado VARCHAR(20) NOT NULL,
    apellido_encargado VARCHAR(20) NOT NULL,
    telefono INT,
    calle VARCHAR(20),
    altura VARCHAR(20),
    año_ingreso INT NOT NULL,
    años_antiguedad INT NOT NULL,
    id_sucursal INT,
    FOREIGN KEY (id_sucursal) REFERENCES sucursal(id_sucursal)
);

-- Tabla que registra el número de ventas, alquileres y reservas por encargado de sede
CREATE TABLE IF NOT EXISTS registro_ventas (
    id_registro_ventas INT AUTO_INCREMENT PRIMARY KEY,
    cantidad_ventas INT NOT NULL,
    cantidad_alquileres INT NOT NULL,
    cantidad_reservas INT NOT NULL,
    dinero_ingresado_ventas INT NOT NULL,
    dinero_ingresado_alquileres INT NOT NULL,
    promedio_ventas DECIMAL(10,2) NOT NULL,
    promedio_alquileres DECIMAL(10,2) NOT NULL,
    egresos_reservas INT NOT NULL,
    id_encargado_sede INT,
    FOREIGN KEY (id_encargado_sede) REFERENCES encargado_sede(id_encargado_sede)
);

-- Tabla que registra los gastos por sede (encargado de sede)
CREATE TABLE IF NOT EXISTS gastos_sede (
    id_gastos_sede INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    sueldo_encargado DECIMAL(10,2) NOT NULL,
    sueldo_empleado DECIMAL(10,2) NOT NULL,
    gasto_matricula DECIMAL(10,2) NOT NULL,
    gastos_impuesto_municipal DECIMAL(10,2) NOT NULL,
    gastos_servicios DECIMAL(10,2) NOT NULL,
    gastos_limpieza DECIMAL(10,2) NOT NULL,
    gastos_insumos DECIMAL(10,2) NOT NULL,
    id_encargado_sede INT,
    FOREIGN KEY (id_encargado_sede) REFERENCES encargado_sede(id_encargado_sede)
);

-- Tabla que registra a los empleados de cada sede
CREATE TABLE IF NOT EXISTS empleados_sede (
    id_empleados_sede INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(20),
    telefono INT,
    calle VARCHAR(20),
    altura INT,
    promedio_ventas DECIMAL(10,2),
    promedio_alquileres DECIMAL(10,2),
    propiedades_tomadas INT,
    cantidad_ventas INT,
    id_sucursal INT,
    id_gastos_sede INT,
    FOREIGN KEY (id_gastos_sede) REFERENCES gastos_sede(id_gastos_sede),
    FOREIGN KEY (id_sucursal) REFERENCES sucursal(id_sucursal)
);

-- Tabla que registra las propiedades de cada sede
CREATE TABLE IF NOT EXISTS propiedades (
    id_propiedades INT AUTO_INCREMENT PRIMARY KEY,
    calle VARCHAR(20),
    altura INT NOT NULL,
    valor_venta INT NOT NULL, 
    valor_aquiler INT NOT NULL,
    ambientes INT NOT NULL,
    m2_totales DECIMAL(10,2) NOT NULL,
    años_antiguedad INT NOT NULL,
    toma_empleado VARCHAR(20),
    id_sucursal INT,
    FOREIGN KEY (id_sucursal) REFERENCES sucursal(id_sucursal)
);
