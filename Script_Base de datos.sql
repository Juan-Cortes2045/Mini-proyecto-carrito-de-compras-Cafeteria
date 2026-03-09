CREATE DATABASE cafe;
USE cafe;


CREATE TABLE Person (
    id_person INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    last_name VARCHAR(100),
    document VARCHAR(50),
    phone VARCHAR(20),
    email VARCHAR(100)
);


CREATE TABLE User (
    id_user INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50),
    password VARCHAR(255),
    id_person INT,
    FOREIGN KEY (id_person) REFERENCES Person(id_person)
);


CREATE TABLE Role (
    id_role INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    description VARCHAR(255)
);


CREATE TABLE Module (
    id_module INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    description VARCHAR(255)
);


CREATE TABLE View (
    id_view INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    route VARCHAR(150)
);


CREATE TABLE Action (
    id_action INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    affect_table VARCHAR(100),
    fecha DATETIME,
    description VARCHAR(255)
);


CREATE TABLE UserRole (
    id_user_role INT AUTO_INCREMENT PRIMARY KEY,
    id_user INT,
    id_role INT,
    FOREIGN KEY (id_user) REFERENCES User(id_user),
    FOREIGN KEY (id_role) REFERENCES Role(id_role)
);


CREATE TABLE RoleModule (
    id_role_module INT AUTO_INCREMENT PRIMARY KEY,
    id_role INT,
    id_module INT,
    FOREIGN KEY (id_role) REFERENCES Role(id_role),
    FOREIGN KEY (id_module) REFERENCES Module(id_module)
);


CREATE TABLE ViewModule (
    id_view_module INT AUTO_INCREMENT PRIMARY KEY,
    id_view INT,
    id_module INT,
    FOREIGN KEY (id_view) REFERENCES View(id_view),
    FOREIGN KEY (id_module) REFERENCES Module(id_module)
);


CREATE TABLE ViewAction (
    id_view_action INT AUTO_INCREMENT PRIMARY KEY,
    id_view INT,
    id_action INT,
    FOREIGN KEY (id_view) REFERENCES View(id_view),
    FOREIGN KEY (id_action) REFERENCES Action(id_action)
);


CREATE TABLE Category (
    id_category INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    description VARCHAR(255)
);


CREATE TABLE Product (
    id_product INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    description VARCHAR(255),
    preparation_type VARCHAR(100),
    id_category INT,
    FOREIGN KEY (id_category) REFERENCES Category(id_category)
);


CREATE TABLE Inventory (
    id_inventory INT AUTO_INCREMENT PRIMARY KEY,
    id_product INT,
    stock INT,
    price DECIMAL(10,2),
    effective_date DATE,
    FOREIGN KEY (id_product) REFERENCES Product(id_product)
);


CREATE TABLE Cart (
    id_cart INT AUTO_INCREMENT PRIMARY KEY,
    id_user INT,
    created_at DATETIME,
    FOREIGN KEY (id_user) REFERENCES User(id_user)
);


CREATE TABLE `Table` (
    id_table INT AUTO_INCREMENT PRIMARY KEY,
    number INT,
    capacity INT,
    status VARCHAR(50)
);

=
CREATE TABLE Bill (
    id_bill INT AUTO_INCREMENT PRIMARY KEY,
    id_user INT,
    id_table INT,
    total DECIMAL(10,2),
    date DATETIME,
    status VARCHAR(50),
    FOREIGN KEY (id_user) REFERENCES User(id_user),
    FOREIGN KEY (id_table) REFERENCES `Table`(id_table)
);


CREATE TABLE BillDetail (
    id_bill_detail INT AUTO_INCREMENT PRIMARY KEY,
    id_bill INT,
    id_inventory INT,
    quantity INT,
    unit_price DECIMAL(10,2),
    subtotal DECIMAL(10,2),
    FOREIGN KEY (id_bill) REFERENCES Bill(id_bill),
    FOREIGN KEY (id_inventory) REFERENCES Inventory(id_inventory)
);