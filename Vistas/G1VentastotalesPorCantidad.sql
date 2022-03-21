use G1Northwind
go

create view G1VentastotalesPorCantidad as
select G1SubtotalOrden.Subtotal,
G1Orden.OrdenId, 
G1Clientes.NombreCompañia, 
G1Orden.FechadeEntrega 
from G1Orden 
inner join G1Clientes 
on G1Clientes.ClientesID = G1Orden.ClienteID  
inner join G1SubtotalOrden
on G1Orden.OrdenId = G1SubtotalOrden.OrdenID