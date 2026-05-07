USE eventos_Bocadi;
GO

CREATE TABLE ADM_Paises (
    id_pais INT PRIMARY KEY,
    nombre_pais NVARCHAR(100)
);

CREATE TABLE ADM_Ciudades (
    id_ciudad INT PRIMARY KEY,
    nomnbre_ciudad NVARCHAR(100),
    id_pais INT FOREIGN KEY REFERENCES ADM_Paises(id_pais)
);

CREATE TABLE FER_Predios (
    id_predio INT IDENTITY(1,1) PRIMARY KEY,
    nombre_predio NVARCHAR(100),
    id_ciudad INT FOREIGN KEY REFERENCES ADM_Ciudades(id_ciudad),
    superficie NUMERIC(9)
);

CREATE TABLE FER_Rubros (
    id_rubro INT PRIMARY KEY,
    rubro NVARCHAR(100)
);

CREATE TABLE FER_Expos (
    id_feria INT PRIMARY KEY,
    nombre NVARCHAR(100),
    id_rubro INT FOREIGN KEY REFERENCES FER_Rubros(id_rubro),
    fecha_apertura DATETIME,
    fecha_cierre DATETIME,
    id_predio INT FOREIGN KEY REFERENCES FER_Predios(id_predio)
);