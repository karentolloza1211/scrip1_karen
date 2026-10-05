CREATE DATABASE pizzeria; /* creacion de la base de datos*/

USE pizzeria; 

/*tabla categorias*/
CREATE TABLE categorias(
id_categoria INT AUTO_INCREMENT,
nombre VARCHAR(50) NOT NULL UNIQUE,
PRIMARY KEY (id_categoria)
);

INSERT INTO categorias (nombre) VALUES
('pizza'),
('panzarotti'),
('bebida'),
('postres'),
('helados');


/* tabla clientes*/
CREATE TABLE clientes(
id_cliente INT AUTO_INCREMENT,
nombre VARCHAR(100)NOT NULL,
telefono VARCHAR(20),
correo VARCHAR(100) UNIQUE,
PRIMARY KEY(id_cliente)
);

INSERT INTO clientes (nombre,telefono,correo) VALUES
('carlos perez', '3224567217','carlos@gmail.com'),
('tatiana perez', '3224567217','tatiana@gmail.com'),
('camila perez', '3224567217','camila@gmail.com'),
('valentina perez', '3224567217','valentina@gmail.com'),
('tomas perez', '3224567217','tomas@gmail.com');


/* tabla productos*/
CREATE TABLE productos(
id_producto INT AUTO_INCREMENT,
nombre VARCHAR(100) NOT NULL,
descripcion VARCHAR(255),
precio DECIMAL(10,2) NOT NULL,
id_categoria INT NOT NULL,
elaborado BOOLEAN NOT NULL,
PRIMARY KEY (id_producto),

FOREIGN KEY(id_categoria)
 REFERENCES categorias(id_categoria)
);

INSERT INTO productos (nombre, precio, id_categoria, descripcion, elaborado) VALUES
('pizza hawaiana', 28000, 1, 'Pizza hawaiana tradicional con piña y jamón', TRUE),
('pizza peperonni', 38000, 1, 'Pizza con extra pepperoni', TRUE),
('pizza pollo', 28000, 1, 'Pizza con pollo desmechado', TRUE),
('pizza jamon y queso', 28000, 1, 'Pizza clásica de jamón y queso', TRUE),
('pizza de jamon', 38000, 1, 'Pizza abundante en jamón', TRUE);


/*tabla ingredientes*/
CREATE TABLE ingredientes(
id_ingredientes INT AUTO_INCREMENT,
nombre VARCHAR(100) NOT NULL UNIQUE,
PRIMARY KEY (id_ingredientes)
);

INSERT INTO ingredientes(nombre) VALUES
('queso mozzarela'),
('jamon'),
('piña'),
('peperoni'),
('pollo');

/*CONSULTAS*/

SELECT * FROM categorias;

SELECT * FROM clientes;

SELECT * FROM productos; 

SELECT * FROM ingredientes;

select nombre,precio
from productos; 

select nombre,precio
from productos
WHERE precio <20000;

select nombre,precio
from productos
WHERE elaborado=TRUE; 

SELECT nombre,precio
from productos
WHERE elaborado=FALSE; 

SELECT nombre,precio
FROM productos
order by precio desc;

select nombre,precio
from productos
ORDER BY precio DESC
LIMIT 1; 

SELECT nombre,precio
FROM productos
ORDER BY precio ASC
LIMIT 1; 

SELECT COUNT(*)AS total_productos
from productos; 

SELECT AVG(precio) AS precio_promedio
from productos; 

select max(precio)AS precio_maximo
from productos; 

select min(precio)AS precio_minimo
from productos; 

select *
from productos
where nombre LIKE '%pizza%';

select *
from ingredientes
where nombre like '%queso%'; 

select
p.nombre AS producto,
c.nombre AS categoria,
p.precio
from productos p
INNER JOIN categorias c
on p.id_categoria=c.id_categoria;

select
p.nombre,
p.precio
from productos p
INNER JOIN categorias c
ON p.id_categoria=c.id_categoria
where c.nombre='pizza'; 




