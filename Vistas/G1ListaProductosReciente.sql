use G1Northwind
Go

CREATE VIEW G1ListaProductosReciente AS
Select ProductoID,NombreProducto
From G1Productos
Where Descontinuado=0;