CREATE DATABASE CafeteriaSena;
GO

USE CafeteriaSena;
GO

CREATE TABLE Rol (
    id INT PRIMARY KEY,
    nombre_Rol VARCHAR(50) NOT NULL
);

CREATE TABLE NivelFormacion (
    id INT PRIMARY KEY,
    nombre_Nivel VARCHAR(50) NOT NULL
);


CREATE TABLE ProgramaFormativo (
    codigo VARCHAR(15) PRIMARY KEY,
    nombre_Programa VARCHAR(100) NOT NULL,
    id_NivelFormacion INT,
    ficha INT,
    FOREIGN KEY (id_nivelFormacion) REFERENCES NivelFormacion(id)
);


CREATE TABLE Cliente (
    id INT PRIMARY KEY,
    nombres VARCHAR(50) NOT NULL,
    apellidos VARCHAR(50) NOT NULL,
    id_Rol INT,
    telefono BIGINT,
    correo VARCHAR(100),
    contraseña VARCHAR(12),
    codigo_ProgramaFormativo VARCHAR(15),
    FOREIGN KEY (id_Rol) REFERENCES Rol(id),
    FOREIGN KEY (codigo_ProgramaFormativo) REFERENCES ProgramaFormativo(codigo)
);

CREATE TABLE Producto (
    id VARCHAR(15) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio FLOAT NOT NULL,
    descripcion VARCHAR(200)
);

CREATE TABLE Carrito (
    codigo_Carrito VARCHAR(6) PRIMARY KEY,
    id_Cliente INT,
    
    FOREIGN KEY (id_Cliente) REFERENCES Cliente(id)
);


CREATE TABLE Carrito_Producto (
    codigo_Carrito VARCHAR(6),
    id_Producto VARCHAR(15),
    PRIMARY KEY (codigo_Carrito, id_producto),
    FOREIGN KEY (codigo_Carrito) REFERENCES Carrito(codigo_Carrito),
    FOREIGN KEY (id_producto) REFERENCES Producto(id)
);


CREATE TABLE Mesa (
    id INT PRIMARY KEY,
    ubicacion VARCHAR(50),
    estado BIT
);

CREATE TABLE MetodosPago (
    id VARCHAR(5) PRIMARY KEY,
    nombre VARCHAR(50)
);


CREATE TABLE Cafeteria (
    codigoAcceso VARCHAR(5) PRIMARY KEY,
    ubicacion VARCHAR(100)
);



CREATE TABLE Administrador (
    id INT PRIMARY KEY,
    nombres VARCHAR(50),
    apellidos VARCHAR(50),
    telefono BIGINT,
    correo VARCHAR(100),
    codigoAcceso VARCHAR(5),
    FOREIGN KEY (codigoAcceso) REFERENCES Cafeteria(codigoAcceso)
);


CREATE TABLE Pedido (
    codigoVenta VARCHAR(6) PRIMARY KEY,
    codigo_Carrito VARCHAR(6),
    id_MetodoPago VARCHAR(5),
    id_Administrador INT,
    id_Mesa INT,
    FOREIGN KEY (codigo_Carrito) REFERENCES Carrito(codigo_Carrito),
    FOREIGN KEY (id_MetodoPago) REFERENCES MetodosPago(id),
    FOREIGN KEY (id_Administrador) REFERENCES Administrador(id),
    FOREIGN KEY (id_Mesa) REFERENCES Mesa(id)
);


