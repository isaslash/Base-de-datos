use inmobiliaria;

-- Inserto las sedes provinciales a mis tablas

INSERT INTO sedes_provinciales (
    nombre_provincia, 
    cantidad_de_inmo, 
    Cantidad_de_propiedades, 
    Cantidad_de_Alquileres, 
    Promedio_ventas_mes, 
    Promedio_Alquileres_mes, 
    cantidad_habitantes
)
VALUES
    ('Buenos Aires', '10', '5000', '7000', '70.20', '85.50', '3120612'),
    ('La Pampa', '2', '300', '150', '10.10', '5.5', '361859'),
    ('Entre Rios', '3', '500', '200', '20.64', '15.40', '1300000'),
    ('Cordoba', '7', '3500', '1000', '30.05', '30.20', '3506000'),
    ('Santa Cruz', '1', '150', '200', '50.60', '40.60', '320469'),
    ('Rio Negro', '1', '200', '360', '60.50', '106', '688873'),
    ('Tierra Del Fuego', '3', '180', '190', '30.30', '20.80', '152317');
    
-- Inserto las sedes municipales a mis tablas   

INSERT INTO sedes_por_municipio (
    nombre_de_municipio, 
    cantidad_de_inmo, 
    cantidad_de_propiedades, 
    cantidad_de_alquileres, 
    Promedio_ventas_mes, 
    Promedio_Alquileres_mes, 
    cantidad_habitantes
)
VALUES
    ('Merlo', '5', '1500', '1700', '20.20', '50.60', '155000'),
    ('Intendente Alvear', '1', '150', '75', '10.10', '5.5', '36500'),
    ('Cerrito', '2', '500', '200', '20.64', '15.40', '13000'),
    ('Almafuerte', '2', '2500', '700', '30.40', '40.20', '11604'),
    ('El Calafate', '1', '150', '200', '50.60', '40.60', '12684'),
    ('El Bolson', '1', '200', '360', '60.50', '106', '25004'),
    ('Ushuaia', '2', '140', '100', '30.30', '20.80', '65402');
    
-- Inserto las sucursales a mis tablas
    
    INSERT INTO sucursal (
    nombre_sede, 
    calle_ubicacion, 
    altura_calle, 
    numero_telefonico, 
    año_apertura, 
    dias_en_servicio, 
    dias_fuera_servicio, 
    cantidad_empleados
)
VALUES
    ('MerloHogar', 'San Martin', '1525', '1136975471', '1997', '5780', '112', '11'),
    ('Alvear Prop', 'Julio Cesar', '1411', '254847514', '1999', '8542', '114', '4'),
    ('Cerrito Casas', 'Ricardo Balvin', '1444', '454855952', '1987', '6548', '147', '8'),
    ('Viviendas Almafuerte', 'Guemes', '2477', '775418879', '1988', '5711', '187', '3'),
    ('El Calafate Realty', 'Libertador', '674', '147899534', '1898', '8545', '304', '4'),
    ('EL Bolson Viviendas', 'Jujuy', '247', '114848662', '1895', '8714', '547', '7'),
    ('Ushuaia Propiedades', 'Avellaneda', '458', '144878454', '1993', '4893', '250', '6');
    
-- Inserto a los encargados de las sedes a mis tablas


INSERT INTO encargado_sede (
    nombre_encargado, 
    apellido_encargado, 
    telefono, 
    calle, 
    altura, 
    año_ingreso, 
    años_antiguedad
)
VALUES
    ('Norberto', 'Lili', '25874632', 'Arenales', '157', '2000', '24'),
    ('Pablo', 'Papu', '15897463', 'Guemes', '199', '2001', '23'),
    ('Silvio', 'Rogelio', '74693215', 'Castelli', '19', '2010', '14'),
    ('Martin', 'Gallardo', '63987412', 'San Juan', '188', '2012', '12'),
    ('Lionel', 'Nessi', '96521472', 'Brasil', '18', '2000', '24'),
    ('Martina', 'Rola', '36215897', 'Honduras', '95', '2014', '10'),
    ('Jesica', 'Rios', '74569852', 'Sarmiento', '993', '1990', '34');
    
