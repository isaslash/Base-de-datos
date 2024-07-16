use inmobiliaria;

-- mi primer vista mostrará información general de las sedes provinciales

CREATE VIEW vw_sedes_provinciales_info AS
SELECT 
    id_sedes_provinciales,
    nombre_provincia,
    cantidad_de_inmo,
    Cantidad_de_propiedades,
    Cantidad_de_Alquileres,
    Promedio_ventas_mes,
    Promedio_Alquileres_mes,
    cantidad_habitantes
FROM sedes_provinciales;

select * from vw_sedes_provinciales_info;

-- Esta vista proporcionará detalles de las sucursales por municipio

CREATE VIEW vw_sucursales_por_municipio AS
SELECT 
    sm.id_sedes_municipales,
    sm.nombre_de_municipio,
    sm.cantidad_de_inmo,
    sm.cantidad_de_propiedades,
    sm.cantidad_de_alquileres,
    sm.promedio_ventas_mes,
    sm.promedio_alquileres_mes,
    sm.cantidad_habitantes,
    s.nombre_sede,
    s.calle_ubicacion,
    s.altura_calle,
    s.numero_telefonico,
    s.año_apertura,
    s.dias_en_servicio,
    s.dias_fuera_servicio,
    s.cantidad_empleados
FROM sedes_por_municipio sm
INNER JOIN sucursal s ON sm.id_sedes_municipales = s.id_sedes_municipales;

-- Esta vista mostrará información de los encargados de cada sede

CREATE VIEW vw_encargados_sede AS
SELECT 
    es.id_encargado_sede,
    es.nombre_encargado,
    es.apellido_encargado,
    es.telefono,
    es.calle,
    es.altura,
    es.año_ingreso,
    es.años_antiguedad,
    s.nombre_sede AS nombre_sucursal
FROM encargado_sede es
INNER JOIN sucursal s ON es.id_sucursal = s.id_sucursal;

-- Esta vista mostrará los registros de ventas y alquileres por encargado de sede

CREATE VIEW vw_registro_ventas_alquileres AS
SELECT 
    rv.id_registro_ventas,
    rv.cantidad_ventas,
    rv.cantidad_alquileres,
    rv.cantidad_reservas,
    rv.dinero_ingresado_ventas,
    rv.dinero_ingresado_alquileres,
    rv.promedio_ventas,
    rv.promedio_alquileres,
    rv.egresos_reservas,
    es.nombre_encargado,
    es.apellido_encargado
FROM registro_ventas rv
INNER JOIN encargado_sede es ON rv.id_encargado_sede = es.id_encargado_sede;

-- La ultima vista mostrará un resumen de los gastos por sede

CREATE VIEW vw_gastos_sede AS
SELECT 
    gs.id_gastos_sede,
    gs.sueldo_encargado,
    gs.sueldo_empleado,
    gs.gasto_matricula,
    gs.gastos_impuesto_municipal,
    gs.gastos_servicios,
    gs.gastos_limpieza,
    gs.gastos_insumos,
    es.nombre_encargado,
    es.apellido_encargado,
    s.nombre_sede
FROM gastos_sede gs
INNER JOIN encargado_sede es ON gs.id_encargado_sede = es.id_encargado_sede
INNER JOIN sucursal s ON es.id_sucursal = s.id_sucursal;