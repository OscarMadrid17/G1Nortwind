Create table g1Proveedores (
	ProveedorID INTEGER NOT NULL IDENTITY(1,1) PRIMARY KEY,
	Nombre_Empresa  VARCHAR(90) NOT NULL,
    Nombre_Contacto VARCHAR(30),
    Cargo_Contacto VARCHAR(80),
    Direccion VARCHAR(100),
    Cuidad VARCHAR(50),
    Region VARCHAR(50),
    CodigoPostal VARCHAR(10),
    Pais VARCHAR(15),
    Telefono VARCHAR(24),
    Fax VARCHAR(24),
    PaginaInicio Text,
);
