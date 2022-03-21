CREATE TABLE g1Pedidos (
    PedidoID INTEGER NOT NULL IDENTITY(1,1) PRIMARY KEY,
    ClienteID VARCHAR(5),
    EmpleadoID INTEGER,
    FechaPedido DATETIME,
    FechaRequerida DATETIME,
    FechaEnvio DATETIME,
    Envio INTEGER,
    Flete DECIMAL(10,4) DEFAULT 0,
    NombreEnvio VARCHAR(40),
    DireccionEnvio VARCHAR(60),
    CiudadEnvio VARCHAR(15),
    RegionEnvio VARCHAR(15),
    CodigoPostalEnvio VARCHAR(10),
    PaisEnvio VARCHAR(15)
);