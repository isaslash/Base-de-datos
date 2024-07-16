use inmobiliaria;

-- Este trigger actualiza automáticamente el número total de empleados en la tabla sucursal cada vez que se inserta, actualiza o elimina un registro en la tabla empleados_sede.

DELIMITER //

CREATE TRIGGER ActualizarCantidadEmpleados
AFTER INSERT ON empleados_sede
FOR EACH ROW
BEGIN
    UPDATE sucursal
    SET cantidad_empleados = (
        SELECT COUNT(*)
        FROM empleados_sede
        WHERE id_sucursal = NEW.id_sucursal
    )
    WHERE id_sucursal = NEW.id_sucursal;
END //

DELIMITER ;

-- Este trigger registra automáticamente la actividad de los empleados cada vez que se actualizan sus datos en la tabla empleados_sede.

DELIMITER //

CREATE TRIGGER RegistroActividadEmpleados
AFTER UPDATE ON empleados_sede
FOR EACH ROW
BEGIN
    INSERT INTO actividad_empleados (id_empleado, fecha_actualizacion, descripcion)
    VALUES (NEW.id_empleados_sede, NOW(), CONCAT('Se actualizó la información del empleado: ', NEW.nombre));
END //

DELIMITER ;