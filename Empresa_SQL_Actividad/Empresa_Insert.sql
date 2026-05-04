-- Carga de Localidades
INSERT INTO Localidades (codigo_postal, nombre) VALUES 
('S2000', 'Rosario'), ('C1000', 'CABA'), ('X5000', 'Córdoba');

-- Carga de Proveedores
INSERT INTO Proveedores (nombre, id_localidad, telefono) VALUES 
('Distribuidora Norte', 1, '341-5551234'), 
('Tech Suplies', 2, '011-4445678'),
('Insumos Centro', 1, '341-5558888');

-- Carga de Clientes
INSERT INTO Clientes (nombre, id_localidad, telefono, dom_ent_calle, dom_ent_num) VALUES 
('Juan Perez', 1, '341-1112222', 'Pellegrini', '1500'),
('Ana Gomez', 2, '011-3334444', 'Av. Corrientes', '2000'),
('Carlos Ruiz', 1, '341-9990000', 'Oroño', '850 Bis');

-- Carga de Productos (Insertamos 11 para cumplir con el punto 6)
INSERT INTO Productos (descripcion, precio, peso, id_proveedor) VALUES 
('Monitor 24"', 150000.00, 3.5, 2), ('Teclado Mecanico', 45000.00, 1.2, 2),
('Mouse Inalambrico', 25000.00, 0.3, 2), ('Auriculares', 35000.00, 0.5, 2),
('Cable HDMI', 5000.00, 0.1, 1), ('Disco SSD 1TB', 60000.00, 0.2, 1),
('Memoria RAM 16GB', 40000.00, 0.1, 1), ('Gabinete ATX', 80000.00, 5.0, 1), -- Producto 8
('Fuente 600W', 55000.00, 2.0, 3), ('Cooler', 15000.00, 0.4, 3),
('Placa de Video', 350000.00, 1.5, 3); -- Producto 11

-- Carga de Pedidos
INSERT INTO Pedidos (id_cliente, fecha) VALUES 
(1, '2026-05-01 10:00:00'), (2, '2026-05-02 14:30:00'), (1, '2026-05-03 09:15:00');

-- Carga de Detalle_Pedido
INSERT INTO Detalle_Pedido (id_pedido, id_producto, cantidad, precio_unitario) VALUES 
(1, 1, 2, 150000.00), (1, 8, 1, 80000.00), -- Pedido 1 tiene productos del prov 2 y 1
(2, 11, 1, 350000.00),                    -- Pedido 2 tiene producto del prov 3
(3, 5, 5, 5000.00);                       -- Pedido 3 tiene producto del prov 1