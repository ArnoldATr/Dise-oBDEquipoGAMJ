create database Tienda;
use Tienda;


create table categorias(
 Id_Categorias int IDENTITY(1,1) PRIMARY KEY,
 Nombre_Categoria varchar(45),

);

create table productos(
  Nombre_Producto varchar(45),
  Existencias int,
  Precio_Venta int,
  Tipo_Producto varchar(45),
  Ganancia decimal(9,1),
  Id_Productos int IDENTITY(1,1) PRIMARY KEY,
  Id_Categorias int foreign key references Categorias
);

create table ventas(
Fecha_Venta DateTime,
Forma_Pago varchar(10) check(Forma_Pago='Tarjeta' or Forma_Pago='Efectivo') NOT NULL,
Iva  decimal(9,1),
subtotal  decimal(9,1),
Total  decimal(9,1),
Id_Venta int IDENTITY(1,1) PRIMARY KEY,
);

create table clientes(
Nombre_Cliente varchar(20)NOT NULL,
Apellido_Paterno varchar(20)NOT NULL,
Apellido_Materno varchar(20)NOT NULL,
Sexo_Cliente varchar(10) check(Sexo_Cliente='Femenino' or Sexo_Cliente='Masculino') NOT NULL,
Edad_Cliente int check(Edad_Cliente like'[2-6][0-9]') NOT NULL,
Fecha_Nacimiento DateTime,
Tel_Cliente varchar(15)NOT NULL,
Corr_Cliente varchar(45) unique,
Dire_Cliente varchar(45) ,
Id_Cliente int IDENTITY(1,1) PRIMARY KEY,
Id_Productos int foreign key references Productos
);

create table VentaProductos(
Cantida_Vendida int,
Id_Venta int foreign key references ventas,
Id_Productos int foreign key references Productos,
Id_Cliente int foreign key references clientes

);

