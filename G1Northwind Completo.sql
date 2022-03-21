Create DATABASE G1Northwind

CREATE TABLE G1Categorias (
    CategoriasID INTEGER NOT NULL Identity(1,1),
    Nombre_Categoria VARCHAR(15) NOT NULL,
    Descripcion TEXT,
    CONSTRAINT PK_Categorias PRIMARY KEY (CategoriasID)
);


CREATE TABLE G1ClientesClientesDemo (
    ClientesID VARCHAR(5) NOT NULL,
    ClienteTipoID VARCHAR(10) NOT NULL,
    CONSTRAINT PK_ClientesClientesDemo PRIMARY KEY (ClientesID, ClienteTipoID)
);


CREATE TABLE G1DemograficasClientes (
    ClientesTipoID VARCHAR(10) NOT NULL,
    ClientesDescripcion TEXT,
    CONSTRAINT PK_DemograficasClientes PRIMARY KEY (ClientesTipoID)
);


CREATE TABLE G1Clientes (
    ClientesID VARCHAR(5) NOT NULL,
    NombreCompañia VARCHAR(40) NOT NULL,
    NombreContacto VARCHAR(30),
    TituloContacto VARCHAR(30),
    Direccion VARCHAR(60),
    Ciudad VARCHAR(15),
    Region VARCHAR(15),
    CodigoPostal VARCHAR(10),
    Pais VARCHAR(15),
    Telefono VARCHAR(24),
    Fax VARCHAR(24),
    CONSTRAINT PK_Clientes PRIMARY KEY (ClientesID)
);


CREATE TABLE G1Empleados (
    EmpleadoID INTEGER NOT NULL Identity(1,1),
    Nombre VARCHAR(20) NOT NULL,
    Apellido VARCHAR(10) NOT NULL,
    Titulo VARCHAR(30),
    Titulo_de_cortesia VARCHAR(25),
    FechaNacimiento DATETIME,
    FechaContratacion DATETIME,
    Direccion VARCHAR(60),
    Ciudades VARCHAR(15),
    Region VARCHAR(15),
    CodigoPostal VARCHAR(10),
    Pais VARCHAR(15),
    TelefonoCasa VARCHAR(24),
    Extension VARCHAR(4),
    Notas TEXT NOT NULL,
    ReportarA INTEGER,
    FotoPath VARCHAR(255),
    Salario FLOAT,
    CONSTRAINT PK_Empleados PRIMARY KEY (EmpleadoID)
);


CREATE TABLE G1TerritoriosEmpleados (
    EmpleadoID INTEGER NOT NULL,
    TerritorioID VARCHAR(20) NOT NULL,
    CONSTRAINT PK_TerritoriosEmpleados PRIMARY KEY (EmpleadoID, TerritorioID)
);

CREATE TABLE G1DetallesOrdenes (
    OrdenID INTEGER NOT NULL,
    ProductoID INTEGER NOT NULL,
    PrecioUnitario DECIMAL(10,4) NOT NULL DEFAULT 0,
    Cantidad SMALLINT NOT NULL DEFAULT 1,
    Descuento REAL NOT NULL DEFAULT 0,
    CONSTRAINT PK_DetallesOrdenes PRIMARY KEY (OrdenID, ProductoID)
);


CREATE TABLE G1Orden (
    OrdenID INTEGER NOT NULL Identity(1,1),
    ClienteID VARCHAR(5),
    EmpleadoID INTEGER,
    FechaOrden DATETIME,
    FechaRequerida DATETIME,
    FechadeEntrega DATETIME,
    EnvioVia INTEGER,
    Peso DECIMAL(10,4) DEFAULT 0,
    Transporte VARCHAR(40),
    DireccionTransporte VARCHAR(60),
    CiudaddelTransporte VARCHAR(15),
    RegiondelTransporte VARCHAR(15),
    CodigoPostadelTransporte VARCHAR(10),
    PaisdelTransporte VARCHAR(15),
    CONSTRAINT PK_Orden PRIMARY KEY (OrdenID)
);


CREATE TABLE G1Productos (
    ProductoID INTEGER NOT NULL Identity(1,1),
    NombreProducto VARCHAR(40) NOT NULL,
    ProveedorID INTEGER,
    CategoriaID INTEGER,
    CantidadporUnidad VARCHAR(20),
    PrecioUnitario DECIMAL(10,4) DEFAULT 0,
    UnidadesenStock SMALLINT DEFAULT 0,
    UnidadesenOrden SMALLINT DEFAULT 0,
    NiveldeReordenamiento SMALLINT DEFAULT 0,
    Descontinuado BIT NOT NULL DEFAULT 0,
    CONSTRAINT PK_Productos PRIMARY KEY (ProductoID)
);


