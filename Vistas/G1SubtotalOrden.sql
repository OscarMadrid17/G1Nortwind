use G1Northwind
Go

CREATE VIEW G1SubtotalOrden AS
Select G1DetallesOrdenes.OrdenID, sum(((G1DetallesOrdenes.PrecioUnitario*Cantidad*(1-Descuento))/100)*100) AS Subtotal
From G1DetallesOrdenes
Group By G1DetallesOrdenes.OrdenID;