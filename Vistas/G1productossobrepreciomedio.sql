use G1Northwind
go

CREATE VIEW G1productossobrepreciomedio AS
    SELECT 
        G1Productos.NombreProducto AS NombreProducto,
        G1Productos.PrecioUnitario AS PrecioUnitorio
    FROM
        G1Productos
    WHERE (G1Productos.PrecioUnitario > 
		(SELECT AVG(G1Productos.PrecioUnitario)
            FROM G1Productos))