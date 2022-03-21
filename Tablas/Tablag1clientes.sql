use g1northwind
create table g1clientes (
	ClienteID VARCHAR(5) NOT NULL PRIMARY KEY,
    Nombre_Empresa  VARCHAR(90) NOT NULL,
	Nombre_Contacto VARCHAR(30),
    Cargo_Contacto VARCHAR(80),
    Direccion VARCHAR(100),
    Cuidad VARCHAR(50),
    Region VARCHAR(50),
    CodPostal VARCHAR(10),
    Pais VARCHAR(15),
    Telefono VARCHAR(24),
    Fax VARCHAR(24),
);