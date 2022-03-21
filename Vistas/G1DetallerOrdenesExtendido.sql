use G1Northwind
go

CREATE VIEW G1DetallesOrdenesExtendido AS
SELECT G1DetallesOrdenes.OrdenID, 
       G1DetallesOrdenes.ProductoID, 
       G1Productos.NombreProducto, 
	   G1DetallesOrdenes.PrecioUnitario, 
       G1DetallesOrdenes.Cantidad, 
       G1DetallesOrdenes.Descuento, 
      (G1DetallesOrdenes.PrecioUnitario*Cantidad*(1-Descuento)/100)*100 AS PrecioTotal
FROM G1Productos 
     INNER JOIN G1DetallesOrdenes ON G1Productos.ProductoID =G1DetallesOrdenes.ProductoID;
