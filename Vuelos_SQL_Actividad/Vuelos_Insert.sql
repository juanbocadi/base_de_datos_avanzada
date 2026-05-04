-- 1. Carga de Localidades nuevas
INSERT INTO localidades (cp, localidad) VALUES 
(5500, 'Mendoza'),
(4400, 'Salta'),
(8400, 'Bariloche'),
(4000, 'Tucumán');

-- 2. Carga de Propietarios nuevos
INSERT INTO propietarios (id_propietario, cuit, razon_social, cp) VALUES 
(10, '20555555552', 'Rossi Alejandro', 5500),
(20, '20666666662', 'Ferrari Enzo', 4400),
(30, '20777777772', 'Silva Mariana', 8400),
(40, '20888888882', 'Gonzalez Martin', 4000);

-- 3. Carga de Aviones nuevos
INSERT INTO aviones (id_avion, id_propietario, cantidad, tipo, modelo) VALUES 
(11, 10, 12, 'Learjet 45', 2008),
(22, 10, 8, 'Cessna 208', 2012), -- Rossi tiene 2 aviones (Para query 3)
(33, 20, 18, 'Gulfstream G550', 2003),
(44, 30, 4, 'Piper PA-28', 1985), -- El más antiguo (Para query 8)
(55, 40, 100, 'Airbus A319', 2018);

-- 4. Carga de Pasajeros nuevos
INSERT INTO pasajeros (id_pasajero, dni, nombre, apellido, mail, telefono, domicilio, cp) VALUES 
(100, '12345678', 'Carla', 'Romero', 'carla@mail.com', '261-111122', 'Calle 1', 5500),
(200, '87654321', 'Diego', 'Torres', 'diego@mail.com', '387-222233', 'Calle 2', 4400),
(300, '11223344', 'Elena', 'Paz', 'elena@mail.com', '294-333344', 'Calle 3', 8400),
(400, '44332211', 'Fabio', 'Gimenez', 'fabio@mail.com', '381-444455', 'Calle 4', 4000),
(500, '55667788', 'Gaston', 'Rios', 'gaston@mail.com', '261-555566', 'Calle 5', 5500),
(600, '99887766', 'Hilda', 'Suarez', 'hilda@mail.com', '294-666677', 'Calle 6', 8400);

-- 5. Carga de Vuelos nuevos (Incluye fechas en MARZO para que funcione la consulta 09)
INSERT INTO vuelos (id_vuelo, origen, destino, km, fecha, hora_0, hora_1, id_avion) VALUES 
(1001, 'Mendoza', 'Salta', 1200, '2026-03-10', '09:00', '11:00', 11), -- Vuelo de Marzo
(1002, 'Salta', 'Bariloche', 2000, '2026-03-15', '14:00', '17:00', 22), -- Vuelo de Marzo
(1003, 'Bariloche', 'Tucumán', 1800, '2026-04-20', '10:00', '12:30', 33),
(1004, 'Tucumán', 'Mendoza', 900, '2026-04-25', '16:00', '17:15', 44);

-- 6. Carga de Vuelos_Pasajeros nueva
INSERT INTO vuelos_pasajeros (id_vuelo, id_pasajero) VALUES 
(1001, 100), (1002, 100), (1003, 100), (1004, 100), -- Carla voló 4 veces (el que más voló)
(1001, 200), (1003, 200), (1004, 200),              -- Diego voló 3 veces
(1002, 300), (1003, 300),                           -- Elena voló 2 veces
(1004, 400),                                        -- Fabio voló 1 vez
(1001, 500),                                        -- Gaston voló 1 vez
(1002, 600);                                        -- Hilda voló 1 vez
