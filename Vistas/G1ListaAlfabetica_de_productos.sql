use G1Northwind
go

CREATE VIEW G1ListaAlfabetica_de_productos
AS
SELECT Top 100 * from G1Productos
WHERE (((G1Productos.Descontinuado)=0))
Order by NombreProducto Asc;
