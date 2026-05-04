SELECT DISTINCT loc.nombre AS Localidad 
FROM Localidades loc
INNER JOIN Proveedores prov ON loc.id_localidad = prov.id_localidad;

SELECT * 
FROM Proveedores 
ORDER BY nombre ASC;

SELECT id_producto, peso 
FROM Productos 
WHERE id_producto IN (8, 11);

SELECT AVG(peso) AS Promedio_Peso 
FROM Productos;

SELECT loc.nombre AS Ciudad, COUNT(cli.id_cliente) AS Cantidad_Clientes 
FROM Clientes cli
INNER JOIN Localidades loc ON cli.id_localidad = loc.id_localidad
GROUP BY loc.nombre;

SELECT 
    ped.id_pedido, 
    ped.fecha, 
    CONCAT(cli.dom_ent_calle, ' ', cli.dom_ent_num, ', ', loc.nombre) AS Direccion_Entrega
FROM Pedidos ped
INNER JOIN Clientes cli ON ped.id_cliente = cli.id_cliente
INNER JOIN Localidades loc ON cli.id_localidad = loc.id_localidad;

SELECT DISTINCT 
    ped.id_pedido, 
    prov.nombre AS Nombre_Proveedor
FROM Pedidos ped
INNER JOIN Detalle_Pedido dp ON ped.id_pedido = dp.id_pedido
INNER JOIN Productos prod ON dp.id_producto = prod.id_producto
INNER JOIN Proveedores prov ON prod.id_proveedor = prov.id_proveedor
ORDER BY ped.id_pedido;