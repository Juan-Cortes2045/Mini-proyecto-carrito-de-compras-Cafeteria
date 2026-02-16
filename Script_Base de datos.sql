CREATE DATABASE CafeteriaSena;
GO

USE CafeteriaSena;
GO

CREATE TABLE Rol (
    id INT PRIMARY KEY,
    nombre_rol VARCHAR(50) NOT NULL
);

CREATE TABLE NivelFormacion (
    id INT PRIMARY KEY,
    nombre_Nivel VARCHAR(50) NOT NULL
);


CREATE TABLE ProgramaFormativo (
    codigo VARCHAR(15) PRIMARY KEY,
    nombre_Programa VARCHAR(100) NOT NULL,
    id_nivelFormacion INT,
    ficha INT,
    FOREIGN KEY (id_nivelFormacion) REFERENCES NivelFormacion(id)
);


CREATE TABLE Cliente (
    id INT PRIMARY KEY,
    nombres VARCHAR(50) NOT NULL,
    apellidos VARCHAR(50) NOT NULL,
    id_rol INT,
    telefono BIGINT,
    correo VARCHAR(100),
    contraseña VARCHAR(12),
    codigo_ProgramaFormativo VARCHAR(15),
    FOREIGN KEY (id_rol) REFERENCES Rol(id),
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
    id_cliente INT,
    
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id)
);


CREATE TABLE Carrito_Producto (
    codigo_Carrito VARCHAR(6),
    id_producto VARCHAR(15),
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
    id_metodoPago VARCHAR(5),
    id_administrador INT,
    id_mesa INT,
    FOREIGN KEY (codigo_Carrito) REFERENCES Carrito(codigo_Carrito),
    FOREIGN KEY (id_metodoPago) REFERENCES MetodosPago(id),
    FOREIGN KEY (id_administrador) REFERENCES Administrador(id),
    FOREIGN KEY (id_mesa) REFERENCES Mesa(id)
);


