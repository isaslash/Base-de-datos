use inmobiliaria;

-- Esta función devolverá la cantidad total de empleados trabajando en una sede específica.

DELIMITER //

CREATE FUNCTION ObtenerCantidadPropiedadesPorSucursal(id_sucursal INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE cantidad_propiedades INT;
    
    SELECT COUNT(*) INTO cantidad_propiedades
    FROM propiedades
    WHERE id_sucursal = id_sucursal;
    
    RETURN cantidad_propiedades;
END //

DELIMITER ;

-- Esta función calculará la suma total de los valores de venta y alquiler registrados por un encargado de sede específico.

DELIMITER //

CREATE FUNCTION CalcularSumaTotalVentasAlquileresEncargado(id_encargado INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10,2);
    
    SELECT SUM(dinero_ingresado_ventas + dinero_ingresado_alquileres)
    INTO total
    FROM registro_ventas
    WHERE id_encargado_sede = id_encargado;
    
    RETURN total;
END //

DELIMITER ;

