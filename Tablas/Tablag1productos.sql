Use g1northwind
create table g1productos
(	
	ID_Producto int Identity (1,1) not null,
	Nombre_Producto varchar(50) not null,
	ID_Proveedora int,
	ID_Categoria int,
	Cantidad_por_unidad varchar(35) not null,
	Precio_unitario decimal(10,4) not null,
	Unidades_en_existencia smallint not null,
	Unidades_en_Pedido smallint not null,
	Reordenar_nivel smallint not null,
	Interrumpido bit not null,
	Primary Key (ID_Producto) 
)