CREATE TABLE G1Region (
    RegionID INTEGER NOT NULL,
    DescripcionRegion VARCHAR(50) NOT NULL,
    CONSTRAINT PK_Region PRIMARY KEY (RegionID)
);


CREATE TABLE G1Transportistas (
    TransportistasID INTEGER NOT NULL Identity(1,1),
    NombreCompañia VARCHAR(40) NOT NULL,
    Telefono VARCHAR(24),
    CONSTRAINT PK_Transportistas PRIMARY KEY (TransportistasID)
);


CREATE TABLE G1Proveedores (
    ProveedoresID INTEGER NOT NULL Identity(1,1),
    NombreCompañia VARCHAR(40) NOT NULL,
    NombreContacto VARCHAR(30),
    TituloContacto VARCHAR(30),
    Direccion VARCHAR(60),
    Ciudad VARCHAR(15),
    Region VARCHAR(15),
    CodigoPostal VARCHAR(10),
    Pais VARCHAR(15),
    Telefono VARCHAR(24),
    Fax VARCHAR(24),
    PaginaPrincipal TEXT,
    CONSTRAINT PK_Proveedores PRIMARY KEY (ProveedoresID)
);


CREATE TABLE G1Territorios (
    TerritorioID VARCHAR(20) NOT NULL,
    DescripcionTerritorio VARCHAR(50) NOT NULL,
    RegionID INTEGER NOT NULL,
    CONSTRAINT PK_Territorios PRIMARY KEY (TerritorioID)
);



ALTER TABLE G1ClientesClientesDemo ADD CONSTRAINT FK_ClientesClientesDemo 
    FOREIGN KEY (ClienteTipoID) REFERENCES G1DemograficasClientes (ClientesTipoID);

ALTER TABLE G1ClientesClientesDemo ADD CONSTRAINT FK_ClientesClientesDemo_Clientes 
    FOREIGN KEY (ClientesID) REFERENCES G1Clientes (ClientesID);

ALTER TABLE G1Empleados ADD CONSTRAINT FK_Empleados_Empleados 
    FOREIGN KEY (ReportarA) REFERENCES G1Empleados (EmpleadoID);

ALTER TABLE G1TerritoriosEmpleados ADD CONSTRAINT FK_TerritoriosEmpleados_Empleados 
    FOREIGN KEY (EmpleadoID) REFERENCES G1Empleados (EmpleadoID);

ALTER TABLE G1TerritoriosEmpleados ADD CONSTRAINT FK_TerritoriosEmpleados_Territorios 
    FOREIGN KEY (TerritorioID) REFERENCES G1Territorios (TerritorioID);

ALTER TABLE G1DetallesOrdenes ADD CONSTRAINT FK_DetallesOrdenes_Orden 
    FOREIGN KEY (OrdenID) REFERENCES G1Orden (OrdenID);

ALTER TABLE G1DetallesOrdenes ADD CONSTRAINT FK_DetallesOrdenes_Productos 
    FOREIGN KEY (ProductoID) REFERENCES G1Productos (ProductoID);

ALTER TABLE G1Orden ADD CONSTRAINT FK_Orden_Clientes 
    FOREIGN KEY (ClienteID) REFERENCES G1Clientes (ClientesID);

ALTER TABLE G1Orden ADD CONSTRAINT FK_Orden_Empleados 
    FOREIGN KEY (EmpleadoID) REFERENCES G1Empleados (EmpleadoID);

ALTER TABLE G1Orden ADD CONSTRAINT FK_Orden_Transportistas 
    FOREIGN KEY (EnvioVia) REFERENCES G1Transportistas (TransportistasID);

ALTER TABLE G1Productos ADD CONSTRAINT FK_Productos_Categorias 
    FOREIGN KEY (CategoriaID) REFERENCES G1Categorias (CategoriasID);

ALTER TABLE G1Productos ADD CONSTRAINT FK_Productos_Proveedores 
    FOREIGN KEY (ProveedorID) REFERENCES G1Proveedores (ProveedoresID);

ALTER TABLE G1Territorios ADD CONSTRAINT FK_Territorios_Region 
    FOREIGN KEY (RegionID) REFERENCES G1Region (RegionID);
