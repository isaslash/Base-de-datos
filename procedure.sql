use inmobiliaria;

-- Este procedimiento calculará y devolverá las ventas totales sumando ventas y alquileres realizadas por un encargado de sede específico.

DELIMITER //

CREATE PROCEDURE ObtenerVentasPorEncargado(IN nombre_encargado VARCHAR(20))
BEGIN
    SELECT es.nombre_encargado, 
           SUM(rv.cantidad_ventas + rv.cantidad_alquileres) AS total_ventas
    FROM encargado_sede es
    INNER JOIN registro_ventas rv ON es.id_encargado_sede = rv.id_encargado_sede
    WHERE es.nombre_encargado = nombre_encargado
    GROUP BY es.nombre_encargado;
END //

DELIMITER ;

CALL ObtenerVentasPorEncargado('Norberto');

-- Este procedimiento calculará y devolverá los gastos totales incurridos en una sede específica, sumando todos los tipos de gastos registrados.

DELIMITER //

CREATE PROCEDURE CalcularGastosTotales(IN nombre_sede VARCHAR(20))
BEGIN
    SELECT s.nombre_sede,
           SUM(gs.sueldo_encargado + gs.sueldo_empleado + gs.gasto_matricula +
               gs.gastos_impuesto_municipal + gs.gastos_servicios + gs.gastos_limpieza +
               gs.gastos_insumos) AS total_gastos
    FROM sucursal s
    INNER JOIN encargado_sede es ON s.id_sucursal = es.id_sucursal
    INNER JOIN gastos_sede gs ON es.id_encargado_sede = gs.id_encargado_sede
    WHERE s.nombre_sede = nombre_sede
    GROUP BY s.nombre_sede;
END //

DELIMITER ;

CALL CalcularGastosTotales('MerloHogar');
