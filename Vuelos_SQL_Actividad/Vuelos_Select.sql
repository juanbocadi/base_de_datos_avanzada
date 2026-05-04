-- 01_ Mostrar todos los propietarios de Aviones con su localidad.
-- Hacemos un JOIN entre propietarios y localidades usando el código postal (cp).
SELECT p.razon_social, p.cuit, l.localidad 
FROM propietarios p
JOIN localidades l ON p.cp = l.cp;


-- 02_ Mostrar todos los propietarios de Aviones ordenados por apellido.
-- Como en tu esquema consolidaste Nombre y Apellido en "razon_social", 
-- ordenamos alfabéticamente por ese campo.
SELECT * FROM propietarios 
ORDER BY razon_social ASC;


-- 03_ Mostrar todos los propietarios que tienen mas de un Avion y mostrar cuantos.
-- Agrupamos por propietario y contamos sus aviones, filtrando con HAVING los > 1.
SELECT p.razon_social, COUNT(a.id_avion) AS cantidad_aviones
FROM propietarios p
JOIN aviones a ON p.id_propietario = a.id_propietario
GROUP BY p.id_propietario, p.razon_social
HAVING COUNT(a.id_avion) > 1;


-- 04_ Mostrar la cantidad de pasajeros que volaron en nuestra empresa.
-- Contamos los IDs únicos de la tabla intermedia para saber cuántas personas distintas viajaron.
SELECT COUNT(DISTINCT id_pasajero) AS cantidad_pasajeros_volaron
FROM vuelos_pasajeros;


-- 05_ Mostrar los 3 pasajero que mas veces volaron.
-- Agrupamos, contamos las apariciones en la tabla intermedia, ordenamos de mayor a menor y sacamos el TOP 3.
SELECT TOP 3 p.nombre, p.apellido, COUNT(vp.id_vuelo) AS cantidad_vuelos
FROM pasajeros p
JOIN vuelos_pasajeros vp ON p.id_pasajero = vp.id_pasajero
GROUP BY p.id_pasajero, p.nombre, p.apellido
ORDER BY cantidad_vuelos DESC;


-- 06_ Mostrar aquellos pasajeros que solo volaron una vez.
-- Similar al punto 3, pero filtrando a los pasajeros que tienen exactamente 1 vuelo.
SELECT p.nombre, p.apellido
FROM pasajeros p
JOIN vuelos_pasajeros vp ON p.id_pasajero = vp.id_pasajero
GROUP BY p.id_pasajero, p.nombre, p.apellido
HAVING COUNT(vp.id_vuelo) = 1;


-- 07_ Mostrar las localidades en las cual residen la mayoria de nuestros pasajeros. (las 3 principales)
-- Cruzamos localidades con pasajeros, contamos, ordenamos descendentemente y tomamos el TOP 3.
SELECT TOP 3 l.localidad, COUNT(p.id_pasajero) AS cantidad_residentes
FROM localidades l
JOIN pasajeros p ON l.cp = p.cp
GROUP BY l.cp, l.localidad
ORDER BY cantidad_residentes DESC;


-- 08_ Mostrar las 3 aeronaves mas antiguas junto con los datos de su propietario.
-- Ordenamos de forma ascendente por el campo "modelo" (que guarda el año de fabricación) y tomamos las primeras 3.
SELECT TOP 3 a.tipo, a.modelo AS anio_fabricacion, p.razon_social, p.cuit
FROM aviones a
JOIN propietarios p ON a.id_propietario = p.id_propietario
ORDER BY a.modelo ASC;


-- 09_ Mostrar todos los vuelos de Marzo.
-- Usamos la función MONTH() para extraer el mes de la fecha.
-- Nota: Con los datos de prueba que cargamos antes, esto devolverá vacío porque cargamos fechas de Mayo.
SELECT * FROM vuelos 
WHERE MONTH(fecha) = 3;


-- 10_ Mostrar la cantidad total de pasajeros por vuelos.
-- Agrupamos por vuelo y contamos los pasajeros en la tabla intermedia.
-- Uso LEFT JOIN por si llega a existir un vuelo cargado que todavía no tenga pasajeros (para que muestre 0).
SELECT v.id_vuelo, v.origen, v.destino, COUNT(vp.id_pasajero) AS total_pasajeros
FROM vuelos v
LEFT JOIN vuelos_pasajeros vp ON v.id_vuelo = vp.id_vuelo
GROUP BY v.id_vuelo, v.origen, v.destino;
