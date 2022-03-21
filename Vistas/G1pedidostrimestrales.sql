USE G1Northwind
GO

CREATE VIEW G1pedidostrimestrales 
AS 
   SELECT DISTINCT 
   ClientesID AS ClientesID, 
   G1Clientes.NombreCompañia AS NombreCompañia,
   G1Clientes.Ciudad AS Ciudad, 
   G1Clientes.Pais AS Pais
   FROM G1Clientes
   INNER JOIN G1Orden
      ON G1Clientes.ClientesID = G1Orden.ClienteID
   WHERE G1Orden.FechaOrden BETWEEN '1997-01-01T00:00:00' AND '1997-12-31T00:00:00';