-- Inserto los registros de ventas a mis tablas
    
INSERT INTO registro_ventas (
    cantidad_ventas, 
    cantidad_alquileres, 
    cantidad_reservas, 
    dinero_ingresado_ventas, 
    dinero_ingresado_alquileres, 
    promedio_ventas, 
    promedio_alquileres, 
    egresos_reservas
)
VALUES
    ('12569', '13254', '1965', '22569874', '4265486', '90.54', '90.96', '156'),
    ('10589', '10586', '1874', '30258479', '2589744', '70.65', '66.74', '200'),
    ('9654', '12058', '1899', '25543123', '6962414', '60.51', '51.77', '160'),
    ('13658', '5471', '1450', '30654892', '3544445', '70.63', '47.96', '120'),
    ('3698', '9522', '1200', '12589634', '9668745', '30.50', '50.50', '100'),
    ('22587', '12587', '1600', '47586924', '9658741', '90.68', '98.99', '25'),
    ('9000', '9858', '1477', '25854896', '9654123', '50.50', '36.90', '150');

-- Inserto los gastos de las sedes a mis tablas

INSERT INTO gastos_sede (
    sueldo_encargado, 
    sueldo_empleado, 
    gasto_matricula, 
    gastos_impuesto_municipal, 
    gastos_servicios, 
    gastos_limpieza, 
    gastos_insumos
)
VALUES
    ('550000', '450000', '200000', '15000', '100000', '100000', '95400'),
    ('550000', '450000', '202000', '12044', '190542', '108555', '93255'),
    ('560500', '455000', '220588', '21000', '155333', '111369', '102568'),
    ('605888', '505411', '235997', '11259', '129652', '130542', '85394'),
    ('496458', '420589', '190254', '9854', '95521', '150472', '205421'),
    ('523478', '490541', '258111', '12569', '255311', '101556', '140896'),
    ('650555', '496555', '220859', '20874', '159632', '150463', '142056');
    
-- Inserto los empleados de las sedes a mis tablas

INSERT INTO empleados_sede (
    nombre, 
    telefono, 
    calle, 
    altura, 
    promedio_ventas, 
    promedio_alquileres, 
    propiedades_tomadas, 
    cantidad_ventas
)
VALUES
    ('Dario', '1136587412', 'Zapiola', '1125', '30.5', '50.6', '65', '30'),
    ('Silvina', '1147852369', 'Avellaneda', '125', '55.20', '90.20', '90', '45'),
    ('Brisa', '1124745698', 'Maipu', '2445', '95.42', '20.1', '65', '20'),
    ('Juan', '1136547896', 'Cordoba', '364', '99.99', '2.4', '89', '88'),
    ('Daniel', '1187963215', 'Sarmiento', '98', '41.50', '96.40', '74', '35'),
    ('Mariano', '1174589632', 'Moreno', '125', '69.42', '100', '105', '61'),
    ('Pablo', '1136542536', 'Arenales', '874', '58.99', '40.20', '200', '68');

-- Inserto las propiedades en posesion a mis tablas

INSERT INTO propiedades (
    calle, 
    altura, 
    valor_venta, 
    valor_aquiler, 
    ambientes, 
    m2_totales, 
    años_antiguedad, 
    toma_empleado
)
VALUES
    ('Guemes', '1722', '50000000', '250000', '3', '350', '30', 'Dario'),
    ('Salta', '852', '30000000', '300000', '4', '255', '45', 'Juan'),
    ('Bariloche', '198', '60000000', '450000', '6', '350', '30', 'Daniel'),
    ('Jujuy', '96', '25000000', '200000', '2', '250', '60', 'Mariano'),
    ('25 de Mayo', '630', '50000000', '500000', '4', '450', '50', 'Pablo'),
    ('9 de Julio', '115', '60000000', '300000', '6', '300', '80', 'Brisa'),
    ('Arenales', '36', '90000000', '600000', '8', '550', '20', 'Silvina');

select * from propiedades;
