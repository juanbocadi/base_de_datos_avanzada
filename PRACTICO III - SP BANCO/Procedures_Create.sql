USE BANCO;
GO

-- 1.a) Agregar Clientes
CREATE PROCEDURE spd_addClientes
    @id_cliente INT,
    @apellido_cli NVARCHAR(100),
    @nombre_cli NVARCHAR(100),
    @dni NVARCHAR(100),
    @telefono NVARCHAR(100),
    @fecha_nac DATETIME
AS 
BEGIN
    INSERT INTO clientes (id_cliente, apellido_cli, nombre_cli, dni, telefono, fecha_nac) 
    VALUES (@id_cliente, @apellido_cli, @nombre_cli, @dni, @telefono, @fecha_nac);
END;
GO

-- 1.b) Agregar Cuentas
CREATE PROCEDURE spd_addcuentas
    @id_cuenta INT,
    @id_cliente INT,
    @tipo_cuenta NVARCHAR(50),
    @saldo DECIMAL(18,2)
AS
BEGIN
    INSERT INTO cuentas (id_cuenta, id_cliente, tipo_cuenta, saldo)
    VALUES (@id_cuenta, @id_cliente, @tipo_cuenta, @saldo);
END;
GO

-- 1.c) Agregar Movimientos
CREATE PROCEDURE spd_addmovimientos
    @id_movimiento INT,
    @id_cuenta INT,
    @saldo_ant DECIMAL(18,2),
    @saldo_post DECIMAL(18,2),
    @importe DECIMAL(18,2),
    @fecha_mov DATETIME
AS
BEGIN
    INSERT INTO movimientos (id_movimiento, id_cuenta, saldo_ant, saldo_post, importe, fecha_mov)
    VALUES (@id_movimiento, @id_cuenta, @saldo_ant, @saldo_post, @importe, @fecha_mov);
END;
GO

-- 2.a) Eliminar Clientes
CREATE PROCEDURE spd_delClientes
    @id_cliente INT
AS
BEGIN
    DELETE FROM clientes 
    WHERE id_cliente = @id_cliente;
END;
GO

-- 2.b) Eliminar Cuentas
CREATE PROCEDURE spd_delcuentas
    @id_cuenta INT
AS
BEGIN
    DELETE FROM cuentas 
    WHERE id_cuenta = @id_cuenta;
END;
GO

-- 2.c) Eliminar Movimientos
CREATE PROCEDURE spd_delmovimientos
    @id_movimiento INT
AS
BEGIN
    DELETE FROM movimientos 
    WHERE id_movimiento = @id_movimiento;
END;
GO

-- 3.a) Actualizar Clientes
CREATE PROCEDURE spd_upclientes
    @id_cliente INT,
    @apellido_cli NVARCHAR(100),
    @nombre_cli NVARCHAR(100),
    @dni NVARCHAR(100),
    @telefono NVARCHAR(100),
    @fecha_nac DATETIME
AS
BEGIN
    UPDATE clientes
    SET apellido_cli = @apellido_cli,
        nombre_cli = @nombre_cli,
        dni = @dni,
        telefono = @telefono,
        fecha_nac = @fecha_nac
    WHERE id_cliente = @id_cliente;
END;
GO

-- 3.b) Actualizar Cuentas
CREATE PROCEDURE spd_upcuentas
    @id_cuenta INT,
    @tipo_cuenta NVARCHAR(50),
    @saldo DECIMAL(18,2)
AS
BEGIN
    UPDATE cuentas
    SET tipo_cuenta = @tipo_cuenta,
        saldo = @saldo
    WHERE id_cuenta = @id_cuenta;
END;
GO

-- 3.c) Actualizar Movimientos
CREATE PROCEDURE spd_upmovimientos
    @id_movimiento INT,
    @saldo_ant DECIMAL(18,2),
    @saldo_post DECIMAL(18,2),
    @importe DECIMAL(18,2),
    @fecha_mov DATETIME
AS
BEGIN
    UPDATE movimientos
    SET saldo_ant = @saldo_ant,
        saldo_post = @saldo_post,
        importe = @importe,
        fecha_mov = @fecha_mov
    WHERE id_movimiento = @id_movimiento;
END;
GO

-- 4) Procedimiento con parámetro de salida: Obtener Saldo
CREATE PROCEDURE spu_ObtenerSaldoCuenta 
    @id_cuenta INT,
    @saldo DECIMAL(18,2) OUTPUT
AS
BEGIN
    SELECT @saldo = saldo
    FROM cuentas
    WHERE id_cuenta = @id_cuenta;
END;
GO

-- 5) Obtener Movimientos por Fecha
CREATE PROCEDURE spu_MovimientoCuenta 
    @fecha_movimiento DATETIME
AS
BEGIN
    SELECT cl.apellido_cli, m.id_movimiento, m.saldo_ant, m.saldo_post, m.importe, m.fecha_mov
    FROM movimientos m 
    INNER JOIN cuentas c ON m.id_cuenta = c.id_cuenta 
    INNER JOIN clientes cl ON c.id_cliente = cl.id_cliente
    WHERE m.fecha_mov = @fecha_movimiento
    ORDER BY m.fecha_mov DESC;
END;
GO

-- 6) Generar TXT Clientes
CREATE PROCEDURE sp_GenerarTxtClientes
AS
BEGIN
    DECLARE @sql_cmd VARCHAR(4000);
    DECLARE @server_name VARCHAR(100) = @@SERVERNAME;
    
    SET @sql_cmd = 'bcp "SELECT c.apellido_cli + c.nombre_cli + c.dni + cu.tipo_cuenta + CAST(cu.saldo AS VARCHAR(50)) FROM BANCO.dbo.clientes c INNER JOIN BANCO.dbo.cuentas cu ON c.id_cliente = cu.id_cliente" queryout "C:\Reportes\DatosClientes.txt" -c -T -S ' + @server_name;

    EXEC master..xp_cmdshell @sql_cmd;
END;
GO