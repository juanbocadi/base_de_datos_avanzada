-- Tabla Clientes
CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY,
    apellido_cli NVARCHAR(100),
    nombre_cli NVARCHAR(100),
    dni NVARCHAR(100),
    telefono NVARCHAR(100),
    fecha_nac DATETIME
);

-- Tabla Cuentas
CREATE TABLE cuentas (
    id_cuenta INT PRIMARY KEY,
    id_cliente INT FOREIGN KEY REFERENCES clientes(id_cliente),
    tipo_cuenta NVARCHAR(50),
    saldo DECIMAL(18,2)
);

-- Tabla Histórico de Saldos
CREATE TABLE hco_saldos (
    id_cuenta INT FOREIGN KEY REFERENCES cuentas(id_cuenta),
    saldo DECIMAL(18,2),
    fxsaldo DATETIME
);

-- Tabla Movimientos
CREATE TABLE movimientos (
    id_movimiento INT PRIMARY KEY,
    id_cuenta INT FOREIGN KEY REFERENCES cuentas(id_cuenta),
    saldo_ant DECIMAL(18,2),
    saldo_post DECIMAL(18,2),
    importe DECIMAL(18,2),
    fecha_mov DATETIME
);
GO