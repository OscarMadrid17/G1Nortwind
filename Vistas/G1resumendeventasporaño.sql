USE G1Northwind
GO

CREATE VIEW G1resumendeventasporaño
AS 
   SELECT G1Orden.FechadeEntrega AS FechadeEntrega, 
   G1Orden.OrdenID AS OrdenID, 
   G1SubtotalOrden.Subtotal AS Subtotal
   FROM G1Orden  
      INNER JOIN G1SubtotalOrden
      ON G1Orden.OrdenID = G1SubtotalOrden.OrdenID
   WHERE G1Orden.FechadeEntrega IS NOT NULL;