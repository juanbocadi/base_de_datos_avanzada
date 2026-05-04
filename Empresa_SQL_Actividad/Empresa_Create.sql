-- 1. Crear tabla Localidades (Nueva tabla independiente)
CREATE TABLE Localidades (
    id_localidad INT IDENTITY(1,1) PRIMARY KEY,
    codigo_postal VARCHAR(10) NOT NULL,
    nombre VARCHAR(100) NOT NULL
);

-- 2. Crear tabla Proveedores (Ahora depende de Localidades)
CREATE TABLE Proveedores (
    id_proveedor INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    id_localidad INT, -- Reemplaza al campo 'ciudad'
    telefono VARCHAR(20),
    CONSTRAINT FK_Proveedores_Localidades FOREIGN KEY (id_localidad) 
        REFERENCES Localidades(id_localidad)
);

-- 3. Crear tabla Clientes (Ahora depende de Localidades)
CREATE TABLE Clientes (
    id_cliente INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    id_localidad INT, -- Reemplaza al campo 'ciudad'
    telefono VARCHAR(20),
    dom_ent_calle VARCHAR(100),
    dom_ent_num VARCHAR(20),
    CONSTRAINT FK_Clientes_Localidades FOREIGN KEY (id_localidad) 
        REFERENCES Localidades(id_localidad)
);

-- 4. Crear tabla Productos (Depende de Proveedores)
CREATE TABLE Productos (
    id_producto INT IDENTITY(1,1) PRIMARY KEY,
    descripcion VARCHAR(255) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    peso DECIMAL(10, 2),
    id_proveedor INT,
    CONSTRAINT FK_Productos_Proveedores FOREIGN KEY (id_proveedor) 
        REFERENCES Proveedores(id_proveedor)
);

-- 5. Crear tabla Pedidos (Depende de Clientes)
CREATE TABLE Pedidos (
    id_pedido INT IDENTITY(1,1) PRIMARY KEY,
    id_cliente INT NOT NULL,
    fecha DATETIME DEFAULT GETDATE(),
    CONSTRAINT FK_Pedidos_Clientes FOREIGN KEY (id_cliente) 
        REFERENCES Clientes(id_cliente)
);

-- 6. Crear tabla Detalle_Pedido (Depende de Pedidos y Productos)
CREATE TABLE Detalle_Pedido (
    id_pedido INT,
    id_producto INT,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (id_pedido, id_producto),
    CONSTRAINT FK_Detalle_Pedidos FOREIGN KEY (id_pedido) 
        REFERENCES Pedidos(id_pedido),
    CONSTRAINT FK_Detalle_Productos FOREIGN KEY (id_producto) 
        REFERENCES Productos(id_producto)
);