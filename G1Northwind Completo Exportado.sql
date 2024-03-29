USE [master]
GO
/****** Object:  Database [G1Northwind]    Script Date: 24/3/2022 11:48:25 ******/
CREATE DATABASE [G1Northwind]
GO
ALTER DATABASE [G1Northwind] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [G1Northwind].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [G1Northwind] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [G1Northwind] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [G1Northwind] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [G1Northwind] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [G1Northwind] SET ARITHABORT OFF 
GO
ALTER DATABASE [G1Northwind] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [G1Northwind] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [G1Northwind] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [G1Northwind] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [G1Northwind] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [G1Northwind] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [G1Northwind] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [G1Northwind] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [G1Northwind] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [G1Northwind] SET  ENABLE_BROKER 
GO
ALTER DATABASE [G1Northwind] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [G1Northwind] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [G1Northwind] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [G1Northwind] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [G1Northwind] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [G1Northwind] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [G1Northwind] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [G1Northwind] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [G1Northwind] SET  MULTI_USER 
GO
ALTER DATABASE [G1Northwind] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [G1Northwind] SET DB_CHAINING OFF 
GO
ALTER DATABASE [G1Northwind] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [G1Northwind] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [G1Northwind] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [G1Northwind] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [G1Northwind] SET QUERY_STORE = OFF
GO
USE [G1Northwind]
GO
/****** Object:  Table [dbo].[G1Clientes]    Script Date: 24/3/2022 11:48:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[G1Clientes](
	[ClientesID] [varchar](5) NOT NULL,
	[NombreCompañia] [varchar](40) NOT NULL,
	[NombreContacto] [varchar](30) NULL,
	[TituloContacto] [varchar](30) NULL,
	[Direccion] [varchar](60) NULL,
	[Ciudad] [varchar](15) NULL,
	[Region] [varchar](15) NULL,
	[CodigoPostal] [varchar](10) NULL,
	[Pais] [varchar](15) NULL,
	[Telefono] [varchar](24) NULL,
	[Fax] [varchar](24) NULL,
 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
	[ClientesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[G1Empleados]    Script Date: 24/3/2022 11:48:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[G1Empleados](
	[EmpleadoID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](20) NOT NULL,
	[Apellido] [varchar](10) NOT NULL,
	[Titulo] [varchar](30) NULL,
	[Titulo_de_cortesia] [varchar](25) NULL,
	[FechaNacimiento] [datetime] NULL,
	[FechaContratacion] [datetime] NULL,
	[Direccion] [varchar](60) NULL,
	[Ciudades] [varchar](15) NULL,
	[Region] [varchar](15) NULL,
	[CodigoPostal] [varchar](10) NULL,
	[Pais] [varchar](15) NULL,
	[TelefonoCasa] [varchar](24) NULL,
	[Extension] [varchar](4) NULL,
	[Notas] [text] NOT NULL,
	[ReportarA] [int] NULL,
	[FotoPath] [varchar](255) NULL,
	[Salario] [float] NULL,
 CONSTRAINT [PK_Empleados] PRIMARY KEY CLUSTERED 
(
	[EmpleadoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[G1DetallesOrdenes]    Script Date: 24/3/2022 11:48:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[G1DetallesOrdenes](
	[OrdenID] [int] NOT NULL,
	[ProductoID] [int] NOT NULL,
	[PrecioUnitario] [decimal](10, 4) NOT NULL,
	[Cantidad] [smallint] NOT NULL,
	[Descuento] [real] NOT NULL,
 CONSTRAINT [PK_DetallesOrdenes] PRIMARY KEY CLUSTERED 
(
	[OrdenID] ASC,
	[ProductoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[G1Orden]    Script Date: 24/3/2022 11:48:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[G1Orden](
	[OrdenID] [int] IDENTITY(1,1) NOT NULL,
	[ClienteID] [varchar](5) NULL,
	[EmpleadoID] [int] NULL,
	[FechaOrden] [datetime] NULL,
	[FechaRequerida] [datetime] NULL,
	[FechadeEntrega] [datetime] NULL,
	[EnvioVia] [int] NULL,
	[Peso] [decimal](10, 4) NULL,
	[Transporte] [varchar](40) NULL,
	[DireccionTransporte] [varchar](60) NULL,
	[CiudaddelTransporte] [varchar](15) NULL,
	[RegiondelTransporte] [varchar](15) NULL,
	[CodigoPostadelTransporte] [varchar](10) NULL,
	[PaisdelTransporte] [varchar](15) NULL,
 CONSTRAINT [PK_Orden] PRIMARY KEY CLUSTERED 
(
	[OrdenID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[G1Productos]    Script Date: 24/3/2022 11:48:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[G1Productos](
	[ProductoID] [int] IDENTITY(1,1) NOT NULL,
	[NombreProducto] [varchar](40) NOT NULL,
	[ProveedorID] [int] NULL,
	[CategoriaID] [int] NULL,
	[CantidadporUnidad] [varchar](20) NULL,
	[PrecioUnitario] [decimal](10, 4) NULL,
	[UnidadesenStock] [smallint] NULL,
	[UnidadesenOrden] [smallint] NULL,
	[NiveldeReordenamiento] [smallint] NULL,
	[Descontinuado] [bit] NOT NULL,
 CONSTRAINT [PK_Productos] PRIMARY KEY CLUSTERED 
(
	[ProductoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[G1Transportistas]    Script Date: 24/3/2022 11:48:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[G1Transportistas](
	[TransportistasID] [int] IDENTITY(1,1) NOT NULL,
	[NombreCompañia] [varchar](40) NOT NULL,
	[Telefono] [varchar](24) NULL,
 CONSTRAINT [PK_Transportistas] PRIMARY KEY CLUSTERED 
(
	[TransportistasID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[G1Facturas]    Script Date: 24/3/2022 11:48:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[G1Facturas] AS 
SELECT G1Orden.Transporte,
       G1Orden.DireccionTransporte,
       G1Orden.CiudaddelTransporte,
       G1Orden.RegiondelTransporte, 
       G1Orden.CodigoPostadelTransporte,
       G1Orden.PaisdelTransporte,
       G1Orden.ClienteID,
       G1Clientes.NombreCompañia AS NombreCliente, 
       G1Clientes.Direccion,
       G1Clientes.Ciudad,
       G1Clientes.Region,
       G1Clientes.CodigoPostal,
       G1Clientes.Pais,
       (G1Empleados.Nombre + ' ' + G1Empleados.Apellido) AS Vendedor, 
       G1Orden.OrdenID,
       G1Orden.FechaOrden,
       G1Orden.FechaRequerida,
       G1Orden.FechadeEntrega, 
       G1Transportistas.NombreCompañia As NombreTransportista,
       G1DetallesOrdenes.ProductoID,
       G1Productos.NombreProducto, 
       G1DetallesOrdenes.PrecioUnitario,
       G1DetallesOrdenes.Cantidad,
       G1DetallesOrdenes.Descuento, 
       (((G1DetallesOrdenes.PrecioUnitario*Cantidad*(1-Descuento))/100)*100) AS PrecioTotal,
       G1Orden.Peso
FROM G1Clientes
  JOIN G1Orden ON G1Clientes.ClientesID = G1Orden.ClienteID  
    JOIN G1Empleados ON G1Empleados.EmpleadoID = G1Orden.EmpleadoID   
     JOIN G1DetallesOrdenes ON G1Orden.OrdenID = G1DetallesOrdenes.OrdenID   
      JOIN G1Productos ON G1Productos.ProductoID = G1DetallesOrdenes.ProductoID      
       JOIN G1Transportistas ON G1Transportistas.TransportistasID = G1Orden.EnvioVia;
GO
/****** Object:  View [dbo].[G1ListaProductosReciente]    Script Date: 24/3/2022 11:48:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[G1ListaProductosReciente] AS
Select ProductoID,NombreProducto
From G1Productos
Where Descontinuado=0;
GO
/****** Object:  View [dbo].[G1DetallesOrdenesExtendido]    Script Date: 24/3/2022 11:48:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[G1DetallesOrdenesExtendido] AS
SELECT G1DetallesOrdenes.OrdenID, 
       G1DetallesOrdenes.ProductoID, 
       G1Productos.NombreProducto, 
	   G1DetallesOrdenes.PrecioUnitario, 
       G1DetallesOrdenes.Cantidad, 
       G1DetallesOrdenes.Descuento, 
      (G1DetallesOrdenes.PrecioUnitario*Cantidad*(1-Descuento)/100)*100 AS PrecioTotal
FROM G1Productos 
     INNER JOIN G1DetallesOrdenes ON G1Productos.ProductoID =G1DetallesOrdenes.ProductoID;
GO
/****** Object:  Table [dbo].[G1Categorias]    Script Date: 24/3/2022 11:48:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[G1Categorias](
	[CategoriasID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Categoria] [varchar](15) NOT NULL,
	[Descripcion] [text] NULL,
 CONSTRAINT [PK_Categorias] PRIMARY KEY CLUSTERED 
(
	[CategoriasID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[G1productosporcategoria]    Script Date: 24/3/2022 11:48:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[G1productosporcategoria]
AS 
   SELECT 
      G1Categorias.Nombre_Categoria AS Nombre_Categoria, 
      G1Productos.NombreProducto AS NombreProducto, 
      G1Productos.CantidadporUnidad AS CantidadporUnidad, 
      G1Productos.UnidadesenStock AS UnidadesenStock, 
      G1Productos.Descontinuado AS Descontinuado
   FROM G1Categorias
      INNER JOIN G1Productos 
      ON categoriasID = G1Productos.categoriaID
   WHERE Descontinuado  <> 1;
GO
/****** Object:  View [dbo].[G1OrdenesQry]    Script Date: 24/3/2022 11:48:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[G1OrdenesQry] AS
SELECT G1Orden.OrdenID,
		G1Orden.ClienteID,
		G1Orden.EmpleadoID,
		G1Orden.FechaOrden,
		G1Orden.FechaRequerida,
		G1Orden.FechadeEntrega,
		G1Orden.EnvioVia,
		G1Orden.Peso,
		G1Orden.Transporte,
		G1Orden.DireccionTransporte,
		G1Orden.CiudaddelTransporte,
		G1Orden.RegiondelTransporte,
		G1Orden.CodigoPostadelTransporte,
		G1Orden.PaisdelTransporte,
		G1Clientes.NombreCompañia,
		G1Clientes.Direccion,
		G1Clientes.Ciudad,
		G1Clientes.Region,
		G1Clientes.CodigoPostal,
		G1Clientes.Pais
FROM (G1Clientes JOIN G1Orden ON ((G1Clientes.ClientesID = G1Orden.ClienteID)));

GO
/****** Object:  View [dbo].[G1SubtotalOrden]    Script Date: 24/3/2022 11:48:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[G1SubtotalOrden] AS
Select G1DetallesOrdenes.OrdenID, sum(((G1DetallesOrdenes.PrecioUnitario*Cantidad*(1-Descuento))/100)*100) AS Subtotal
From G1DetallesOrdenes
Group By G1DetallesOrdenes.OrdenID;
GO
/****** Object:  View [dbo].[G1ListaAlfabetica_de_productos]    Script Date: 24/3/2022 11:48:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[G1ListaAlfabetica_de_productos]
AS
SELECT Top 100 * from G1Productos
WHERE (((G1Productos.Descontinuado)=0))
Order by NombreProducto Asc;
GO
/****** Object:  View [dbo].[G1pedidostrimestrales]    Script Date: 24/3/2022 11:48:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[G1pedidostrimestrales] 
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
GO
/****** Object:  Table [dbo].[G1Proveedores]    Script Date: 24/3/2022 11:48:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[G1Proveedores](
	[ProveedoresID] [int] IDENTITY(1,1) NOT NULL,
	[NombreCompañia] [varchar](40) NOT NULL,
	[NombreContacto] [varchar](30) NULL,
	[TituloContacto] [varchar](30) NULL,
	[Direccion] [varchar](60) NULL,
	[Ciudad] [varchar](15) NULL,
	[Region] [varchar](15) NULL,
	[CodigoPostal] [varchar](10) NULL,
	[Pais] [varchar](15) NULL,
	[Telefono] [varchar](24) NULL,
	[Fax] [varchar](24) NULL,
	[PaginaPrincipal] [text] NULL,
 CONSTRAINT [PK_Proveedores] PRIMARY KEY CLUSTERED 
(
	[ProveedoresID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[G1Clientes_y_Proveedores_por_Ciudad]    Script Date: 24/3/2022 11:48:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create View [dbo].[G1Clientes_y_Proveedores_por_Ciudad] AS
SELECT TOP 100
        G1Clientes.Ciudad AS Ciudad,
        G1Clientes.NombreCompañia AS NombreCompañia,
        G1Clientes.NombreContacto AS NombreContacto,
        'G1Clientes' AS Rela
    FROM
       G1Clientes
		UNION SELECT TOP 100
        G1Proveedores.Ciudad AS Ciudad,
        G1Proveedores.NombreCompañia AS NombreCompañia,
        G1Proveedores.NombreContacto AS NombreContacto,
        'G1Proveedores' AS Proveedores
    FROM
		G1Proveedores
    ORDER BY Ciudad , NombreCompañia
GO
/****** Object:  View [dbo].[G1VentasPorCategorias]    Script Date: 24/3/2022 11:48:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[G1VentasPorCategorias] as

select G1Categorias.CategoriasID, 
G1Categorias.Nombre_Categoria, 
G1Productos.NombreProducto,
Sum(G1DetallesOrdenesExtendido.PrecioTotal) as VentaDeProducto
from G1Categorias
inner join G1Productos 
on G1Productos.CategoriaID = G1Categorias.CategoriasID
inner join G1DetallesOrdenesExtendido
on G1Productos.ProductoID = G1DetallesOrdenesExtendido.ProductoID
inner join G1Orden
on G1Orden.OrdenID = G1DetallesOrdenesExtendido.OrdenID
 WHERE
        (G1Orden.FechaOrden BETWEEN '1997-01-01' AND '1997-12-31')
GROUP BY G1Categorias.CategoriasID, G1Categorias.Nombre_Categoria, G1Productos.NombreProducto
GO
/****** Object:  View [dbo].[G1VentastotalesPorCantidad]    Script Date: 24/3/2022 11:48:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[G1VentastotalesPorCantidad] as
select G1SubtotalOrden.Subtotal,
G1Orden.OrdenId, 
G1Clientes.NombreCompañia, 
G1Orden.FechadeEntrega 
from G1Orden 
inner join G1Clientes 
on G1Clientes.ClientesID = G1Orden.ClienteID  
inner join G1SubtotalOrden
on G1Orden.OrdenId = G1SubtotalOrden.OrdenID
GO
/****** Object:  View [dbo].[G1resumendeventasportrimestre]    Script Date: 24/3/2022 11:48:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[G1resumendeventasportrimestre]
AS 
   SELECT 
   G1Orden.FechadeEntrega AS FechadeEntrega, 
   G1Orden.OrdenID AS OrdenID, 
   G1SubtotalOrden.Subtotal AS Subtotal
   FROM G1Orden 
      INNER JOIN G1SubtotalOrden
      ON G1Orden.OrdenID = G1SubtotalOrden.OrdenID
   WHERE G1Orden.FechadeEntrega IS NOT NULL;
GO
/****** Object:  View [dbo].[G1resumendeventasporaño]    Script Date: 24/3/2022 11:48:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[G1resumendeventasporaño]
AS 
   SELECT G1Orden.FechadeEntrega AS FechadeEntrega, 
   G1Orden.OrdenID AS OrdenID, 
   G1SubtotalOrden.Subtotal AS Subtotal
   FROM G1Orden  
      INNER JOIN G1SubtotalOrden
      ON G1Orden.OrdenID = G1SubtotalOrden.OrdenID
   WHERE G1Orden.FechadeEntrega IS NOT NULL;
GO
/****** Object:  View [dbo].[G1Ventas1997]    Script Date: 24/3/2022 11:48:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[G1Ventas1997] AS
    SELECT G1Categorias.Nombre_Categoria AS NombreCategoria,
        G1Productos.NombreProducto AS NombreProducto,
        SUM(((((G1DetallesOrdenes.PrecioUnitario * G1DetallesOrdenes.Cantidad) * (1 - G1DetallesOrdenes.Descuento)) / 100) * 100)) AS Ventas
    FROM G1Categorias
        INNER JOIN G1Productos ON G1Categorias.CategoriasID = G1Productos.CategoriaID
        INNER JOIN G1DetallesOrdenes ON G1Productos.ProductoID = G1DetallesOrdenes.ProductoID
        INNER JOIN G1Orden ON G1Orden.OrdenID = G1DetallesOrdenes.OrdenID
    WHERE
        (G1Orden.FechadeEntrega BETWEEN '1997-01-01' AND '1997-12-31')
    GROUP BY G1Categorias.Nombre_Categoria , G1Productos.NombreProducto
GO
/****** Object:  View [dbo].[G1productossobrepreciomedio]    Script Date: 24/3/2022 11:48:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[G1productossobrepreciomedio] AS
    SELECT 
        G1Productos.NombreProducto AS NombreProducto,
        G1Productos.PrecioUnitario AS PrecioUnitorio
    FROM
        G1Productos
    WHERE (G1Productos.PrecioUnitario > 
		(SELECT AVG(G1Productos.PrecioUnitario)
            FROM G1Productos))
GO
/****** Object:  Table [dbo].[G1ClientesClientesDemo]    Script Date: 24/3/2022 11:48:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[G1ClientesClientesDemo](
	[ClientesID] [varchar](5) NOT NULL,
	[ClienteTipoID] [varchar](10) NOT NULL,
 CONSTRAINT [PK_ClientesClientesDemo] PRIMARY KEY CLUSTERED 
(
	[ClientesID] ASC,
	[ClienteTipoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[G1DemograficasClientes]    Script Date: 24/3/2022 11:48:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[G1DemograficasClientes](
	[ClientesTipoID] [varchar](10) NOT NULL,
	[ClientesDescripcion] [text] NULL,
 CONSTRAINT [PK_DemograficasClientes] PRIMARY KEY CLUSTERED 
(
	[ClientesTipoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[G1Region]    Script Date: 24/3/2022 11:48:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[G1Region](
	[RegionID] [int] NOT NULL,
	[DescripcionRegion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Region] PRIMARY KEY CLUSTERED 
(
	[RegionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[G1Territorios]    Script Date: 24/3/2022 11:48:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[G1Territorios](
	[TerritorioID] [varchar](20) NOT NULL,
	[DescripcionTerritorio] [varchar](50) NOT NULL,
	[RegionID] [int] NOT NULL,
 CONSTRAINT [PK_Territorios] PRIMARY KEY CLUSTERED 
(
	[TerritorioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[G1TerritoriosEmpleados]    Script Date: 24/3/2022 11:48:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[G1TerritoriosEmpleados](
	[EmpleadoID] [int] NOT NULL,
	[TerritorioID] [varchar](20) NOT NULL,
 CONSTRAINT [PK_TerritoriosEmpleados] PRIMARY KEY CLUSTERED 
(
	[EmpleadoID] ASC,
	[TerritorioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[G1Categorias] ON 
TRUNCATE TABLE G1Categorias
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (1, N'bebidas', N'refrescantes y dulces')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (2, N'jardin', N'todo para su patio')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (3, N'automotriz', N'todo para su vehiculo')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (4, N'mariscos', N'comida maritima frescas')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (5, N'cereales', N'cereal de maiz y granola')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (6, N'especias', N'especias don julio')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (7, N'verduras', N'frescas y deliciosas')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (8, N'hogar', N'calidad y precio')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (9, N'electricidad', N'foco siempre alerta')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (10, N'construccion', N'todo lo que necesita')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (11, N'fontaneria', N'sin fugas en ningun lugar')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (12, N'herraje', N'para que no te quedes afuer')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (13, N'herr electricas', N'todo para su mantenimiento')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (14, N'jardineria', N'todo para el jardin')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (15, N'lamparas', N'que no se te queme el foco')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (16, N'loza', N'para tu trono lo mas comodo')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (17, N'ceramica', N'variedad y calidad garantizada')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (18, N'mascotas', N'para el consentido de 4 patas')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (19, N'papeleria', N'todo en utiles escolaras')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (20, N'pinturas', N'para ese artista que llevas dentro')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (21, N'tecnologia', N'lo ultimo en la vanguardia tecnologica')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (22, N'navidad', N'para esas celebraciones especiales')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (23, N'aborroteria', N'todo lo que necesite en abarroteria')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (24, N'abrillantadores', N'para tu auto consentido')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (25, N'pastas', N'todo tipo de pastas al mejor precio')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (26, N'acc automoviles', N'para consentir a tu bebe de 8 cilindros')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (27, N'Aceites', N'calidad y densidad de alta calidad')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (28, N'grasas', N'animal y vegetal')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (29, N'alfombras', N'de todos los tipos')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (30, N'revestimientos', N'de todo tipo y calidad')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (31, N'aromatizantes', N'para eliminar el mal olor')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (32, N'Inversor poten', N'para todo uso')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (33, N'art limpieza', N'versatilidad al alcance de su bolsillo')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (34, N'art  medicion', N'calidad garantizada')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (35, N'aspiradoras', N'potencia y precio al alcance de su mano')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (36, N'baterias', N'de todo tipo y todas las categorias')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (37, N'infladores', N'bombas para todo tipo de transporte y mas')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (38, N'bombas trasegar', N'de agua y de aire')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (39, N'bombillos', N'para todo tipo de autos')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (40, N'cintas adhesiv', N'calidad superior')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (41, N'extintores', N'para todo tipo de situaciones')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (42, N'fusibles bujias', N'para que no te vuelva a apagar el foco')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (43, N'gatos hidraulic', N'para que no te quedes vendido a mitad de la calle')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (44, N'guantes', N'para todo tipo de situaciones')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (45, N'herr neumaticas', N'todo para cualquier emergencia')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (46, N'jugos', N'para todas las edades')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (47, N'cafe y azucares', N'indispensable en tu hogar')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (48, N'cereales grano', N'para empezar bien el dia')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (49, N'frijoles', N'indespensable en la dieta nacional')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (50, N'Arroz', N'indispensable en la dieta nacional')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (51, N'harinas', N'para el italiano que llevas dentro')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (52, N'pastas', N'para el italiano que llevas dentro')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (53, N'Leche', N'leyde calidad superior')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (54, N'Malteadas', N'ricas y nutritivas')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (55, N'limpieza', N'todo para el hogar')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (56, N'mantequilla', N'calidad superior')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (57, N'aceites', N'de todos los tipos existentes')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (58, N'panaderia', N'de todas las harinas disponibles')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (59, N'tortillas', N'hechas con amor')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (60, N'salsas aderezos', N'calidad garantizada')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (61, N'snacks', N'para tus antojitos nocturnos')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (62, N'sopas y cremas', N'de todos los sabores existentes')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (63, N'abonos', N'para el cuidado de tus plantas')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (64, N'fertilizantes', N'tus plantas te lo agradeceran')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (65, N'acampar', N'saca tu espiritu aventurero')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (66, N'pesca', N'para los amantes del buen gusto')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (67, N'acc acampar', N'todo lo que necesitas en un solo lugar')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (68, N'acc jardin', N'lo ultimo en belleza jardinera')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (69, N'acc bicicleta', N'que esas ruedas marquen historia')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (70, N'acc manguera', N'para estar full equipados')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (71, N'aceite antorcha', N'para que la luz no te de una mala sorpresa')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (72, N'aditivo piscina', N'para tu toque personal divertido')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (73, N'adornos jardin', N'todo lo necesario aqui')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (74, N'antorchas', N'utiles en muchas situaciones')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (75, N'apaga fuegos', N'para cualquier emergerncia no deseada')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (76, N'banquetas', N'para toda la familia')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (77, N'asientos', N'de todo tipo y calidad garantizada')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (78, N'bombas fumigar', N'para todo tipo de situaciones')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (79, N'bombas inflar', N'para peques y grandes')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (80, N'carpas', N'para variedad de eventos')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (81, N'toldos', N'para variedad de eventos')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (82, N'lonas accesori', N'para variedad de eventos')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (83, N'cilindros gas', N'para variedad')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (84, N'cortagrama', N'variedad garantizada')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (85, N'engrapadoras', N'variedad al estilo')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (86, N'clavadoras', N'calidad de primera mano')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (87, N'fuentes', N'para ese toque especial')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (88, N'grapas', N'repuestos de todo tipo')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (89, N'grifos', N'de todo tipo')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (90, N'valvulas', N'calidad garantizada')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (91, N'hachas', N'de todo tipo y calidad')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (92, N'herr multipropo', N'para todo tipo de situaciones')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (93, N'herr jardineria', N'se ocupa estar preparado')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (94, N'insencticidas', N'mata plagas de primera')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (95, N'repelentes', N'individuo preparado vale por dos')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (96, N'jaulas', N'de todo tipo y calidad')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (97, N'lamparas techo', N'para ese toque especial para tu hogar')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (98, N'desinfectantes', N'limpieza siempre a la mano')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (99, N'maceteras', N'de todos los tipos que te gustan')
GO
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (100, N'machetes', N'para el olanchano que llevas dentro')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (101, N'mallas alambres', N'para mejorar tu casa')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (102, N'mesas', N'calidad indiscutible')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (103, N'mueble exterior', N'calidad en exteriores')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (104, N'muebles jardin', N'siempre se necesita uno')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (105, N'navaja cuchillo', N'para todo tipo de cortes')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (106, N'overoles', N'para ir preparado')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (107, N'palas', N'no deja rastro ni de las personas')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (108, N'plantas artific', N'nunca estan de mas')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (109, N'protec personal', N'siempre precavido')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (110, N'rastrillo', N'para limpieza exterior')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (111, N'recipientes', N'de grandes y bajos')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (112, N'rejillas', N'para todos los reales')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (113, N'rociadores', N'potencia tu jardin')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (114, N'aspersores', N'potencia tu jardin')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (115, N'semillas', N'de todo tipo')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (116, N'sierras', N'saca el JSON que llevas dentro')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (117, N'tijeras', N'potencia tu jardin')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (118, N'sombrillas', N'para situaciones imprevistas')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (119, N'ahuyentadores', N'para esas plagas indeseadas')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (120, N'azulejo', N'toque especial indiscutible')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (121, N'bañeras', N'calidad insuperable')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (122, N'grifos valvulas', N'sostenibilidad a largo plazo')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (123, N'Inodoros', N'para el trono de su majestad')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (124, N'lavabos', N'calidad siempre a su alcance')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (125, N'lavamanos', N'uselo sabiamente')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (126, N'molduras acc', N'repuestos de calidad')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (127, N'muebles baños', N'comodidad y belleza')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (128, N'porcelanato', N'belleza y calidad juntas')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (129, N'juguet mascotas', N'para su consentido mamifero')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (130, N'collares', N'de todo tipo')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (131, N'pecheras', N'calidad garantizada')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (132, N'alimen mascotas', N'para todo tipo')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (133, N'acc oficina', N'calidad de legitima procedencia')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (134, N'tableros', N'de todo tipo y color')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (135, N'sobres', N'calidad al alcance de sus manos')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (136, N'perchero gancho', N'especiales para el regreso a clases')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (137, N'arte manualida', N'saca el artista que llevas dentro')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (138, N'art medicion', N'para arquitectos y amantes de las medidad')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (139, N'art dibujar', N'saca a tu infante interior')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (140, N'art fiesta', N'que no te agarre desprevenido')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (141, N'pulidora piso', N'para acabados mas brillantes')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (142, N'basculas', N'hecho a la medida')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (143, N'balanzas', N'hecho a la medida')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (144, N'cajas', N'siempre listas')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (145, N'carretas', N'a la orden del dia')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (146, N'cepillos', N'limpieza la orden del dia')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (147, N'basureros', N'toda cosa en su lugar')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (148, N'bolsas multiuso', N'para todo tipo de situacion')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (149, N'esponjas pastes', N'para la limpieza al dia')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (150, N'cober lavadoras', N'para mantenerlos limpios')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (151, N'cojines', N'no te quedes sin el tuyo')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (152, N'cortinas', N'para consentir tu hogar')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (153, N'acc cortinas', N'te tenemos cubierto')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (154, N'cuadros', N'para inmortalizar tus momentos')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (155, N'retatreras', N'para inmortalizar tus momentos')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (156, N'adornos pared', N'te tenemos cubierto')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (157, N'delantales', N'para la cocina al dia')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (158, N'toallas', N'te tenemos cubierto')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (159, N'electrodomestic', N'todo lo que necesites')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (160, N'escobas', N'lo mas practico')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (161, N'escuadras', N'para todo los gustos y colores')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (162, N'estufas', N'indispensable en la cocina')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (163, N'elimina humedad', N'para todo lo necesario')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (164, N'cilindros gas', N'todo lo que necesites')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (165, N'fuentes', N'todo cubierto comandante')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (166, N'galletas', N'alguien dijo antojos')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (167, N'lamparas mesa', N'para un toque mas personal')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (168, N'lavanderia', N'te tenemos cubierto')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (169, N'manteles', N'para un toque mas personal')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (170, N'mantas', N'cubierto a toda hora')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (171, N'maq palomitas', N'para esos fines de semana')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (172, N'masaje relajaci', N'porque te lo mereces')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (173, N'molinos', N'te tenemos cubierto')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (174, N'neveras', N'todo en frigorificos')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (175, N'hieleras', N'todo lo que tu cuerpo necesita')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (176, N'termos', N'te tenemos cubierto')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (177, N'ollas', N'tu cocina te lo agradecera')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (178, N'frideras', N'todo para tu cocina')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (179, N'papel higienico', N'limpieza al alcance de tu mano')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (180, N'papel toalla', N'te tenemos cubierto')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (181, N'para empaque', N'todo cubierto master')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (182, N'pelador naranja', N'necesaria en tu vida al encontrarla')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (183, N'planchadores', N'indispensable en tu hogar')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (184, N'plasticos', N'responsables con el ambiente')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (185, N'primero auxilio', N'te tenmos cubierto')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (186, N'purifi ambiente', N'tu casa te lo agradecera')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (187, N'recipientes', N'para todo tipo de liquido')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (188, N'relojes mesa', N'que no se te pierda la hora')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (189, N'relojes pared', N'una hora excepcional')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (190, N'reposteria', N'todo lo que necesites chef')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (191, N'termomet cocina', N'todo bajo presion')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (192, N'termos alimento', N'para cuando salgas de casa')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (193, N'termos bebidad', N'calientes o frias, tu decides')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (194, N'uso personal', N'todo lo que necesites')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (195, N'vajillas', N'calidad garantizada')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (196, N'cubiertos', N'que no te falte nada')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (197, N'varios', N'de todo un poco')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (198, N'acc hogar', N'todo lo que necesites en un solo lugar')
INSERT [dbo].[G1Categorias] ([CategoriasID], [Nombre_Categoria], [Descripcion]) VALUES (199, N'acc cocina', N'no te preocupes, te tenemos cubierto')
GO
SET IDENTITY_INSERT [dbo].[G1Categorias] OFF
GO
TRUNCATE TABLE G1Clientes
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'1', N'Apple Inc', N'Angelino Grau', N'Vendedor', N'Calle agustin lara no. 69-b', N'Tuxtepec', N'Oaxaca', N'68370', N'México', N'2875278152', N'5664919245')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'10', N'Berkshire Hath', N'Teresita Jordá Arranz', N'Gerente de producción', N'Av. 20 de noviembre no 1053', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'9632587458', N'9871722783')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'100', N'Linde Plc', N'Viviana Muro-Portero', N'Gerente de contaduría', N'Av independencia no 219', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'2535307996', N'8376304926')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'101', N'Sap Se', N'Glauco Larrañaga Salom', N'Vendedor', N'Av. Independencia no. 545-d', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'4047027978', N'6093295383')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'102', N'Aia', N'Casemiro Jara Riba', N'Guardia', N'Av. Independencia no. 740', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'3056905695', N'5623664627')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'103', N'Wells Fargo & Co', N'Emperatriz Vives Bellido', N'Analista de sistema', N'Matamoros no. 327', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'6175558246', N'3790186560')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'104', N'T-Mobile Us Inc', N'Susanita Amaya Villar', N'Concerje', N'Km.13 carret. Cd. Aleman-tuxtepec', N'Tuxtepec', N'Oaxaca', N'68330', N'México', N'3524241204', N'7327981618')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'105', N'Jd.Com Incdr', N'Arsenio Fábregas Castrillo', N'IT', N'Av. Independencia no. 1639', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'1370628975', N'2109903779')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'106', N'Medtronic Plc', N'Joel Moliner Manjón', N'Supervisor de ventas', N'Av.independ.no. 1065', N'México D.F.', N'México D.F.', N'68380', N'México', N'5261096116', N'7386505667')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'107', N'Danaher Corp', N'Jordi Palomo Marí', N'Gerente de mercadeo', N'Boulevar benito juarez no. 197 -a', N'Tuxtepec', N'Oaxaca', N'60350', N'México', N'1412184075', N'3031234915')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'108', N'Qualcomm Inc', N'Diego Rosell Gras', N'Diseñador', N'Independencia 1519', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'6754536753', N'9432707863')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'109', N'Royal Dutch Sh', N'Jorge Busquets Coll', N'Gerente de ventas', N'Calle morelos no. 24', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'9465556382', N'5218313558')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'11', N'TSMC', N'Leocadio Verdugo López', N'Gerente de recursos humanos', N'Blvd. Benito juarez no. 1466-a', N'Tuxtepec', N'Oaxaca', N'68335', N'México', N'7896523698', N'4968429539')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'110', N'Mcdonalds Corp', N'Encarnacion Aranda Carretero', N'Gerente de producción', N'Calle matamoros no. 225', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'6514251004', N'2802273059')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'111', N'Novo Nordisk', N'Dan Luís Cueto', N'Gerente de recursos humanos', N'Av. Independencia no. 720', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'7815171634', N'5547851319')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'112', N'Accenture Plc', N'Lola Samper Llobet', N'Control de calidad', N'Av.independencia no. 574', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'4281432684', N'8566399129')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'113', N'Kuaishou Technol', N'Álvaro Tejera', N'Asistente de administración', N'Av. Independencia no. 565-a', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'4874948144', N'7530077839')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'114', N'Shopify Inc', N'Juanita García', N'Ingeniero en sistemas', N'Av. Libertad no. 956', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'5959250465', N'1409465854')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'115', N'Texas Instrument', N'Amador Caparrós Ibáñez', N'Asistente de mercadeo', N'Av. Libertad no. 897', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'8579519991', N'7539536320')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'116', N'Sony Corp', N'Josefina Solís Terrón', N'Gerente administración', N'Principal s/n. Temazcal.', N'Tuxtepec', N'Oaxaca', N'68430', N'México', N'5001936975', N'1505061556')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'117', N'Siemens', N'Débora Jimenez Vilaplana', N'Servicio al cliente', N'Hidalgo no. 96', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'5287617227', N'4520595969')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'118', N'Philip Morris', N'Cloe Gallego', N'Auxiliar de contaduría', N'Calle hidalgo no.96', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'6077373466', N'2324721887')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'119', N'Amgen Inc', N'Jose Ignacio de Huerta', N'Diseño de animaciones', N'Av. Independencia no. 1457', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'5437619885', N'4777637233')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'12', N'Visa Inc', N'Iris Pino Abascal', N'Control de calidad', N'Calle matamoros no.280', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'4589632059', N'9365748918')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'120', N'Linde Plc', N'Celso Landa-Duarte', N'Gerente de contaduría', N'Av. 5 de mayo no. 551', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'8776092439', N'3163511820')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'121', N'Citigroup Inc', N'Isaías Alberdi', N'Vendedor', N'Calle aldama no. 99', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'7548756855', N'7371399936')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'122', N'Bristol-Myer Sqb', N'Carina Pina Raya', N'Guardia', N'Av. 20 de noviembre no. 1121', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'4122216607', N'1962368477')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'123', N'United Parcel', N'Filomena Manjón Valbuena', N'Analista de sistema', N'Av. 5 de mayo no. 1953', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'3832085930', N'3210244238')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'124', N'Unilever Plc', N'Lupita Tomas Ferrer', N'Concerje', N'Calle aldama no.720', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'3860136107', N'5758959326')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'125', N'Bank Of China-H', N'Adora Samper-Soler', N'IT', N'Av. 18 de marzo esq. Blvd.m. avila camacho no. 1372', N'Tuxtepec', N'Oaxaca', N'68340', N'México', N'1204126157', N'4043845223')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'126', N'China Mobile', N'Magdalena Dulce Noriega Jurado', N'Supervisor de ventas', N'Calle aldama no. 144-a', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'5259162872', N'3922279595')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'127', N'Honeywell Intl', N'Mario del Quesada', N'Gerente de mercadeo', N'Blvd. Benito juarez no. 1291', N'Tuxtepec', N'Oaxaca', N'68335', N'México', N'3793143868', N'2699864097')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'128', N'Morgan Stanley', N'Roxana Martí', N'Diseñador', N'Av. 20 de noviembre no. 970-b', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'6560586764', N'9890996953')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'129', N'Charter Commun', N'Reyes Casal Beltran', N'Gerente de ventas', N'Calle morelos no.426', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'6779942700', N'4653515925')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'13', N'JP Morgan Chase', N'Buenaventura Milla Pallarès', N'Asistente de administración', N'Av. Independencia no. 545', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'1593578695', N'4968057576')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'130', N'Union Pac Corp', N'Ciríaco Paniagua Arévalo', N'Gerente de producción', N'Prol. Av. 5 de mayo no. 270', N'Tuxtepec', N'Oaxaca', N'68350', N'México', N'1858175939', N'2655535220')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'131', N'Costco Wholesale', N'Edgardo Arenas Maza', N'Gerente de recursos humanos', N'Libertad no. 2005', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'6554772785', N'6110616631')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'132', N'Tata Consultancy', N'Noé Venceslás Salmerón Contrer', N'Control de calidad', N'Boulevar bgenito juarez 1291', N'Tuxtepec', N'Oaxaca', N'68335', N'México', N'1576681175', N'1569322847')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'133', N'Rio Tinto Ltd', N'Isidora María Ángeles Badía Cé', N'Asistente de administración', N'20 de noviembre no. 1081', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'4611648826', N'4645464520')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'134', N'Nextera Energy', N'Ana Belén Torrent-Madrigal', N'Ingeniero en sistemas', N'Av. 20 de noviembre no. 1081', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'6519811986', N'5422253547')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'135', N'Rio Tinto Plc', N'Evaristo Herrero', N'Asistente de mercadeo', N'Av. Independencia no. 574', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'2239794684', N'4342063362')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'136', N'Apple Inc', N'Fátima Gordillo Alsina', N'Gerente administración', N'Independencia no. 605', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'2688086195', N'1880455826')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'137', N'Aramco', N'Gil Álamo Escobar', N'Servicio al cliente', N'Av. Independencia no 1021', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'7356226020', N'6987651917')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'138', N'Microsoft Corp', N'Valentina Goñi-Barrena', N'Auxiliar de contaduría', N'Hidalgo no 689', N'Tuxtepec', N'Oaxaca', N'68340', N'México', N'2829175937', N'2806300969')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'139', N'Amazon.Com Inc', N'Roxana Mancebo-Díez', N'Diseño de animaciones', N'Av. Independencia no. 497', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'4805361382', N'3999887538')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'14', N'Samsung', N'Marta Iglesia Neira', N'Ingeniero en sistemas', N'Av. Independencia no. 1282-a', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'4595859633', N'5090948327')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'140', N'Alphabet Inc', N'Javier Tejero Díez', N'Gerente de contaduría', N'Av. Independencia no. 497', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'1713488415', N'1746642053')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'141', N'Tencent', N'Alberto Carnero Galindo', N'Vendedor', N'Avenida 5 de mayo no. 1226', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'7585209822', N'6559558323')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'142', N'Facebook Inc', N'Serafina Mateu', N'Guardia', N'Av independencia no. 545-b', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'4487952746', N'2590466996')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'143', N'Tesla Inc', N'Carolina Abella', N'Analista de sistema', N'Calle matamoros no. 40', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'3611132024', N'7319174917')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'144', N'Alibaba', N'África Arjona-Cerdán', N'Concerje', N'Blvd. Manuel avila camacho 435', N'Tuxtepec', N'Oaxaca', N'68320', N'México', N'7641684212', N'1414480377')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'145', N'Berkshire Hath', N'Cipriano Ramírez Villaverde', N'IT', N'Av. 20 de noviembre no. 1105 esq.ocampo', N'México D.F.', N'México D.F.', N'68380', N'México', N'2938594707', N'5617378127')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'146', N'TSMC', N'Carmelita Núñez Peñas', N'Supervisor de ventas', N'Calle matamoros no. 147', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'5602155274', N'9040494207')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'147', N'Visa Inc', N'Fernanda Reyes Daza', N'Gerente de mercadeo', N'Av. Independencia no. 390 antes 396', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'7260760240', N'9102836627')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'148', N'JP Morgan Chase', N'Iker Roda Nevado', N'Diseñador', N'Av. 20 de noviembre no. 1027', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'6358809327', N'2802192512')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'149', N'Samsung', N'Roberto Chaparro Navarro', N'Gerente de ventas', N'Av. Independencia no.745-bis', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'9997700200', N'1866993274')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'15', N'Johnson&Johnson', N'Maribel Rosselló Guardia', N'Asistente de mercadeo', N'Calle matamoros no. 127', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'2236696993', N'3993808558')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'150', N'Johnson&Johnson', N'Maxi del Goicoechea', N'Gerente de producción', N'Av. Jesus carranza no. 123', N'Tuxtepec', N'Oaxaca', N'68340', N'México', N'8133710653', N'1861453978')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'151', N'Kweichow Mouta', N'Maribel Sola Sureda', N'Gerente de recursos humanos', N'Av. Jesus carranza no. 123', N'Tuxtepec', N'Oaxaca', N'68340', N'México', N'6080960980', N'9650550878')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'152', N'Walmart Inc', N'Zoraida Alcántara Puig', N'Control de calidad', N'Av. 20 de nov. No. 1372', N'México D.F.', N'México D.F.', N'68380', N'México', N'9679701776', N'2894109406')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'153', N'Mastercard Inc', N'Clara Piñol Cañizares', N'Asistente de administración', N'Av. 5 de mayo no.1380', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'1931210819', N'3430366454')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'154', N'Walt Disney Co', N'Nieves Laguna Gordillo', N'Ingeniero en sistemas', N'Av. Independencia no.117 esq.arista', N'México D.F.', N'México D.F.', N'68380', N'México', N'8061322198', N'5775264214')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'155', N'Nvidia Corp', N'Eloy Hierro-Garcés', N'Asistente de mercadeo', N'20 de noviembre 1501', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'4254553754', N'8024958491')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'156', N'Lvmh Moet Henne', N'Loreto Maxi Pera Castrillo', N'Gerente administración', N'Independencia 85', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'8345487607', N'9017838228')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'157', N'Unitedhealth Grp', N'Chus Mas Cazorla', N'Servicio al cliente', N'Daniel soto no.370', N'Tuxtepec', N'Oaxaca', N'68320', N'México', N'1842297725', N'5823102593')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'158', N'Paypal Holdings', N'Dorita del Moliner', N'Auxiliar de contaduría', N'Av. Independencia no. 611', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'7549964840', N'3374958780')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'159', N'Procter & Gamble', N'Natalia Asenjo Almazán', N'Diseño de animaciones', N'Av. Independencia no. 413', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'8773505473', N'6824783709')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'16', N'Kweichow Mouta', N'Gerónimo Parra Sans', N'Gerente administración', N'Av.independencia no.1010', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'5569698869', N'6980001959')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'160', N'Bank Of America', N'Rosa Cardona-Baró', N'Gerente de contaduría', N'Calle ocampo no.420', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'8842532270', N'5427668546')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'161', N'Nestlé', N'Leonardo Caparrós Bárcena', N'Vendedor', N'Prolong. Independencia no. 2237', N'Tuxtepec', N'Oaxaca', N'68350', N'México', N'4961446401', N'3635192189')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'162', N'Roche', N'Mireia Rico', N'Guardia', N'Av. Independencia no. 718', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'6406049214', N'5677358824')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'163', N'ICBC', N'Rosaura Mata Arias', N'Analista de sistema', N'Av. 1o. De mayo no. 29', N'Tuxtepec', N'Oaxaca', N'68320', N'México', N'7857861291', N'3374596492')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'164', N'Home Depot Inc', N'Bautista Martinez-Vidal', N'Concerje', N'Calle aldama no.233-a', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'8420331282', N'7422587470')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'165', N'Meituan', N'Anselmo Abad Montenegro', N'IT', N'Av. Independencia no.147', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'5663580352', N'8704759724')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'166', N'Intel Corp', N'Eric de Ureña', N'Supervisor de ventas', N'Independencia no. 569 b', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'1889620803', N'1023494241')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'167', N'Comcast Corp', N'Eusebio Melero Tejada', N'Gerente de mercadeo', N'Libertad 56', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'7244795730', N'8789651475')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'168', N'Toyota Motor', N'Chuy Alcalá Vergara', N'Diseñador', N'Calle melchor ocampo no. 635', N'Tuxtepec', N'Oaxaca', N'68320', N'México', N'6493065146', N'8176788101')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'169', N'Netflix Inc', N'Faustino Casas Patiño', N'Gerente de ventas', N'Av. Independencia no.1004', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'2478247721', N'9829941327')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'17', N'Walmart Inc', N'Dolores Carbajo-Paredes', N'Servicio al cliente', N'Av. 5 de mayo no. 1652', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'9969586330', N'6689885693')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'170', N'ASML Holding', N'Aitor Manso-Juárez', N'Gerente de producción', N'Av. 5 de mayo no. 1637', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'4520392457', N'9478357278')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'171', N'Ping An', N'Lourdes Acosta Villaverde', N'Gerente de recursos humanos', N'Av. 5 de mayo 1634', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'7313054837', N'5938363408')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'172', N'Exxon Mobil Corp', N'Víctor Garriga Vendrell', N'Control de calidad', N'Ponciano arriaga no. 43', N'Tuxtepec', N'Oaxaca', N'68360', N'México', N'4155469035', N'1118024841')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'173', N'Verizon Communic', N'Custodio Sanmiguel Mayoral', N'Asistente de administración', N'Calle matamoros no.29-3', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'4998944871', N'8553927428')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'174', N'Adobe Inc', N'Encarnación Salazar Rovira', N'Ingeniero en sistemas', N'Av. Jesus carranza no. 1067', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'4894443488', N'3079662148')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'175', N'Nike Inc', N'Jose Miguel Pineda Franco', N'Asistente de mercadeo', N'Av. Ferrocarril s/n.', N'Tuxtepec', N'Oaxaca', N'68441', N'México', N'3832270085', N'7845064239')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'176', N'Abbott Labs', N'Gabriela Sedano Castro', N'Gerente administración', N'Av. 5 de mayo no.1544', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'4233177511', N'3853579794')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'177', N'Coca-Cola Co', N'Angélica de Mendizábal', N'Servicio al cliente', N'Matamoros no. 138', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'8915285277', N'8235431965')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'178', N'Novartis', N'Luciana Elena Román Casas', N'Auxiliar de contaduría', N'Av. 20 de noviembre no. 1037', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'8302203815', N'3622767555')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'179', N'Pinduoduo Inc', N'Fabio Busquets-Macías', N'Diseño de animaciones', N'Av. 20 de noviembre no. 1037', N'México D.F.', N'México D.F.', N'68380', N'México', N'2255603566', N'7568993434')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'18', N'Mastercard Inc', N'Joan Zamora', N'Auxiliar de contaduría', N'Av. 5 de mayo no. 1108', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'8589636574', N'5474086035')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'180', N'L’Oreal', N'Oriana Roma Carreras', N'Gerente de contaduría', N'Av. 20 de noviembre no. 1139-b', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'1117112365', N'2158970737')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'181', N'Ccb-H', N'Odalis Arnau', N'Vendedor', N'Av. 20 de noviembre no50221', N'Tuxtepec', N'Oaxaca', N'2011', N'México', N'9714750414', N'8055313317')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'182', N'AT&T Inc', N'Marcelo del Gascón', N'Guardia', N'Av. 5 de mayo no. 1350', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'3067079315', N'4265845647')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'183', N'Salesforce.Com', N'Donato Estrada', N'Analista de sistema', N'Av. Independencia no. 393', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'9653611125', N'6040905229')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'184', N'China Merch Bk', N'Edmundo Pont Alcaraz', N'Concerje', N'Bulevar no810', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'3699768074', N'2883169644')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'185', N'Eli Lilly & Co', N'Eliseo Planas Marín', N'IT', N'Calle sebastian ortiz no.549', N'Tuxtepec', N'Oaxaca', N'68321', N'México', N'8430096208', N'1127716768')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'186', N'Softbank Group C', N'Francisco Javier Manzano Acost', N'Supervisor de ventas', N'Calle morelos no. 30', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'6204893662', N'2720526591')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'187', N'Chevron Corp', N'Rosa María Donaire Villalba', N'Gerente de mercadeo', N'Calle morelos no. 330 int.2', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'6751012977', N'8391685262')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'188', N'Prosus Nv', N'Juliana Esteban', N'Diseñador', N'Av 5 de mayo 659', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'6032331367', N'1334961452')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'189', N'Broadcom Inc', N'Epifanio Jara-Balaguer', N'Gerente de ventas', N'Ocampo 38', N'Tuxtepec', N'Oaxaca', N'68305', N'México', N'5001202400', N'1687276803')
GO
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'19', N'Walt Disney Co', N'Patricio de Carreño', N'Diseño de animaciones', N'Av. Independencia no. 748', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'9965895636', N'1706085654')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'190', N'Abbvie Inc', N'Anita Cadenas Alba', N'Gerente de producción', N'Av. 20 de noviembre no. 1070', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'9720224547', N'7111553168')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'191', N'Oracle Corp', N'Concepción Bastida Herrera', N'Gerente de recursos humanos', N'Av. 5 de mayo no. 1401', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'6970782817', N'3128415318')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'192', N'Cisco Systems', N'Edu Ariño Juan', N'Control de calidad', N'Av. Independencia n0.1166', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'9767682928', N'1064188246')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'193', N'Reliance Inds', N'Eric Morales', N'Asistente de administración', N'Av. 20 de noviembre no. 964', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'2268768949', N'7155447979')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'194', N'Pfizer Inc', N'Benita Boada', N'Ingeniero en sistemas', N'Av. 20 de noviembre no. 933', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'9007736017', N'6462135065')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'195', N'Merck & Co', N'Amada Candela Oliveras Muro', N'Asistente de mercadeo', N'Av. Independencia no. 1811', N'México D.F.', N'México D.F.', N'68380', N'México', N'7493809703', N'7021500398')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'196', N'Bhp Group Ltd', N'Nicanor Cal Ortega', N'Gerente administración', N'Calle ocampo no.266', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'2883806276', N'5124537044')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'197', N'Pepsico Inc', N'Erasmo Catalá Roig', N'Servicio al cliente', N'Av. Independencia no. 1162', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'4033282986', N'3643856906')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'198', N'Thermo Fisher', N'Emilio Cueto Valle', N'Auxiliar de contaduría', N'Av. Independencia n0.900', N'México D.F.', N'México D.F.', N'68380', N'México', N'9150326593', N'8991665193')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'199', N'ABC', N'Maite Mayoral Chaves', N'Diseño de animaciones', N'Av. Independencia no.900', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'1552871160', N'5810158618')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'2', N'Aramco', N'Amelia Marcos Flor', N'Guardia', N'Av. Independencia no. 241', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'9287500172', N'2502771683')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'20', N'Nvidia Corp', N'Juana Mínguez Goñi', N'Gerente de contaduría', N'Av. Independencia no. 985-a', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'9696325896', N'9305932018')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'200', N'Wuliangye Yibi', N'Anunciación Planas', N'Gerente de contaduría', N'Calle aldama no.53', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'4658291951', N'1470110762')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'201', N'Supermercados Sabeco', N'Bruno Santos', N'Auditora ', N'Ps. de la Castellana, 95. ', N'León', N'Madrid', N'28046', N'España', N'948368101', N'328325892')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'21', N'Lvmh Moet Henne', N'Tadeo Guerra Cárdenas', N'Vendedor', N'Av. Independencia no. 985-a', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'9693259658', N'6535064620')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'22', N'Unitedhealth Grp', N'Bernardo Sedano', N'Guardia', N'Blvd. Benito juarez s / n', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'9695452563', N'1179102121')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'23', N'Paypal Holdings', N'Natividad Navas Roselló', N'Analista de sistema', N'Matamoros no 149', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'7875896632', N'6418689325')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'24', N'Procter & Gamble', N'Manu Sáez Araujo', N'Concerje', N'Av. 5 de mayo no 1100-a', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'5568597458', N'7926197319')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'25', N'Bank Of America', N'Eric Pascual Segarra', N'IT', N'Av. 20 de noviembre no 1540', N'México D.F.', N'México D.F.', N'68380', N'México', N'3305698596', N'1208091248')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'26', N'Nestlé', N'Paulina Expósito Gimenez', N'Supervisor de ventas', N'Av. 5 de mayo no 1253', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'6965859632', N'4648710684')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'27', N'Roche', N'Francisca Roura-Navarro', N'Gerente de mercadeo', N'Calle ocampo no 14', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'5504849963', N'1691138048')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'28', N'ICBC', N'Eulalia de Cabello', N'Diseñador', N'Blvd. Benito juarez esq. 20 de noviembre s/n', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'5128753777', N'4428709768')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'29', N'Home Depot Inc', N'Concha Crespi Font', N'Gerente de ventas', N'Calle aldama no 156', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'4458596526', N'1530210125')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'3', N'Microsoft Corp', N'Agustina Marco Carbajo', N'Analista de sistema', N'Av. Independencia no. 779', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'2569635896', N'2108627820')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'30', N'Meituan', N'Blanca Palma Solana', N'Gerente de producción', N'Av. Independencia no 145', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'4528753090', N'4679619596')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'31', N'Intel Corp', N'Josefa Álvaro', N'Gerente de recursos humanos', N'Av. 20 de noviembre no 1046', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'2875431255', N'2634754870')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'32', N'Comcast Corp', N'Prudencia del Ayala', N'Control de calidad', N'Calle ignacio rayon no.949', N'Tuxtepec', N'Oaxaca', N'68340', N'México', N'9128752569', N'5731692658')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'33', N'Toyota Motor', N'Florinda Segura Álvaro', N'Asistente de administración', N'Calle ignacio rayon no.934', N'Tuxtepec', N'Oaxaca', N'68340', N'México', N'3928752569', N'3316794559')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'34', N'Netflix Inc', N'Roxana Jódar', N'Ingeniero en sistemas', N'Av. 20 de nov. No. 881 esq. Aldama', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'9279153219', N'1299206222')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'35', N'ASML Holding', N'Cleto Samu Solís Rosa', N'Asistente de mercadeo', N'Av. 20 de noviembre no. 1178', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'9128751547', N'8885542002')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'36', N'Ping An', N'Susanita Patricia Mayo Belda', N'Gerente administración', N'Av. 5 de mayo no. 1226', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'5128751961', N'3971015248')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'37', N'Exxon Mobil Corp', N'Vicenta Iborra', N'Servicio al cliente', N'Av. Independencia s/n ext. Del mercado central esq. Benito', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'9628753656', N'1430839854')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'38', N'Verizon Communic', N'Marina Cerezo', N'Auxiliar de contaduría', N'Matamoros no 85 esq. 20 de noviembre', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'2328753665', N'5103578468')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'39', N'Adobe Inc', N'Laura Caparrós Santamaria', N'Diseño de animaciones', N'Av. 20 de noviembre no 1320', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'5896584595', N'7906365906')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'4', N'Amazon.Com Inc', N'Claudia de Mateo', N'Concerje', N'Av. 20 de noviembre no.1024', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'45896311566', N'8351569376')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'40', N'Nike Inc', N'Juan Luis Cabanillas', N'Gerente de contaduría', N'Calle ocampo no. 254', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'4596635698', N'8528302988')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'41', N'Abbott Labs', N'Sebastián Ojeda Ramos', N'Vendedor', N'Av.independencia no. 678', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'4847579658', N'4614374435')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'42', N'Coca-Cola Co', N'Cecilia Murillo Salvador', N'Guardia', N'Av. Independencia n0.677', N'México D.F.', N'México D.F.', N'68380', N'México', N'4859636589', N'6885479772')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'43', N'Novartis', N'Áurea Carballo Bernal', N'Analista de sistema', N'Calle morelos no. 72-b', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'5965852569', N'3047790434')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'44', N'Pinduoduo Inc', N'Rebeca Nidia Bustamante Suárez', N'Concerje', N'Calle aldama no.50', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'2154849658', N'7166903981')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'45', N'L’Oreal', N'Toribio Nogueira Quiroga', N'IT', N'Calle ignacio matias no.6', N'Tuxtepec', N'Oaxaca', N'68320', N'México', N'2569632569', N'4698534225')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'46', N'Ccb-H', N'Paloma Porcel Jerez', N'Supervisor de ventas', N'Av. Independencia no. 670', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'5899658595', N'3908902988')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'47', N'AT&T Inc', N'María Del Carmen del Gimeno', N'Gerente de mercadeo', N'Prol.5 de mayo no.786', N'Tuxtepec', N'Oaxaca', N'68360', N'México', N'6497585958', N'1504767190')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'48', N'Salesforce.Com', N'Encarnación Barrena-Ayllón', N'Diseñador', N'Av. Libertad no. 495', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'9968596595', N'3886869771')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'49', N'China Merch Bk', N'Florina Saldaña Bauzà', N'Gerente de ventas', N'Av. 5 no. 1186 a', N'Tuxtepec', N'Oaxaca', N'68310', N'México', N'9366958965', N'6387955145')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'5', N'Alphabet Inc', N'Calixta Vives Castilla', N'IT', N'Carretera a loma alta s/n.', N'Tuxtepec', N'Oaxaca', N'68360', N'México', N'1589686952', N'6686637410')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'50', N'Eli Lilly & Co', N'Susana Tejada', N'Gerente de producción', N'Av. 5 no.1186-a', N'Tuxtepec', N'Oaxaca', N'68310', N'México', N'9699589659', N'6541128106')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'51', N'Softbank Group C', N'Maura Mateu', N'Gerente de recursos humanos', N'Av. 20 de noviembre esq. Juarez', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'6958962594', N'7448625681')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'52', N'Chevron Corp', N'Nazaret Vendrell Collado', N'Control de calidad', N'Av. Independencia n0.670', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'9663595498', N'7503182308')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'53', N'Prosus Nv', N'León Rosselló-Arce', N'Asistente de administración', N'Calle benito juarez no.495', N'Tuxtepec', N'Oaxaca', N'68340', N'México', N'9658494859', N'9424002670')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'54', N'Broadcom Inc', N'Eduardo Carrión Criado', N'Ingeniero en sistemas', N'20 de noviembre no. 955', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'5859658547', N'9496510524')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'55', N'Abbvie Inc', N'Merche Bello Casals', N'Asistente de mercadeo', N'Av. Independencia 918', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'5848475255', N'5973684851')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'56', N'Oracle Corp', N'Pastora Miró-Arcos', N'Gerente administración', N'Av independencia 565-a', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'5958595686', N'2802719239')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'57', N'Cisco Systems', N'Jose Carlos Buendía Vera', N'Servicio al cliente', N'Calle matamoros no. 325', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'4848596589', N'6058897273')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'58', N'Reliance Inds', N'Alfredo de Rozas', N'Auxiliar de contaduría', N'Calle riva palacios no. 465', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'9696369589', N'9518937277')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'59', N'Pfizer Inc', N'María Jesús Vázquez Martorell', N'Diseño de animaciones', N'Av. 20 de noviembre no. 1291', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'2526539658', N'6974162045')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'6', N'Tencent', N'Ovidio Talavera Blanca', N'Supervisor de ventas', N'Av. 20 de noviembre no. 1060', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'6587569625', N'7830970356')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'60', N'Merck & Co', N'María Teresa Mir Mariño', N'Gerente de contaduría', N'5 de mayo 1038', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'9695356565', N'4403158185')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'61', N'Bhp Group Ltd', N'Lilia Peláez Cuadrado', N'Vendedor', N'Independencia 748', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'9594848525', N'4092335639')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'62', N'Pepsico Inc', N'Jeremías del Artigas', N'Guardia', N'Av. 20 de noviembre no. 963', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'5655998585', N'1193494257')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'63', N'Thermo Fisher', N'Angelina Zaragoza-Bárcena', N'Analista de sistema', N'Av. Independencia no. 748', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'5437268906', N'3276196735')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'64', N'ABC', N'Noelia Roldán Gámez', N'Concerje', N'Av. 20 de noviembre no.1896', N'México D.F.', N'México D.F.', N'68380', N'México', N'2089243815', N'4164468727')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'65', N'Wuliangye Yibi', N'Natanael Lobato Barriga', N'IT', N'5 de mayo 1660', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'8453519199', N'4401120704')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'66', N'Novo Nordisk', N'Georgina Isaura Ricart Blázque', N'Supervisor de ventas', N'20 de noviembre esq juarez', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'6399826117', N'1765353618')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'67', N'Accenture Plc', N'Cebrián Iglesias Ariño', N'Gerente de mercadeo', N'Av. Jesus carranza no. 991', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'6011830846', N'9310217297')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'68', N'Kuaishou Technol', N'Rosalía Cornejo Bosch', N'Diseñador', N'Ocampo 254-b', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'9514386457', N'7799754007')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'69', N'Shopify Inc', N'Marc Jara Velasco', N'Gerente de ventas', N'Av. Independencia no. 240', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'9349500809', N'5573303168')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'7', N'Facebook Inc', N'Mauricio Ortuño Campillo', N'Gerente de mercadeo', N'Calle zaragoza no. 1010', N'México D.F.', N'México D.F.', N'68380', N'México', N'4568596325', N'8006301515')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'70', N'Texas Instrument', N'Pepita Manzanares Belda', N'Gerente de producción', N'Av. Independencia no. 545-d', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'4941189725', N'5655821232')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'71', N'Medtronic Plc', N'Susanita Zabaleta Saura', N'Gerente de recursos humanos', N'Av. Jesus carranza no. 60', N'Tuxtepec', N'Oaxaca', N'68340', N'México', N'3417323414', N'7460838278')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'72', N'Danaher Corp', N'Paco Esteban Abascal', N'Control de calidad', N'Av. Robertyo colorado 1350', N'Tuxtepec', N'Oaxaca', N'68321', N'México', N'3055623605', N'6737495708')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'73', N'Qualcomm Inc', N'Lara Ochoa Gomis', N'Asistente de administración', N'C. Aldama no. 153', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'8415481806', N'2777573966')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'74', N'Royal Dutch Sh', N'Pastora del Aranda', N'Ingeniero en sistemas', N'Av. Libertad no. 34', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'1722255865', N'5164493074')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'75', N'Mcdonalds Corp', N'Alondra Jover Santana', N'Asistente de mercadeo', N'Av. 20 de noviembre no. 1020', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'9155637435', N'4590629286')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'76', N'Sap Se', N'Serafina Benavente Pastor', N'Gerente administración', N'Camino loma alta no. 1000', N'Tuxtepec', N'Oaxaca', N'68350', N'México', N'2303664820', N'6621671978')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'77', N'Aia', N'Florencio Hidalgo Carlos', N'Servicio al cliente', N'Av. Independencia no. 579', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'4992487862', N'1486650280')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'78', N'Wells Fargo & Co', N'Beatriz Salas Nieto', N'Auxiliar de contaduría', N'Calle 21 de marzo no. 17', N'Tuxtepec', N'Oaxaca', N'68350', N'México', N'1138277574', N'7859758855')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'79', N'T-Mobile Us Inc', N'Guadalupe Feijoo Sureda', N'Diseño de animaciones', N'Calle matamoros no. 2-b', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'3426375051', N'6158260176')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'8', N'Tesla Inc', N'Wálter Lobato Pavón', N'Diseñador', N'Calle matamoros no. 310', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'1205997596', N'6917150516')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'80', N'Jd.Com Incdr', N'Carlito Belmonte Ferrando', N'Gerente de contaduría', N'Independencia no. 717', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'9210693369', N'7173906792')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'81', N'Costco Wholesale', N'Amor Fernández', N'Vendedor', N'18 de marzo no. 1111', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'2165682968', N'3001843950')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'82', N'Tata Consultancy', N'Dimas Segura Lastra', N'Guardia', N'Av. Independencia no. 1054', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'2939660729', N'5362539468')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'83', N'Rio Tinto Ltd', N'Martin Torrijos Castell', N'Analista de sistema', N'Aldama 19-13', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'8791958887', N'9280597893')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'84', N'Nextera Energy', N'Leandro Carbonell', N'Concerje', N'Av.libertad no. 33', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'6716556154', N'9845609655')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'85', N'Rio Tinto Plc', N'Martirio Mur Badía', N'IT', N'Av. Independencia no. 85', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'6999095974', N'6676006895')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'86', N'China Mobile', N'José Manuel Carbó Salmerón', N'Supervisor de ventas', N'Calle matamoros no. 237', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'5965711437', N'1206452558')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'87', N'Honeywell Intl', N'Raimundo Aguilera Elías', N'Gerente de mercadeo', N'Callejon de la noche triste no.23', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'4908408595', N'7444002071')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'88', N'Morgan Stanley', N'Petrona del Tejedor', N'Diseñador', N'Calle ocampo no. 231', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'1996734544', N'4869284449')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'89', N'Charter Commun', N'Consuela Cayetana Villalonga J', N'Gerente de ventas', N'Ocampo no. 231', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'7242263122', N'3577680757')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'9', N'Alibaba', N'Marcelino Perera Amador', N'Gerente de ventas', N'Av. 20 de noviembre no.859-b', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'2365654587', N'6399500115')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'90', N'Union Pac Corp', N'Amado Julián Mendez', N'Gerente de producción', N'Calle morelos no. 44', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'8958983529', N'4208421377')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'91', N'Citigroup Inc', N'Gil Hoyos-Soler', N'Gerente de recursos humanos', N'Av daniel soto 738', N'Tuxtepec', N'Oaxaca', N'68321', N'México', N'3509282923', N'8177503400')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'92', N'Bristol-Myer Sqb', N'Leire Parejo Briones', N'Control de calidad', N'Av. Independencia no. 1231 a', N'Tuxtepec', N'Oaxaca', N'68320', N'México', N'4174223069', N'8218029166')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'93', N'United Parcel', N'Patricia Adelina Sarabia Gil', N'Asistente de administración', N'Av. Independencia no. 562', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'8804330253', N'2856060470')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'94', N'Unilever Plc', N'Simón Soler Ripoll', N'Ingeniero en sistemas', N'Av. 5 de mayo no. 583', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'4092212815', N'5779676350')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'95', N'Bank Of China-H', N'Adoración Iñiguez Piña', N'Asistente de mercadeo', N'Av. Libertad no. 56', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'5755835189', N'2384389197')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'96', N'Sony Corp', N'Joel Donaire-Rozas', N'Gerente administración', N'Av. Independencia no. 500', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'4693156447', N'9836962726')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'97', N'Siemens', N'Fito Español', N'Servicio al cliente', N'Av. Independencia n0.562', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'9782728817', N'4817956967')
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'98', N'Philip Morris', N'Amaya Jimenez Jurado', N'Auxiliar de contaduría', N'Av. 20 de noviembre 795', N'Tuxtepec', N'Oaxaca', N'68300', N'México', N'4580436984', N'1724851124')
GO
INSERT [dbo].[G1Clientes] ([ClientesID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax]) VALUES (N'99', N'Amgen Inc', N'Maricela Amat Carpio', N'Diseño de animaciones', N'Av. Principal s/n.', N'Tuxtepec', N'Oaxaca', N'68430', N'México', N'1787179950', N'2814883348')
GO
TRUNCATE TABLE G1ClientesClientesDemo
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'1', N'T0001')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'10', N'T0010')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'100', N'T0100')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'101', N'T0101')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'102', N'T0102')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'103', N'T0103')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'104', N'T0104')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'105', N'T0105')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'106', N'T0106')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'107', N'T0107')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'108', N'T0108')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'109', N'T0109')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'11', N'T0011')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'110', N'T0110')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'111', N'T0111')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'112', N'T0112')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'113', N'T0113')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'114', N'T0114')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'115', N'T0115')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'116', N'T0116')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'117', N'T0117')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'118', N'T0118')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'119', N'T0119')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'12', N'T0012')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'120', N'T0120')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'121', N'T0121')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'122', N'T0122')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'123', N'T0123')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'124', N'T0124')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'125', N'T0125')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'126', N'T0126')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'127', N'T0127')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'128', N'T0128')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'129', N'T0129')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'13', N'T0013')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'130', N'T0130')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'131', N'T0131')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'132', N'T0132')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'133', N'T0133')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'134', N'T0134')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'135', N'T0135')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'136', N'T0136')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'137', N'T0137')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'138', N'T0138')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'139', N'T0139')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'14', N'T0014')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'140', N'T0140')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'141', N'T0141')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'142', N'T0142')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'143', N'T0143')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'144', N'T0144')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'145', N'T0145')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'146', N'T0146')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'147', N'T0147')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'148', N'T0148')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'149', N'T0149')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'15', N'T0015')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'150', N'T0150')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'151', N'T0151')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'152', N'T0152')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'153', N'T0153')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'154', N'T0154')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'155', N'T0155')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'156', N'T0156')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'157', N'T0157')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'158', N'T0158')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'159', N'T0159')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'16', N'T0016')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'160', N'T0160')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'161', N'T0161')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'162', N'T0162')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'163', N'T0163')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'164', N'T0164')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'165', N'T0165')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'166', N'T0166')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'167', N'T0167')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'168', N'T0168')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'169', N'T0169')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'17', N'T0017')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'170', N'T0170')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'171', N'T0171')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'172', N'T0172')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'173', N'T0173')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'174', N'T0174')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'175', N'T0175')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'176', N'T0176')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'177', N'T0177')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'178', N'T0178')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'179', N'T0179')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'18', N'T0018')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'180', N'T0180')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'181', N'T0181')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'182', N'T0182')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'183', N'T0183')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'184', N'T0184')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'185', N'T0185')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'186', N'T0186')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'187', N'T0187')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'188', N'T0188')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'189', N'T0189')
GO
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'19', N'T0019')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'190', N'T0190')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'191', N'T0191')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'192', N'T0192')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'193', N'T0193')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'194', N'T0194')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'195', N'T0195')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'196', N'T0196')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'197', N'T0197')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'198', N'T0198')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'199', N'T0199')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'2', N'T0002')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'20', N'T0020')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'200', N'T0200')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'21', N'T0021')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'22', N'T0022')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'23', N'T0023')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'24', N'T0024')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'25', N'T0025')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'26', N'T0026')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'27', N'T0027')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'28', N'T0028')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'29', N'T0029')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'3', N'T0003')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'30', N'T0030')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'31', N'T0031')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'32', N'T0032')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'33', N'T0033')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'34', N'T0034')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'35', N'T0035')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'36', N'T0036')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'37', N'T0037')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'38', N'T0038')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'39', N'T0039')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'4', N'T0004')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'40', N'T0040')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'41', N'T0041')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'42', N'T0042')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'43', N'T0043')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'44', N'T0044')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'45', N'T0045')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'46', N'T0046')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'47', N'T0047')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'48', N'T0048')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'49', N'T0049')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'5', N'T0005')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'50', N'T0050')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'51', N'T0051')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'52', N'T0052')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'53', N'T0053')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'54', N'T0054')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'55', N'T0055')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'56', N'T0056')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'57', N'T0057')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'58', N'T0058')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'59', N'T0059')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'6', N'T0006')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'60', N'T0060')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'61', N'T0061')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'62', N'T0062')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'63', N'T0063')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'64', N'T0064')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'65', N'T0065')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'66', N'T0066')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'67', N'T0067')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'68', N'T0068')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'69', N'T0069')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'7', N'T0007')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'70', N'T0070')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'71', N'T0071')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'72', N'T0072')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'73', N'T0073')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'74', N'T0074')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'75', N'T0075')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'76', N'T0076')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'77', N'T0077')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'78', N'T0078')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'79', N'T0079')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'8', N'T0008')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'80', N'T0080')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'81', N'T0081')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'82', N'T0082')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'83', N'T0083')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'84', N'T0084')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'85', N'T0085')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'86', N'T0086')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'87', N'T0087')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'88', N'T0088')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'89', N'T0089')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'9', N'T0009')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'90', N'T0090')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'91', N'T0091')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'92', N'T0092')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'93', N'T0093')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'94', N'T0094')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'95', N'T0095')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'96', N'T0096')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'97', N'T0097')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'98', N'T0098')
INSERT [dbo].[G1ClientesClientesDemo] ([ClientesID], [ClienteTipoID]) VALUES (N'99', N'T0099')
GO
TRUNCATE TABLE G1DemograficasClientes
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0001', N'Hombre de 46 años, de la cuidad de León,con codigopostal28046')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0002', N'Mujer de 34 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0003', N'Mujer de 42 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0004', N'Mujer de 40 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0005', N'Mujer de 27 años, de la cuidad de Tuxtepec,con codigopostal68360')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0006', N'Hombre de 48 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0007', N'Hombre de 47 años, de la cuidad de México D.F.,con codigopostal68380')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0008', N'Hombre de 37 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0009', N'Hombre de 32 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0010', N'Mujer de 33 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0011', N'Hombre de 39 años, de la cuidad de Tuxtepec,con codigopostal68335')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0012', N'Mujer de 39 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0013', N'Mujer de 33 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0014', N'Mujer de 33 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0015', N'Mujer de 30 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0016', N'Hombre de 44 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0017', N'Mujer de 43 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0018', N'Hombre de 37 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0019', N'Hombre de 48 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0020', N'Mujer de 49 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0021', N'Hombre de 49 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0022', N'Hombre de 45 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0023', N'Mujer de 38 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0024', N'Hombre de 27 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0025', N'Hombre de 26 años, de la cuidad de México D.F.,con codigopostal68380')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0026', N'Mujer de 44 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0027', N'Mujer de 46 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0028', N'Mujer de 25 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0029', N'Mujer de 47 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0030', N'Mujer de 40 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0031', N'Mujer de 25 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0032', N'Mujer de 38 años, de la cuidad de Tuxtepec,con codigopostal68340')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0033', N'Mujer de 30 años, de la cuidad de Tuxtepec,con codigopostal68340')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0034', N'Mujer de 50 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0035', N'Hombre de 37 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0036', N'Mujer de 26 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0037', N'Mujer de 43 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0038', N'Mujer de 26 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0039', N'Mujer de 50 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0040', N'Hombre de 47 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0041', N'Hombre de 27 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0042', N'Mujer de 36 años, de la cuidad de México D.F.,con codigopostal68380')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0043', N'Mujer de 48 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0044', N'Mujer de 48 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0045', N'Hombre de 35 años, de la cuidad de Tuxtepec,con codigopostal68320')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0046', N'Mujer de 44 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0047', N'Mujer de 44 años, de la cuidad de Tuxtepec,con codigopostal68360')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0048', N'Mujer de 47 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0049', N'Mujer de 29 años, de la cuidad de Tuxtepec,con codigopostal68310')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0050', N'Mujer de 33 años, de la cuidad de Tuxtepec,con codigopostal68310')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0051', N'Mujer de 45 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0052', N'Mujer de 48 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0053', N'Hombre de 46 años, de la cuidad de Tuxtepec,con codigopostal68340')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0054', N'Hombre de 42 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0055', N'Mujer de 47 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0056', N'Mujer de 41 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0057', N'Hombre de 29 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0058', N'Hombre de 26 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0059', N'Mujer de 41 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0060', N'Mujer de 38 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0061', N'Mujer de 49 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0062', N'Hombre de 26 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0063', N'Mujer de 28 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0064', N'Mujer de 25 años, de la cuidad de México D.F.,con codigopostal68380')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0065', N'Hombre de 47 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0066', N'Hombre de 34 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0067', N'Mujer de 47 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0068', N'Hombre de 43 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0069', N'Mujer de 36 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0070', N'Mujer de 47 años, de la cuidad de Tuxtepec,con codigopostal68340')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0071', N'Hombre de 43 años, de la cuidad de Tuxtepec,con codigopostal68321')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0072', N'Mujer de 43 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0073', N'Mujer de 26 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0074', N'Mujer de 47 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0075', N'Mujer de 27 años, de la cuidad de Tuxtepec,con codigopostal68350')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0076', N'Hombre de 49 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0077', N'Mujer de 34 años, de la cuidad de Tuxtepec,con codigopostal68350')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0078', N'Mujer de 49 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0079', N'Hombre de 36 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0080', N'Mujer de 47 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0081', N'Hombre de 38 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0082', N'Hombre de 32 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0083', N'Hombre de 37 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0084', N'Hombre de 43 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0085', N'Hombre de 37 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0086', N'Hombre de 48 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0087', N'Mujer de 44 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0088', N'Hombre de 41 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0089', N'Hombre de 31 años, de la cuidad de Tuxtepec,con codigopostal68321')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0090', N'Mujer de 34 años, de la cuidad de Tuxtepec,con codigopostal68320')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0091', N'Mujer de 46 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0092', N'Hombre de 26 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0093', N'Mujer de 40 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0094', N'Hombre de 42 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0095', N'Hombre de 41 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0096', N'Hombre de 31 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0097', N'Mujer de 25 años, de la cuidad de Tuxtepec,con codigopostal68430')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0098', N'Mujer de 25 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0099', N'Hombre de 39 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0100', N'Hombre de 46 años, de la cuidad de Tuxtepec,con codigopostal68300')
GO
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0101', N'Mujer de 46 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0102', N'Mujer de 46 años, de la cuidad de Tuxtepec,con codigopostal68330')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0103', N'Hombre de 36 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0104', N'Hombre de 30 años, de la cuidad de México D.F.,con codigopostal68380')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0105', N'Hombre de 36 años, de la cuidad de Tuxtepec,con codigopostal60350')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0106', N'Hombre de 40 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0107', N'Hombre de 29 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0108', N'Mujer de 35 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0109', N'Hombre de 32 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0110', N'Mujer de 33 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0111', N'Hombre de 40 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0112', N'Mujer de 26 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0113', N'Hombre de 35 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0114', N'Mujer de 40 años, de la cuidad de Tuxtepec,con codigopostal68430')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0115', N'Mujer de 36 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0116', N'Mujer de 41 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0117', N'Hombre de 39 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0118', N'Hombre de 47 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0119', N'Hombre de 35 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0120', N'Mujer de 29 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0121', N'Mujer de 41 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0122', N'Mujer de 35 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0123', N'Mujer de 32 años, de la cuidad de Tuxtepec,con codigopostal68340')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0124', N'Mujer de 40 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0125', N'Hombre de 26 años, de la cuidad de Tuxtepec,con codigopostal68335')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0126', N'Mujer de 29 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0127', N'Hombre de 37 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0128', N'Hombre de 45 años, de la cuidad de Tuxtepec,con codigopostal68350')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0129', N'Hombre de 40 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0130', N'Mujer de 28 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0131', N'Hombre de 34 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0132', N'Mujer de 36 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0133', N'Hombre de 28 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0134', N'Mujer de 32 años, de la cuidad de Tuxtepec,con codigopostal68340')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0135', N'Mujer de 44 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0136', N'Hombre de 49 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0137', N'Hombre de 41 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0138', N'Mujer de 28 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0139', N'Mujer de 48 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0140', N'Mujer de 39 años, de la cuidad de Tuxtepec,con codigopostal68320')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0141', N'Hombre de 27 años, de la cuidad de México D.F.,con codigopostal68380')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0142', N'Mujer de 36 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0143', N'Mujer de 26 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0144', N'Hombre de 35 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0145', N'Hombre de 49 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0146', N'Hombre de 43 años, de la cuidad de Tuxtepec,con codigopostal68340')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0147', N'Mujer de 38 años, de la cuidad de Tuxtepec,con codigopostal68340')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0148', N'Mujer de 27 años, de la cuidad de México D.F.,con codigopostal68380')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0149', N'Mujer de 49 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0150', N'Mujer de 33 años, de la cuidad de México D.F.,con codigopostal68380')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0151', N'Hombre de 33 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0152', N'Hombre de 30 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0153', N'Hombre de 41 años, de la cuidad de Tuxtepec,con codigopostal68320')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0154', N'Mujer de 47 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0155', N'Mujer de 36 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0156', N'Mujer de 32 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0157', N'Hombre de 47 años, de la cuidad de Tuxtepec,con codigopostal68350')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0158', N'Mujer de 36 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0159', N'Mujer de 33 años, de la cuidad de Tuxtepec,con codigopostal68320')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0160', N'Mujer de 43 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0161', N'Hombre de 34 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0162', N'Hombre de 45 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0163', N'Hombre de 27 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0164', N'Hombre de 42 años, de la cuidad de Tuxtepec,con codigopostal68320')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0165', N'Hombre de 32 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0166', N'Hombre de 45 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0167', N'Mujer de 35 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0168', N'Hombre de 38 años, de la cuidad de Tuxtepec,con codigopostal68360')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0169', N'Hombre de 50 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0170', N'Mujer de 50 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0171', N'Hombre de 47 años, de la cuidad de Tuxtepec,con codigopostal68441')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0172', N'Mujer de 42 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0173', N'Mujer de 37 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0174', N'Mujer de 41 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0175', N'Hombre de 26 años, de la cuidad de México D.F.,con codigopostal68380')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0176', N'Mujer de 32 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0177', N'Mujer de 50 años, de la cuidad de Tuxtepec,con codigopostal2011')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0178', N'Hombre de 45 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0179', N'Hombre de 48 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0180', N'Hombre de 36 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0181', N'Hombre de 48 años, de la cuidad de Tuxtepec,con codigopostal68321')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0182', N'Mujer de 45 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0183', N'Mujer de 37 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0184', N'Hombre de 46 años, de la cuidad de Tuxtepec,con codigopostal68305')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0185', N'Mujer de 41 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0186', N'Mujer de 46 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0187', N'Hombre de 34 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0188', N'Hombre de 40 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0189', N'Mujer de 35 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0190', N'Mujer de 29 años, de la cuidad de México D.F.,con codigopostal68380')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0191', N'Hombre de 41 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0192', N'Hombre de 32 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0193', N'Hombre de 43 años, de la cuidad de México D.F.,con codigopostal68380')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0194', N'Mujer de 43 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0195', N'Mujer de 46 años, de la cuidad de Tuxtepec,con codigopostal68300')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0196', N'Hombre de 43 años, de la cuidad de León,con codigopostal28046')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0197', N'Mujer de 29 años, de la cuidad de León,con codigopostal28046')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0198', N'Hombre de 41 años, de la cuidad de León,con codigopostal28046')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0199', N'Mujer de 32 años, de la cuidad de León,con codigopostal28046')
INSERT [dbo].[G1DemograficasClientes] ([ClientesTipoID], [ClientesDescripcion]) VALUES (N'T0200', N'Hombre de 43 años, de la cuidad de León,con codigopostal28046')
GO
TRUNCATE TABLE G1DetallesOrdenes
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (1, 1, CAST(57.5000 AS Decimal(10, 4)), 27, 0)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (1, 2, CAST(83.0000 AS Decimal(10, 4)), 16, 0.06)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (2, 3, CAST(25.1000 AS Decimal(10, 4)), 97, 0)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (2, 4, CAST(66.0000 AS Decimal(10, 4)), 49, 0.87)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (3, 5, CAST(50.6000 AS Decimal(10, 4)), 96, 0)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (3, 6, CAST(78.0000 AS Decimal(10, 4)), 79, 0.98)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (4, 7, CAST(40.8000 AS Decimal(10, 4)), 9, 0)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (4, 8, CAST(99.0000 AS Decimal(10, 4)), 99, 0.38)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (5, 9, CAST(6.1000 AS Decimal(10, 4)), 6, 0)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (5, 10, CAST(92.0000 AS Decimal(10, 4)), 38, 0.75)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (6, 11, CAST(34.7000 AS Decimal(10, 4)), 55, 0)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (6, 12, CAST(39.0000 AS Decimal(10, 4)), 93, 0.75)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (7, 13, CAST(18.1000 AS Decimal(10, 4)), 64, 0)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (7, 14, CAST(38.0000 AS Decimal(10, 4)), 36, 0.39)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (8, 15, CAST(4.0000 AS Decimal(10, 4)), 76, 0)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (9, 16, CAST(19.5000 AS Decimal(10, 4)), 77, 0)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (10, 17, CAST(54.0000 AS Decimal(10, 4)), 1, 0)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (11, 18, CAST(6.7000 AS Decimal(10, 4)), 44, 0)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (12, 19, CAST(15.2000 AS Decimal(10, 4)), 84, 0)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (13, 20, CAST(18.2000 AS Decimal(10, 4)), 30, 0)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (14, 21, CAST(13.0000 AS Decimal(10, 4)), 45, 0)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (15, 22, CAST(14.9000 AS Decimal(10, 4)), 53, 0)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (16, 23, CAST(60.2000 AS Decimal(10, 4)), 49, 0)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (17, 24, CAST(58.6000 AS Decimal(10, 4)), 18, 0)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (18, 25, CAST(57.6000 AS Decimal(10, 4)), 37, 0)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (19, 26, CAST(12.7000 AS Decimal(10, 4)), 72, 0.5)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (20, 27, CAST(52.4000 AS Decimal(10, 4)), 59, 0.5)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (21, 28, CAST(38.4000 AS Decimal(10, 4)), 12, 0.5)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (22, 29, CAST(2.5000 AS Decimal(10, 4)), 41, 0.5)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (23, 30, CAST(36.4000 AS Decimal(10, 4)), 43, 0.5)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (24, 31, CAST(46.9000 AS Decimal(10, 4)), 82, 0.5)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (25, 32, CAST(20.3000 AS Decimal(10, 4)), 39, 0.5)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (26, 33, CAST(36.8000 AS Decimal(10, 4)), 32, 0.5)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (27, 34, CAST(7.7000 AS Decimal(10, 4)), 100, 0.5)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (28, 35, CAST(24.7000 AS Decimal(10, 4)), 65, 0.5)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (29, 36, CAST(9.6000 AS Decimal(10, 4)), 56, 0.5)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (30, 37, CAST(29.0000 AS Decimal(10, 4)), 85, 0.5)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (31, 38, CAST(8.9000 AS Decimal(10, 4)), 66, 0.5)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (32, 39, CAST(55.9000 AS Decimal(10, 4)), 36, 0.5)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (33, 40, CAST(66.7000 AS Decimal(10, 4)), 88, 0.5)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (34, 41, CAST(45.6000 AS Decimal(10, 4)), 86, 0.5)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (35, 42, CAST(11.7000 AS Decimal(10, 4)), 10, 0.5)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (36, 43, CAST(54.6000 AS Decimal(10, 4)), 67, 0.5)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (37, 44, CAST(20.4000 AS Decimal(10, 4)), 71, 0)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (38, 45, CAST(66.6000 AS Decimal(10, 4)), 79, 0)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (39, 46, CAST(34.8000 AS Decimal(10, 4)), 48, 0)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (40, 47, CAST(67.9000 AS Decimal(10, 4)), 29, 0)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (41, 48, CAST(30.9000 AS Decimal(10, 4)), 4, 0)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (42, 49, CAST(34.1000 AS Decimal(10, 4)), 63, 0)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (43, 50, CAST(25.8000 AS Decimal(10, 4)), 69, 0)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (44, 51, CAST(59.3000 AS Decimal(10, 4)), 5, 0)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (45, 52, CAST(67.0000 AS Decimal(10, 4)), 68, 0)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (46, 53, CAST(30.2000 AS Decimal(10, 4)), 94, 0)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (47, 54, CAST(27.6000 AS Decimal(10, 4)), 58, 0)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (47, 55, CAST(55.8000 AS Decimal(10, 4)), 92, 0)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (47, 56, CAST(27.2000 AS Decimal(10, 4)), 42, 0)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (48, 57, CAST(45.8000 AS Decimal(10, 4)), 54, 0.2)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (49, 58, CAST(24.3000 AS Decimal(10, 4)), 74, 0.2)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (50, 59, CAST(13.3000 AS Decimal(10, 4)), 16, 0.2)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (51, 60, CAST(35.6000 AS Decimal(10, 4)), 34, 0.2)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (52, 61, CAST(44.9000 AS Decimal(10, 4)), 24, 0.2)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (53, 62, CAST(9.2000 AS Decimal(10, 4)), 60, 0.2)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (54, 63, CAST(14.7000 AS Decimal(10, 4)), 62, 0.2)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (55, 64, CAST(19.2000 AS Decimal(10, 4)), 95, 0.2)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (56, 65, CAST(68.0000 AS Decimal(10, 4)), 80, 0.2)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (57, 66, CAST(48.4000 AS Decimal(10, 4)), 35, 0.2)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (58, 67, CAST(60.4000 AS Decimal(10, 4)), 81, 0.2)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (59, 68, CAST(28.9000 AS Decimal(10, 4)), 17, 0.2)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (60, 69, CAST(68.0000 AS Decimal(10, 4)), 68, 0.53)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (61, 70, CAST(12.0000 AS Decimal(10, 4)), 79, 0.61)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (62, 71, CAST(32.0000 AS Decimal(10, 4)), 69, 0.65)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (63, 72, CAST(98.0000 AS Decimal(10, 4)), 9, 0.88)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (64, 73, CAST(95.0000 AS Decimal(10, 4)), 87, 0.05)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (65, 74, CAST(15.0000 AS Decimal(10, 4)), 15, 0.4)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (66, 75, CAST(92.0000 AS Decimal(10, 4)), 8, 0.64)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (67, 76, CAST(27.0000 AS Decimal(10, 4)), 63, 0.08)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (68, 77, CAST(48.0000 AS Decimal(10, 4)), 97, 0.41)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (69, 78, CAST(39.0000 AS Decimal(10, 4)), 72, 0.77)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (70, 79, CAST(65.0000 AS Decimal(10, 4)), 94, 0.47)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (71, 80, CAST(11.0000 AS Decimal(10, 4)), 82, 0.62)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (72, 81, CAST(1.0000 AS Decimal(10, 4)), 42, 0.11)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (73, 82, CAST(28.0000 AS Decimal(10, 4)), 93, 0.32)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (74, 83, CAST(2.0000 AS Decimal(10, 4)), 58, 0.96)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (75, 84, CAST(38.0000 AS Decimal(10, 4)), 47, 0.46)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (76, 85, CAST(12.0000 AS Decimal(10, 4)), 46, 0.47)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (77, 86, CAST(67.0000 AS Decimal(10, 4)), 16, 0.11)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (78, 87, CAST(15.0000 AS Decimal(10, 4)), 37, 0.84)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (79, 88, CAST(81.0000 AS Decimal(10, 4)), 24, 0.14)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (80, 89, CAST(100.0000 AS Decimal(10, 4)), 71, 0.36)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (81, 90, CAST(11.0000 AS Decimal(10, 4)), 56, 0.25)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (82, 91, CAST(8.0000 AS Decimal(10, 4)), 85, 0.95)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (83, 92, CAST(91.0000 AS Decimal(10, 4)), 5, 0.5)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (84, 93, CAST(13.4000 AS Decimal(10, 4)), 25, 0.2)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (85, 94, CAST(94.0000 AS Decimal(10, 4)), 83, 0)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (86, 95, CAST(43.3000 AS Decimal(10, 4)), 70, 0.2)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (87, 96, CAST(53.0000 AS Decimal(10, 4)), 51, 0)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (88, 97, CAST(34.2000 AS Decimal(10, 4)), 14, 0.2)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (89, 98, CAST(70.0000 AS Decimal(10, 4)), 17, 0)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (90, 99, CAST(40.3000 AS Decimal(10, 4)), 28, 0.2)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (91, 100, CAST(39.0000 AS Decimal(10, 4)), 40, 0)
GO
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (92, 101, CAST(58.0000 AS Decimal(10, 4)), 75, 0.2)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (93, 102, CAST(10.0000 AS Decimal(10, 4)), 40, 0)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (94, 103, CAST(7.4000 AS Decimal(10, 4)), 26, 0.2)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (95, 104, CAST(69.0000 AS Decimal(10, 4)), 51, 0)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (96, 105, CAST(58.0000 AS Decimal(10, 4)), 75, 0.3)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (97, 106, CAST(5.0000 AS Decimal(10, 4)), 79, 0)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (98, 107, CAST(79.0000 AS Decimal(10, 4)), 92, 0)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (99, 108, CAST(30.0000 AS Decimal(10, 4)), 44, 0)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (100, 109, CAST(30.0000 AS Decimal(10, 4)), 95, 0)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (101, 110, CAST(68.0000 AS Decimal(10, 4)), 1, 0)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (102, 111, CAST(98.0000 AS Decimal(10, 4)), 38, 0)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (103, 112, CAST(99.0000 AS Decimal(10, 4)), 52, 0)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (104, 113, CAST(21.0000 AS Decimal(10, 4)), 99, 0)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (105, 114, CAST(49.0000 AS Decimal(10, 4)), 35, 0)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (106, 115, CAST(73.0000 AS Decimal(10, 4)), 95, 0)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (107, 116, CAST(12.0000 AS Decimal(10, 4)), 28, 0)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (108, 117, CAST(69.0000 AS Decimal(10, 4)), 26, 0.5)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (109, 118, CAST(47.0000 AS Decimal(10, 4)), 44, 0.5)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (110, 119, CAST(55.0000 AS Decimal(10, 4)), 67, 0.5)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (111, 120, CAST(98.0000 AS Decimal(10, 4)), 52, 0.5)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (112, 121, CAST(19.0000 AS Decimal(10, 4)), 52, 0.5)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (113, 122, CAST(77.0000 AS Decimal(10, 4)), 85, 0.5)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (114, 123, CAST(15.0000 AS Decimal(10, 4)), 11, 0.5)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (115, 124, CAST(5.0000 AS Decimal(10, 4)), 96, 0.5)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (116, 125, CAST(65.0000 AS Decimal(10, 4)), 76, 0.5)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (117, 126, CAST(27.0000 AS Decimal(10, 4)), 91, 0.5)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (118, 127, CAST(31.0000 AS Decimal(10, 4)), 45, 0.5)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (119, 128, CAST(22.0000 AS Decimal(10, 4)), 55, 0.5)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (120, 129, CAST(29.0000 AS Decimal(10, 4)), 96, 0.5)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (121, 130, CAST(80.0000 AS Decimal(10, 4)), 46, 0.5)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (122, 131, CAST(94.0000 AS Decimal(10, 4)), 48, 0.5)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (123, 132, CAST(35.0000 AS Decimal(10, 4)), 62, 0.5)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (124, 133, CAST(53.0000 AS Decimal(10, 4)), 35, 0.5)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (125, 134, CAST(5.0000 AS Decimal(10, 4)), 88, 0.5)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (126, 135, CAST(25.0000 AS Decimal(10, 4)), 45, 0.5)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (127, 136, CAST(18.0000 AS Decimal(10, 4)), 23, 0.5)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (128, 137, CAST(64.0000 AS Decimal(10, 4)), 89, 0.5)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (129, 138, CAST(42.0000 AS Decimal(10, 4)), 96, 0.5)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (130, 139, CAST(58.0000 AS Decimal(10, 4)), 83, 0.5)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (131, 140, CAST(15.0000 AS Decimal(10, 4)), 94, 0.5)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (132, 141, CAST(43.0000 AS Decimal(10, 4)), 73, 0.5)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (133, 142, CAST(15.0000 AS Decimal(10, 4)), 30, 0.5)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (134, 143, CAST(63.0000 AS Decimal(10, 4)), 4, 0.5)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (135, 144, CAST(26.0000 AS Decimal(10, 4)), 98, 0.5)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (136, 145, CAST(65.0000 AS Decimal(10, 4)), 69, 0.5)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (137, 146, CAST(45.0000 AS Decimal(10, 4)), 13, 0.5)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (138, 147, CAST(91.0000 AS Decimal(10, 4)), 28, 0.5)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (139, 148, CAST(39.0000 AS Decimal(10, 4)), 5, 0.5)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (140, 149, CAST(16.0000 AS Decimal(10, 4)), 2, 0.5)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (141, 150, CAST(75.0000 AS Decimal(10, 4)), 80, 0.5)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (142, 151, CAST(2.0000 AS Decimal(10, 4)), 55, 0.5)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (143, 152, CAST(62.0000 AS Decimal(10, 4)), 78, 0.15)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (144, 153, CAST(46.0000 AS Decimal(10, 4)), 66, 0.15)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (145, 154, CAST(73.0000 AS Decimal(10, 4)), 47, 0.15)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (146, 155, CAST(75.0000 AS Decimal(10, 4)), 90, 0.15)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (147, 156, CAST(91.0000 AS Decimal(10, 4)), 27, 0.15)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (148, 157, CAST(53.0000 AS Decimal(10, 4)), 92, 0.15)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (149, 158, CAST(91.0000 AS Decimal(10, 4)), 79, 0.15)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (150, 159, CAST(53.0000 AS Decimal(10, 4)), 60, 0.15)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (151, 160, CAST(50.0000 AS Decimal(10, 4)), 25, 0.15)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (152, 161, CAST(1.0000 AS Decimal(10, 4)), 34, 0.15)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (153, 162, CAST(79.0000 AS Decimal(10, 4)), 65, 0.15)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (154, 163, CAST(42.0000 AS Decimal(10, 4)), 51, 0.15)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (155, 164, CAST(56.0000 AS Decimal(10, 4)), 67, 0.15)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (156, 165, CAST(74.0000 AS Decimal(10, 4)), 36, 0.15)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (157, 166, CAST(75.0000 AS Decimal(10, 4)), 16, 0.99)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (158, 167, CAST(61.0000 AS Decimal(10, 4)), 78, 0.14)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (159, 168, CAST(56.0000 AS Decimal(10, 4)), 24, 0.7)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (160, 169, CAST(88.0000 AS Decimal(10, 4)), 62, 0.59)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (161, 170, CAST(89.0000 AS Decimal(10, 4)), 13, 0.53)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (162, 171, CAST(13.0000 AS Decimal(10, 4)), 46, 0.16)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (163, 172, CAST(23.0000 AS Decimal(10, 4)), 11, 0.9)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (164, 173, CAST(53.0000 AS Decimal(10, 4)), 41, 0.55)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (165, 174, CAST(31.0000 AS Decimal(10, 4)), 70, 0.2)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (166, 175, CAST(45.0000 AS Decimal(10, 4)), 88, 0.33)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (167, 176, CAST(82.0000 AS Decimal(10, 4)), 44, 0.7)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (168, 177, CAST(57.0000 AS Decimal(10, 4)), 7, 0.33)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (169, 178, CAST(13.0000 AS Decimal(10, 4)), 4, 0.78)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (170, 179, CAST(30.0000 AS Decimal(10, 4)), 92, 0.04)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (171, 180, CAST(97.0000 AS Decimal(10, 4)), 41, 0.27)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (172, 181, CAST(68.0000 AS Decimal(10, 4)), 62, 0.2)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (173, 182, CAST(86.0000 AS Decimal(10, 4)), 89, 0.17)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (174, 183, CAST(6.0000 AS Decimal(10, 4)), 63, 0.29)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (175, 184, CAST(87.0000 AS Decimal(10, 4)), 67, 0.8)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (176, 185, CAST(63.0000 AS Decimal(10, 4)), 73, 0.9)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (177, 186, CAST(52.0000 AS Decimal(10, 4)), 50, 0.05)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (178, 187, CAST(38.0000 AS Decimal(10, 4)), 67, 0.37)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (179, 188, CAST(75.0000 AS Decimal(10, 4)), 75, 0.22)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (180, 189, CAST(97.0000 AS Decimal(10, 4)), 63, 0.02)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (181, 190, CAST(71.0000 AS Decimal(10, 4)), 78, 0.78)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (182, 191, CAST(20.0000 AS Decimal(10, 4)), 6, 0.51)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (183, 192, CAST(16.0000 AS Decimal(10, 4)), 53, 0.43)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (184, 193, CAST(58.0000 AS Decimal(10, 4)), 1, 0.55)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (185, 194, CAST(14.0000 AS Decimal(10, 4)), 16, 0.05)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (186, 195, CAST(99.0000 AS Decimal(10, 4)), 23, 0.2)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (187, 196, CAST(31.0000 AS Decimal(10, 4)), 39, 0.96)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (188, 197, CAST(81.0000 AS Decimal(10, 4)), 16, 0.29)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (189, 198, CAST(91.0000 AS Decimal(10, 4)), 53, 0.34)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (190, 199, CAST(10.0000 AS Decimal(10, 4)), 85, 0.39)
INSERT [dbo].[G1DetallesOrdenes] ([OrdenID], [ProductoID], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (191, 200, CAST(92.0000 AS Decimal(10, 4)), 13, 0.77)
GO
SET IDENTITY_INSERT [dbo].[G1Empleados] ON 
TRUNCATE TABLE G1Empleados
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (1, N'Rodriguez', N'Jose', N'ing. sistemas', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'7 calle 27 avenida', N'San Pedro Sula', N'cortes', N'1920', N'HONDURAS', N'2215092', N'504', N'Estudio en Ceutec', 2, NULL, 45000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (2, N'Perez', N'Danaiel', N'ing', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'7 calle 27 avenida', N'San Pedro Sula', N'cortes', N'1920', N'HONDURAS', N'223123', N'504', N'Estudio en usap', 4, NULL, 45000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (3, N'Rodriguez', N'Juan', N'ing. sistemas', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'7 calle 27 avenida', N'San Pedro Sula', N'cortes', N'1920', N'HONDURAS', N'2215092', N'504', N'Estudio en Ceutec', 2, NULL, 50000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (4, N'Primitiva', N'Calzada', N'lic', N'Sr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'8 calle 27 avenida', N'chotepe', N'cortes', N'1223', N'HONDURAS', N'12312', N'504', N'Estudio en unah', 3, NULL, 25000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (5, N'Teodosio', N'Manso', N'ing', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'9 calle 27 avenida', N'Chamelecon', N'cortes', N'1224', N'HONDURAS', N'1234124', N'504', N'Estuadio en ceutec', 2, NULL, 35000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (6, N'Selena', N'Mateu Lluc', N'lic', N'Sr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'10 calle 27 avenida', N'B.benque', N'cortes', N'1225', N'HONDURAS', N'141241', N'504', N'Estudio en catolica', 4, NULL, 55000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (7, N'Imelda ', N'Tudela', N'ing', N'Sr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'11 calle 27 avenida', N'B.concepcion', N'cortes', N'1226', N'HONDURAS', N'1234', N'504', N'Estudio en unitec', 3, NULL, 30000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (8, N'Fabricio', N'Aller', N'lic', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'12 calle 27 avenida', N'B.guardia', N'cortes', N'1227', N'HONDURAS', N'5678', N'504', N'Estudio en usap', 2, NULL, 25000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (9, N'Jovita', N'Montes', N'ing', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'13 calle 27 avenida', N'Cofradia', N'cortes', N'1228', N'HONDURAS', N'91011', N'504', N'Estudio en unah', 4, NULL, 45000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (10, N'Esteban', N'Valls', N'lic', N'Sr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'14 calle 27 avenida', N'PazBarahona', N'cortes', N'1339', N'HONDURAS', N'50000', N'504', N'Estuadio en ceutec', 3, NULL, 25000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (11, N'Balduino', N'Delgado', N'lic', N'Sr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'16 calle 27 avenida', N'Rioblanco', N'cortes', N'122211', N'HONDURAS', N'50002', N'504', N'Estudio en unitec', 4, NULL, 55000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (12, N'Corona', N'Roman', N'ing', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'17 calle 27 avenida', N'chotepe', N'cortes', N'123312', N'HONDURAS', N'50003', N'504', N'Estudio en usap', 3, NULL, 30000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (13, N'Bruno', N'Estrada', N'lic', N'Sr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'18 calle 27 avenida', N'Chamelecon', N'cortes', N'12441', N'HONDURAS', N'50004', N'504', N'Estudio en unah', 2, NULL, 25000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (14, N'Patricia', N'Belmonte', N'ing', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'19 calle 27 avenida', N'B.benque', N'cortes', N'12552', N'HONDURAS', N'50005', N'504', N'Estuadio en ceutec', 4, NULL, 45000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (15, N'Isa', N'Plana', N'lic', N'Sr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'20 calle 27 avenida', N'B.concepcion', N'cortes', N'12663', N'HONDURAS', N'50006', N'504', N'Estudio en catolica', 3, NULL, 25000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (16, N'Rodrigo', N'Gallo', N'ing', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'21 calle 27 avenida', N'B.guardia', N'cortes', N'12774', N'HONDURAS', N'50007', N'504', N'Estudio en unitec', 2, NULL, 35000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (17, N'Duilio', N' Coronado', N'lic', N'Sr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'22 calle 27 avenida', N'Cofradia', N'cortes', N'12885', N'HONDURAS', N'50008', N'504', N'Estudio en usap', 4, NULL, 55000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (18, N'Pancho', N'Rey', N'ing', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'23 calle 27 avenida', N'PazBarahona', N'cortes', N'12996', N'HONDURAS', N'50009', N'504', N'Estudio en unah', 3, NULL, 30000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (19, N'Anacleto', N'Ochoa', N'lic', N'Sr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'24 calle 27 avenida', N'Llanossantos', N'cortes', N'1117', N'HONDURAS', N'50010', N'504', N'Estuadio en ceutec', 2, NULL, 25000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (20, N'Roldan', N'Pazos', N'ing', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'25 calle 27 avenida', N'Rioblanco', N'cortes', N'1118', N'HONDURAS', N'50011', N'504', N'Estudio en catolica', 4, NULL, 45000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (21, N'Tania', N'Valera', N'lic', N'Sr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'26 calle 27 avenida', N'chotepe', N'cortes', N'1119', N'HONDURAS', N'50012', N'504', N'Estudio en unitec', 3, NULL, 25000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (22, N'Clavero', N'Poza', N'ing', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'27 calle 27 avenida', N'Chamelecon', N'cortes', N'11110', N'HONDURAS', N'50013', N'504', N'Estudio en usap', 2, NULL, 35000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (23, N'Conrado', N'Roman', N'ing', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'87 calle 27 avenida', N'Llanos santos', N'cortes', N'2111', N'HONDURAS', N'50073', N'504', N'Estudio en usap', 2, NULL, 35000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (24, N'Martin', N'Quesada', N'lic', N'Sr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'88 calle 27 avenida', N'Rioblanco', N'cortes', N'2113', N'HONDURAS', N'50074', N'504', N'Estudio en unah', 4, NULL, 55000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (25, N'Luciano', N'Baena', N'ing', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'89 calle 27 avenida', N'chotepe', N'cortes', N'2114', N'HONDURAS', N'50075', N'504', N'Estuadio en ceutec', 3, NULL, 30000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (26, N'Ezequiel', N'Villalonga', N'lic', N'Sr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'90 calle 27 avenida', N'Chamelecon', N'cortes', N'2115', N'HONDURAS', N'50076', N'504', N'Estudio en catolica', 2, NULL, 25000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (27, N'Lilia', N'Cisneros', N'ing', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'91 calle 27 avenida', N'B.benque', N'cortes', N'2116', N'HONDURAS', N'50077', N'504', N'Estudio en unitec', 4, NULL, 45000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (28, N'Melania', N'Cepeda', N'lic', N'Sr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'92 calle 27 avenida', N'B.concepcion', N'cortes', N'2117', N'HONDURAS', N'50078', N'504', N'Estudio en usap', 3, NULL, 25000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (29, N'Narciso', N'Aranda', N'ing', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'93 calle 27 avenida', N'B.guardia', N'cortes', N'2118', N'HONDURAS', N'50079', N'604', N'Estudio en unah', 2, NULL, 35000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (30, N'Perlita', N'Arregui', N'lic', N'Sr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'94 calle 27 avenida', N'Cofradia', N'cortes', N'2119', N'HONDURAS', N'50080', N'504', N'Estuadio en ceutec', 4, NULL, 55000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (31, N'Lope', N'Valenti­na', N'ing', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'95 calle 27 avenida', N'PazBarahona', N'cortes', N'21110', N'HONDURAS', N'50081', N'504', N'Estudio en catolica', 3, NULL, 30000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (32, N'Leticia', N'Bilbao', N'lic', N'Sr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'96 calle 27 avenida', N'Llanos santos', N'cortes', N'22211', N'HONDURAS', N'50082', N'504', N'Estudio en unitec', 2, NULL, 25000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (33, N'Glauco', N'Castell', N'ing', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'97 calle 27 avenida', N'Rio blanco', N'cortes', N'22212', N'HONDURAS', N'50083', N'504', N'Estudio en usap', 4, NULL, 45000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (34, N'Octavio', N'Isern', N'lic', N'Sr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'98 calle 27 avenida', N'chotepe', N'cortes', N'2221', N'HONDURAS', N'50084', N'504', N'Estudio en unah', 3, NULL, 25000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (35, N'Elba', N'Sofi­a', N'ing', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'99 calle 27 avenida', N'Chamelecon', N'cortes', N'2222', N'HONDURAS', N'50085', N'504', N'Estuadio en ceutec', 2, NULL, 35000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (36, N'Edelmira', N'Espinosa', N'lic', N'Sr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'100 calle 27 avenida', N'B.benque', N'cortes', N'2223', N'HONDURAS', N'50086', N'504', N'Estudio en catolica', 4, NULL, 55000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (37, N'Zaida', N'Navas', N'ing', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'101 calle 27 avenida', N'B.concepcion', N'cortes', N'2224', N'HONDURAS', N'50087', N'604', N'Estudio en unitec', 3, NULL, 30000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (38, N'Timoteo', N'Portero', N'lic', N'Sr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'102 calle 27 avenida', N'B.guardia', N'cortes', N'2225', N'HONDURAS', N'50088', N'504', N'Estudio en usap', 2, NULL, 25000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (39, N'Carmelita', N'Fiol', N'ing', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'103 calle 27 avenida', N'Cofradia', N'cortes', N'2226', N'HONDURAS', N'5008', N'504', N'Estudio en unah', 4, NULL, 45000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (40, N'Toni', N'Robledo', N'lic', N'Sr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'104 calle 27 avenida', N'PazBarahona', N'cortes', N'2227', N'HONDURAS', N'50090', N'504', N'Estuadio en ceutec', 3, NULL, 25000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (41, N'Jeremas', N'Arcos', N'ing', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'105 calle 27 avenida', N'Llanos santos', N'cortes', N'3118', N'HONDURAS', N'50091', N'504', N'Estudio en catolica', 2, NULL, 35000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (42, N'Santos', N'Mara­n', N'lic', N'Sr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'106 calle 27 avenida', N'Rio blanco', N'cortes', N'3229', N'HONDURAS', N'50092', N'504', N'Estudio en unitec', 4, NULL, 55000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (43, N'Perlita', N'Zaragoza', N'ing', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'107 calle 27 avenida', N'chotepe', N'cortes', N'33310', N'HONDURAS', N'50093', N'504', N'Estudio en usap', 3, NULL, 30000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (44, N'Natanael', N'Ribes', N'lic', N'Sr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'108 calle 27 avenida', N'Chamelecon', N'cortes', N'34412', N'HONDURAS', N'50094', N'504', N'Estudio en unah', 2, NULL, 25000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (45, N'Consuelo', N'Garcia', N'ing', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'109 calle 27 avenida', N'B.Benque', N'cortes', N'3551', N'HONDURAS', N'50095', N'504', N'Estuadio en ceutec', 4, NULL, 45000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (46, N'Visitacian', N'Quintana', N'lic', N'Sr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'110 calle 27 avenida', N'B.concepcion', N'cortes', N'3662', N'HONDURAS', N'50096', N'504', N'Estudio en catolica', 3, NULL, 25000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (47, N'Renata', N'Carnero', N'ing', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'111 calle 27 avenida', N'B.guardia', N'cortes', N'3773', N'HONDURAS', N'50097', N'504', N'Estudio en unitec', 2, NULL, 35000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (48, N'Zacar­as', N'Cruz', N'lic', N'Sr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'112 calle 27 avenida', N'Cofradia', N'cortes', N'3884', N'HONDURAS', N'50098', N'504', N'Estudio en usap', 4, NULL, 55000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (49, N'Marina', N'Rosa', N'ing', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'113 calle 27 avenida', N'PazBarahona', N'cortes', N'3995', N'HONDURAS', N'50099', N'504', N'Estudio en unah', 3, NULL, 30000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (50, N'Josefa', N'Bad­a', N'lic', N'Sr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'114 calle 27 avenida', N'Llanos santos', N'cortes', N'3116', N'HONDURAS', N'50100', N'504', N'Estuadio en ceutec', 2, NULL, 25000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (51, N'Heraclio', N'Casanovas', N'ing', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'115 calle 27 avenida', N'Rio blanco', N'cortes', N'3117', N'HONDURAS', N'50101', N'504', N'Estudio en catolica', 4, NULL, 45000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (52, N'Bernardino', N'Gonzalo', N'lic', N'Sr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'116 calle 27 avenida', N'chotepe', N'cortes', N'3118', N'HONDURAS', N'50102', N'504', N'Estudio en unitec', 3, NULL, 25000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (53, N'Teodosio', N'Aranda', N'ing', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'117 calle 27 avenida', N'Chamelecon', N'cortes', N'3119', N'HONDURAS', N'50103', N'504', N'Estudio en usap', 2, NULL, 35000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (54, N'Celestino', N'Tudela', N'lic', N'Sr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'118 calle 27 avenida', N'B.benque', N'cortes', N'31110', N'HONDURAS', N'50104', N'504', N'Estudio en unah', 4, NULL, 55000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (55, N'Ruperto', N'Riera', N'ing', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'119 calle 27 avenida', N'B.concepcion', N'cortes', N'31111', N'HONDURAS', N'50105', N'504', N'Estuadio en ceutec', 3, NULL, 30000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (56, N'Venceslas', N'Ros', N'lic', N'Sr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'120 calle 27 avenida', N'B.guardia', N'cortes', N'31112', N'HONDURAS', N'50106', N'504', N'Estudio en catolica', 2, NULL, 25000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (57, N'Gil', N'Galindo', N'ing', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'121 calle 27 avenida', N'Cofradia', N'cortes', N'3111', N'HONDURAS', N'50107', N'504', N'Estudio en unitec', 4, NULL, 45000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (58, N'Sigfrido', N'Gomez', N'lic', N'Sr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'122 calle 27 avenida', N'Pazbarahona', N'cortes', N'3112', N'HONDURAS', N'50108', N'504', N'Estudio en usap', 3, NULL, 25000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (59, N'Gabriela', N'Gargallo', N'ing', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'123 calle 27 avenida', N'Llanos santos', N'cortes', N'3113', N'HONDURAS', N'50109', N'504', N'Estudio en unah', 2, NULL, 35000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (60, N'Rodrigo', N'Contreras', N'lic', N'Sr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'124 calle 27 avenida', N'Rio blanco', N'cortes', N'3224', N'HONDURAS', N'50110', N'504', N'Estuadio en ceutec', 4, NULL, 55000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (61, N'Florentino', N'Carnero', N'ing', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'125 calle 27 avenida', N'chotepe', N'cortes', N'3225', N'HONDURAS', N'50111', N'504', N'Estudio en catolica', 3, NULL, 30000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (62, N'Maria', N'Zaira', N'lic', N'Sr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'126 calle 27 avenida', N'Chamelecon', N'cortes', N'3226', N'HONDURAS', N'50112', N'504', N'Estudio en unitec', 2, NULL, 25000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (63, N'Eufemia', N'Mendez', N'ing', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'127 calle 27 avenida', N'B.benque', N'cortes', N'3228', N'HONDURAS', N'50113', N'504', N'Estudio en usap', 4, NULL, 45000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (64, N'Santiago', N'Company', N'lic', N'Sr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'128 calle 27 avenida', N'B.concepcion', N'cortes', N'3229', N'HONDURAS', N'50114', N'504', N'Estudio en unah', 3, NULL, 25000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (65, N'Felisa', N'Nogueira', N'ing', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'129 calle 27 avenida', N'B.guardia', N'cortes', N'32210', N'HONDURAS', N'50115', N'504', N'Estuadio en ceutec', 2, NULL, 35000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (66, N'Yasica', N'Izquierdo', N'lic', N'Sr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'130 calle 27 avenida', N'Cofradia', N'cortes', N'32211', N'HONDURAS', N'50116', N'504', N'Estudio en catolica', 4, NULL, 55000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (67, N'Arellano', N'Arrieta', N'ing', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'131 calle 27 avenida', N'PazBarahona', N'cortes', N'32212', N'HONDURAS', N'50117', N'504', N'Estudio en unitec', 3, NULL, 30000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (68, N'Alejandro', N'Fuentes', N'lic', N'Sr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'132 calle 27 avenida', N'Llanos santos', N'cortes', N'3221', N'HONDURAS', N'50118', N'504', N'Estudio en usap', 2, NULL, 25000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (69, N'Elena', N'Mena', N'ing', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'133 calle 27 avenida', N'Rioblanco', N'cortes', N'3222', N'HONDURAS', N'50119', N'504', N'Estudio en unah', 4, NULL, 45000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (70, N'Miguel', N'Lumbreras', N'lic', N'Sr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'134 calle 27 avenida', N'chotepe', N'cortes', N'3333', N'HONDURAS', N'50120', N'504', N'Estuadio en ceutec', 3, NULL, 25000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (71, N'Herminio', N'Samper', N'ing', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'135 calle 27 avenida', N'Chamelecon', N'cortes', N'3334', N'HONDURAS', N'50121', N'504', N'Estudio en catolica', 2, NULL, 35000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (72, N'Yolanda', N'Esteban', N'lic', N'Sr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'136 calle 27 avenida', N'B.benque', N'cortes', N'4115', N'HONDURAS', N'50122', N'504', N'Estudio en unitec', 4, NULL, 55000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (73, N'Gertrudis', N'Elorza', N'ing', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'137 calle 27 avenida', N'B.concepcion', N'cortes', N'4226', N'HONDURAS', N'50123', N'504', N'Estudio en usap', 3, NULL, 30000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (74, N'Camila', N'Castillo', N'lic', N'Sr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'138 calle 27 avenida', N'B.guardia', N'cortes', N'4337', N'HONDURAS', N'50124', N'504', N'Estudio en unah', 2, NULL, 25000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (75, N'Josep', N'Esparza', N'ing', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'139 calle 27 avenida', N'Cofradia', N'cortes', N'4448', N'HONDURAS', N'50125', N'504', N'Estuadio en ceutec', 4, NULL, 45000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (76, N'Debora', N'Porta', N'lic', N'Sr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'40 calle 27 avenida', N'PazBarahona', N'cortes', N'4553', N'HONDURAS', N'50126', N'504', N'Estudio en catolica', 3, NULL, 25000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (77, N'Ceferino', N'Yuste', N'ing', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'41 calle 27 avenida', N'Llanossantos', N'cortes', N'4662', N'HONDURAS', N'50127', N'504', N'Estudio en unitec', 2, NULL, 35000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (78, N'Marisa', N'Ferrandez', N'lic', N'Sr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'142 calle 27 avenida', N'Rio blanco', N'cortes', N'4770', N'HONDURAS', N'50128', N'504', N'Estudio en usap', 4, NULL, 55000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (79, N'Joaqua­n', N'Torre', N'ing', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'143 calle 27 avenida', N'chotepe', N'cortes', N'4882', N'HONDURAS', N'50129', N'504', N'Estudio en unah', 3, NULL, 30000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (80, N'Ana', N'Portillo', N'lic', N'Sr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'144 calle 27 avenida', N'Chamelecon', N'cortes', N'4993', N'HONDURAS', N'50130', N'504', N'Estuadio en ceutec', 2, NULL, 25000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (81, N'Loreto', N'Caspedes', N'ing', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'145 calle 27 avenida', N'B.benque', N'cortes', N'4112', N'HONDURAS', N'50131', N'504', N'Estudio en catolica', 4, NULL, 45000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (82, N'Teo', N'Calleja', N'lic', N'Sr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'146 calle 27 avenida', N'B.concepcion', N'cortes', N'4113', N'HONDURAS', N'50132', N'504', N'Estudio en unitec', 3, NULL, 25000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (83, N'Fernanda', N'Ruperta', N'ing', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'147 calle 27 avenida', N'B.guardia', N'cortes', N'4112', N'HONDURAS', N'50133', N'504', N'Estudio en usap', 2, NULL, 35000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (84, N'Diego', N'Montoya', N'lic', N'Sr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'148 calle 27 avenida', N'Cofradia', N'cortes', N'4113', N'HONDURAS', N'50134', N'504', N'Estudio en unah', 4, NULL, 55000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (85, N'Renata', N'Rodriguez', N'ing', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'149 calle 27 avenida', N'PazBarahona', N'cortes', N'4112', N'HONDURAS', N'50135', N'504', N'Estuadio en ceutec', 3, NULL, 30000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (86, N'Nidia', N'Rosella', N'lic', N'Sr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'150 calle 27 avenida', N'Llanossantos', N'cortes', N'4113', N'HONDURAS', N'50136', N'504', N'Estudio en catolica', 2, NULL, 25000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (87, N'Mercedes', N'Nadal', N'ing', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'151 calle 27 avenida', N'Rioblanco', N'cortes', N'4112', N'HONDURAS', N'50137', N'504', N'Estudio en unitec', 4, NULL, 45000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (88, N'Jordana', N'Villas', N'lic', N'Sr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'152 calle 27 avenida', N'chotepe', N'cortes', N'4113', N'HONDURAS', N'50138', N'504', N'Estudio en usap', 3, NULL, 25000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (89, N'Hayde', N'Jovita', N'ing', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'153 calle 27 avenida', N'Chamelecon', N'cortes', N'4112', N'HONDURAS', N'50139', N'504', N'Estudio en unah', 2, NULL, 35000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (90, N'Alvarez', N'Ruiz', N'lic', N'Sr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'154 calle 27 avenida', N'B.benque', N'cortes', N'4113', N'HONDURAS', N'50140', N'504', N'Estuadio en ceutec', 4, NULL, 55000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (91, N'Jenny', N'Ribas', N'ing', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'155 calle 27 avenida', N'B.concepcion', N'cortes', N'4222', N'HONDURAS', N'50141', N'504', N'Estudio en catolica', 3, NULL, 30000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (92, N'Maria', N'Dolores', N'lic', N'Sr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'156 calle 27 avenida', N'B.guardia', N'cortes', N'4223', N'HONDURAS', N'50142', N'504', N'Estudio en unitec', 2, NULL, 25000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (93, N'Almudena', N'Moles', N'ing', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'157 calle 27 avenida', N'Cofradia', N'cortes', N'4222', N'HONDURAS', N'50143', N'504', N'Estudio en usap', 4, NULL, 45000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (94, N'Candido', N'Catalan', N'lic', N'Sr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'158 calle 27 avenida', N'PazBarahona', N'cortes', N'4223', N'HONDURAS', N'50144', N'504', N'Estudio en unah', 3, NULL, 25000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (95, N'Ana', N'Bustamante', N'ing', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'159 calle 27 avenida', N'Llanos santos', N'cortes', N'4222', N'HONDURAS', N'50145', N'504', N'Estuadio en ceutec', 2, NULL, 35000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (96, N'Tomas', N'Flores', N'lic', N'Sr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'160 calle 27 avenida', N'Rioblanco', N'cortes', N'4223', N'HONDURAS', N'50146', N'504', N'Estudio en catolica', 4, NULL, 55000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (97, N'Esther', N'Bermudez', N'ing', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'161 calle 27 avenida', N'chotepe', N'cortes', N'4222', N'HONDURAS', N'50147', N'504', N'Estudio en unitec', 3, NULL, 30000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (98, N'Jose', N'Zabala', N'lic', N'Sr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'162 calle 27 avenida', N'Chamelecon', N'cortes', N'4223', N'HONDURAS', N'50148', N'504', N'Estudio en usap', 2, NULL, 25000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (99, N'Danilo', N'Ortega', N'ing', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'163 calle 27 avenida', N'B.benque', N'cortes', N'4222', N'HONDURAS', N'50149', N'504', N'Estudio en unah', 4, NULL, 45000)
GO
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (100, N'Delia', N'Larrea', N'lic', N'Sr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'164 calle 27 avenida', N'B.concepcion', N'cortes', N'4223', N'HONDURAS', N'50150', N'504', N'Estuadio en ceutec', 3, NULL, 25000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (101, N'Aura', N'Domi­nguez', N'ing', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'165 calle 27 avenida', N'B.guardia', N'cortes', N'332', N'HONDURAS', N'50151', N'504', N'Estudio en catolica', 2, NULL, 35000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (102, N'Tadeo', N'Benitez', N'lic', N'Sr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'166 calle 27 avenida', N'Cofradia', N'cortes', N'5113', N'HONDURAS', N'50152', N'504', N'Estudio en unitec', 4, NULL, 55000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (103, N'Heliodoro', N'Valera', N'ing', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'167 calle 27 avenida', N'PazBarahona', N'cortes', N'5222', N'HONDURAS', N'50153', N'504', N'Estudio en usap', 3, NULL, 30000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (104, N'Francisco', N'Alegria', N'lic', N'Sr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'168 calle 27 avenida', N'Llanos santos', N'cortes', N'5333', N'HONDURAS', N'50154', N'504', N'Estudio en unah', 2, NULL, 25000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (105, N'Graciela', N'Perdomo', N'ing', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'169 calle 27 avenida', N'Rioblanco', N'cortes', N'5442', N'HONDURAS', N'50155', N'504', N'Estuadio en ceutec', 4, NULL, 45000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (106, N'Tania', N'Mateo', N'ing', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'169 calle 27 avenida', N'Rioblanco', N'cortes', N'5442', N'HONDURAS', N'50155', N'504', N'Estuadio en ceutec', 4, NULL, 45000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (107, N'Cacho', N'Limber', N'ing. sistemas', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'7 calle 27 avenida', N'San Pedro Sula', N'cortes', N'1920', N'HONDURAS', N'2215092', N'504', N'Estudio en Ceutec', 2, NULL, 50000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (108, N'Teodora', N'Johana', N'lic', N'Sr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'8 calle 27 avenida', N'chotepe', N'cortes', N'1223', N'HONDURAS', N'12312', N'504', N'Estudio en unah', 3, NULL, 25000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (109, N'Teodosio', N'Mateo', N'ing', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'9 calle 27 avenida', N'Chamelecon', N'cortes', N'1224', N'HONDURAS', N'1234124', N'504', N'Estuadio en ceutec', 2, NULL, 35000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (110, N'Selena', N'Luz', N'lic', N'Sr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'10 calle 27 avenida', N'B.benque', N'cortes', N'1225', N'HONDURAS', N'141241', N'504', N'Estudio en catolica', 4, NULL, 55000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (111, N'Imelda ', N'Daniela', N'ing', N'Sr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'11 calle 27 avenida', N'B.concepcion', N'cortes', N'1226', N'HONDURAS', N'1234', N'504', N'Estudio en unitec', 3, NULL, 30000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (112, N'Fabricio', N'Daniel', N'lic', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'12 calle 27 avenida', N'B.guardia', N'cortes', N'1227', N'HONDURAS', N'5678', N'504', N'Estudio en usap', 2, NULL, 25000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (113, N'Jovita', N'Leonel', N'ing', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'13 calle 27 avenida', N'Cofradia', N'cortes', N'1228', N'HONDURAS', N'91011', N'504', N'Estudio en unah', 4, NULL, 45000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (114, N'Esteban', N'Katherin', N'lic', N'Sr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'14 calle 27 avenida', N'PazBarahona', N'cortes', N'1339', N'HONDURAS', N'50000', N'504', N'Estuadio en ceutec', 3, NULL, 25000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (115, N'Nacho', N'Hector', N'ing', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'15 calle 27 avenida', N'Llanossantos', N'cortes', N'121110', N'HONDURAS', N'50001', N'504', N'Estudio en catolica', 2, NULL, 35000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (116, N'Balduino', N'Pamela', N'lic', N'Sr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'16 calle 27 avenida', N'Rioblanco', N'cortes', N'122211', N'HONDURAS', N'50002', N'504', N'Estudio en unitec', 4, NULL, 55000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (117, N'Corona', N'Alberto', N'ing', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'17 calle 27 avenida', N'chotepe', N'cortes', N'123312', N'HONDURAS', N'50003', N'504', N'Estudio en usap', 3, NULL, 30000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (118, N'Bruno', N'Karen', N'lic', N'Sr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'18 calle 27 avenida', N'Chamelecon', N'cortes', N'12441', N'HONDURAS', N'50004', N'504', N'Estudio en unah', 2, NULL, 25000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (119, N'Diaz', N'Francisco', N'ing', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'19 calle 27 avenida', N'B.benque', N'cortes', N'12552', N'HONDURAS', N'50005', N'504', N'Estuadio en ceutec', 4, NULL, 45000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (120, N'Isa', N'Lizeth', N'lic', N'Sr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'20 calle 27 avenida', N'B.concepcion', N'cortes', N'12663', N'HONDURAS', N'50006', N'504', N'Estudio en catolica', 3, NULL, 25000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (121, N'Rodrigo', N'Erick', N'ing', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'21 calle 27 avenida', N'B.guardia', N'cortes', N'12774', N'HONDURAS', N'50007', N'504', N'Estudio en unitec', 2, NULL, 35000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (122, N'Duilio', N'Arlen', N'lic', N'Sr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'22 calle 27 avenida', N'Cofradia', N'cortes', N'12885', N'HONDURAS', N'50008', N'504', N'Estudio en usap', 4, NULL, 55000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (123, N'Pancho', N'Milton', N'ing', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'23 calle 27 avenida', N'PazBarahona', N'cortes', N'12996', N'HONDURAS', N'50009', N'504', N'Estudio en unah', 3, NULL, 30000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (124, N'Anacleta', N'Sisy', N'lic', N'Sr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'24 calle 27 avenida', N'Llanossantos', N'cortes', N'1117', N'HONDURAS', N'50010', N'504', N'Estuadio en ceutec', 2, NULL, 25000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (125, N'Roldan', N'Juan', N'ing', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'25 calle 27 avenida', N'Rioblanco', N'cortes', N'1118', N'HONDURAS', N'50011', N'504', N'Estudio en catolica', 4, NULL, 45000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (126, N'Tania', N'Valeria', N'lic', N'Sr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'26 calle 27 avenida', N'chotepe', N'cortes', N'1119', N'HONDURAS', N'50012', N'504', N'Estudio en unitec', 3, NULL, 25000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (127, N'Clavero', N'Kevin', N'ing', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'27 calle 27 avenida', N'Chamelecon', N'cortes', N'11110', N'HONDURAS', N'50013', N'504', N'Estudio en usap', 2, NULL, 35000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (128, N'Cacho', N'Leon', N'ing. sistemas', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'7 calle 27 avenida', N'San Pedro Sula', N'cortes', N'1920', N'HONDURAS', N'25092', N'504', N'Estudio en Ceutec', 2, NULL, 50000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (129, N'Teodora', N'Yajaira', N'lic', N'Sr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'8 calle 27 avenida', N'chotepe', N'cortes', N'1223', N'HONDURAS', N'13121', N'504', N'Estudio en unah', 3, NULL, 25000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (130, N'Teodosio', N'Albert', N'ing', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'9 calle 27 avenida', N'Chamelecon', N'cortes', N'1224', N'HONDURAS', N'12124', N'504', N'Estuadio en ceutec', 2, NULL, 35000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (131, N'Selena', N'Albertina', N'lic', N'Sr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'10 calle 27 avenida', N'B.benque', N'cortes', N'1225', N'HONDURAS', N'15231', N'504', N'Estudio en catolica', 4, NULL, 55000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (132, N'cruz ', N'Dania', N'ing', N'Sr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'11 calle 27 avenida', N'B.concepcion', N'cortes', N'1226', N'HONDURAS', N'31234', N'504', N'Estudio en unitec', 3, NULL, 30000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (133, N'Lopez', N'Cristhin', N'lic', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'12 calle 27 avenida', N'B.guardia', N'cortes', N'1227', N'HONDURAS', N'57148', N'504', N'Estudio en usap', 2, NULL, 25000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (134, N'maquez', N'Langrish', N'ing', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'13 calle 27 avenida', N'Cofradia', N'cortes', N'1228', N'HONDURAS', N'92011', N'504', N'Estudio en unah', 4, NULL, 45000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (135, N'Diaz', N'Lana', N'lic', N'Sr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'14 calle 27 avenida', N'PazBarahona', N'cortes', N'1339', N'HONDURAS', N'50120', N'504', N'Estuadio en ceutec', 3, NULL, 25000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (136, N'Dios', N'Juan', N'ing', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'15 calle 27 avenida', N'Llanossantos', N'cortes', N'121110', N'HONDURAS', N'50401', N'504', N'Estudio en catolica', 2, NULL, 35000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (137, N'Perez', N'Astrid', N'lic', N'Sr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'16 calle 27 avenida', N'Rioblanco', N'cortes', N'122211', N'HONDURAS', N'50032', N'504', N'Estudio en unitec', 4, NULL, 55000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (138, N'Nacho', N'Jualian', N'ing', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'17 calle 27 avenida', N'chotepe', N'cortes', N'123312', N'HONDURAS', N'50303', N'504', N'Estudio en usap', 3, NULL, 30000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (139, N'Albertina', N'Dinora', N'lic', N'Sr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'18 calle 27 avenida', N'Chamelecon', N'cortes', N'12441', N'HONDURAS', N'51004', N'504', N'Estudio en unah', 2, NULL, 25000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (140, N'Diaz', N'Dumbo', N'ing', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'19 calle 27 avenida', N'B.benque', N'cortes', N'12552', N'HONDURAS', N'50015', N'504', N'Estuadio en ceutec', 4, NULL, 45000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (141, N'Oseguera', N'Dulce', N'lic', N'Sr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'20 calle 27 avenida', N'B.concepcion', N'cortes', N'12663', N'HONDURAS', N'5006', N'504', N'Estudio en catolica', 3, NULL, 25000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (142, N'Escalantes', N'Erick', N'ing', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'21 calle 27 avenida', N'B.guardia', N'cortes', N'12774', N'HONDURAS', N'50507', N'504', N'Estudio en unitec', 2, NULL, 35000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (143, N'caceres', N'Suyapa', N'lic', N'Sr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'22 calle 27 avenida', N'Cofradia', N'cortes', N'12885', N'HONDURAS', N'708', N'504', N'Estudio en usap', 4, NULL, 55000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (144, N'Mejia', N'Arturo', N'ing', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'23 calle 27 avenida', N'PazBarahona', N'cortes', N'12996', N'HONDURAS', N'505009', N'504', N'Estudio en unah', 3, NULL, 30000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (145, N'Salinas', N'Abigail', N'lic', N'Sr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'24 calle 27 avenida', N'Llanossantos', N'cortes', N'1117', N'HONDURAS', N'70010', N'504', N'Estuadio en ceutec', 2, NULL, 25000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (146, N'Roldan', N'Juan', N'ing', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'25 calle 27 avenida', N'Rioblanco', N'cortes', N'1118', N'HONDURAS', N'50011371', N'504', N'Estudio en catolica', 4, NULL, 45000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (147, N'Tania', N'Valeria', N'lic', N'Sr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'26 calle 27 avenida', N'chotepe', N'cortes', N'1119', N'HONDURAS', N'5007722', N'504', N'Estudio en unitec', 3, NULL, 25000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (148, N'Clavero', N'Kevin', N'ing', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'27 calle 27 avenida', N'Chamelecon', N'cortes', N'11110', N'HONDURAS', N'531008', N'504', N'Estudio en usap', 2, NULL, 35000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (149, N'Canvani', N'Dumbo', N'ing', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'19 calle 27 avenida', N'B.benque', N'cortes', N'12552', N'HONDURAS', N'50001135', N'504', N'Estuadio en ceutec', 4, NULL, 45000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (150, N'Oseguera', N'Dulce', N'lic', N'Sr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'20 calle 27 avenida', N'B.concepcion', N'cortes', N'12663', N'HONDURAS', N'50033106', N'504', N'Estudio en catolica', 3, NULL, 25000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (151, N'Escalantes', N'Erick', N'ing', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'21 calle 27 avenida', N'B.guardia', N'cortes', N'12774', N'HONDURAS', N'50501307', N'504', N'Estudio en unitec', 2, NULL, 35000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (152, N'Isabel', N'Suyapa', N'lic', N'Sr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'22 calle 27 avenida', N'Cofradia', N'cortes', N'12885', N'HONDURAS', N'50070148', N'504', N'Estudio en usap', 4, NULL, 55000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (153, N'MFernandez', N'Arturo', N'ing', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'23 calle 27 avenida', N'PazBarahona', N'cortes', N'12996', N'HONDURAS', N'505009', N'504', N'Estudio en unah', 3, NULL, 30000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (154, N'Diaz', N'Abigail', N'lic', N'Sr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'24 calle 27 avenida', N'Llanossantos', N'cortes', N'1117', N'HONDURAS', N'5710010', N'504', N'Estuadio en ceutec', 2, NULL, 25000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (155, N'Diaz', N'Juan', N'ing', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'25 calle 27 avenida', N'Rioblanco', N'cortes', N'1118', N'HONDURAS', N'500173411', N'504', N'Estudio en catolica', 4, NULL, 45000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (156, N'Perdomo', N'Valeria', N'lic', N'Sr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'26 calle 27 avenida', N'chotepe', N'cortes', N'1119', N'HONDURAS', N'5007742', N'504', N'Estudio en unitec', 3, NULL, 25000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (157, N'Cruz', N'Kevin', N'ing', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'27 calle 27 avenida', N'Chamelecon', N'cortes', N'11110', N'HONDURAS', N'534008', N'504', N'Estudio en usap', 2, NULL, 35000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (158, N'Diaz', N'Don', N'ing. sistemas', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'7 calle 27 avenida', N'San Pedro Sula', N'cortes', N'1920', N'HONDURAS', N'92025', N'504', N'Estudio en Ceutec', 2, NULL, 50000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (159, N'Teodora', N'Yazmin', N'lic', N'Sr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'8 calle 27 avenida', N'chotepe', N'cortes', N'1223', N'HONDURAS', N'11251', N'504', N'Estudio en unah', 3, NULL, 25000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (160, N'Teodosio', N'Rfa', N'ing', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'9 calle 27 avenida', N'Chamelecon', N'cortes', N'1224', N'HONDURAS', N'122421', N'504', N'Estuadio en ceutec', 2, NULL, 35000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (161, N'Selena', N'Jana', N'lic', N'Sr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'10 calle 27 avenida', N'B.benque', N'cortes', N'1225', N'HONDURAS', N'23231', N'504', N'Estudio en catolica', 4, NULL, 55000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (162, N'cruz ', N'Luna', N'ing', N'Sr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'11 calle 27 avenida', N'B.concepcion', N'cortes', N'1226', N'HONDURAS', N'35234', N'504', N'Estudio en unitec', 3, NULL, 30000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (163, N'Lopez', N'Critian', N'lic', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'12 calle 27 avenida', N'B.guardia', N'cortes', N'1227', N'HONDURAS', N'74148', N'504', N'Estudio en usap', 2, NULL, 25000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (164, N'maquez', N'Asta', N'ing', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'13 calle 27 avenida', N'Cofradia', N'cortes', N'1228', N'HONDURAS', N'30011', N'504', N'Estudio en unah', 4, NULL, 45000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (165, N'Diaz', N'Lunox', N'lic', N'Sr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'14 calle 27 avenida', N'PazBarahona', N'cortes', N'1339', N'HONDURAS', N'18120', N'504', N'Estuadio en ceutec', 3, NULL, 25000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (166, N'Dios', N'Balmond', N'ing', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'15 calle 27 avenida', N'Llanossantos', N'cortes', N'121110', N'HONDURAS', N'91401', N'504', N'Estudio en catolica', 2, NULL, 35000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (167, N'Perez', N'Alice', N'lic', N'Sr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'16 calle 27 avenida', N'Rioblanco', N'cortes', N'122211', N'HONDURAS', N'23032', N'504', N'Estudio en unitec', 4, NULL, 55000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (168, N'Nacho', N'Alucard', N'ing', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'17 calle 27 avenida', N'chotepe', N'cortes', N'123312', N'HONDURAS', N'130303', N'504', N'Estudio en usap', 3, NULL, 30000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (169, N'Albertina', N'Eudora', N'lic', N'Sr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'18 calle 27 avenida', N'Chamelecon', N'cortes', N'12441', N'HONDURAS', N'13004', N'504', N'Estudio en unah', 2, NULL, 25000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (170, N'Diaz', N'Bruno', N'ing', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'19 calle 27 avenida', N'B.benque', N'cortes', N'12552', N'HONDURAS', N'12015', N'504', N'Estuadio en ceutec', 4, NULL, 45000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (171, N'Oseguera', N'King', N'lic', N'Sr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'20 calle 27 avenida', N'B.concepcion', N'cortes', N'12663', N'HONDURAS', N'11006', N'504', N'Estudio en catolica', 3, NULL, 25000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (172, N'Escalantes', N'Eduardo', N'ing', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'21 calle 27 avenida', N'B.guardia', N'cortes', N'12774', N'HONDURAS', N'12507', N'504', N'Estudio en unitec', 2, NULL, 35000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (173, N'caceres', N'Guadalupe', N'lic', N'Sr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'22 calle 27 avenida', N'Cofradia', N'cortes', N'12885', N'HONDURAS', N'130708', N'504', N'Estudio en usap', 4, NULL, 55000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (174, N'Mejia', N'Phillip', N'ing', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'23 calle 27 avenida', N'PazBarahona', N'cortes', N'12996', N'HONDURAS', N'155009', N'504', N'Estudio en unah', 3, NULL, 30000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (175, N'Salinas', N'Abigail', N'lic', N'Sr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'24 calle 27 avenida', N'Llanossantos', N'cortes', N'1117', N'HONDURAS', N'57010', N'504', N'Estuadio en ceutec', 2, NULL, 25000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (176, N'Roldan', N'Javier', N'ing', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'25 calle 27 avenida', N'Rioblanco', N'cortes', N'1118', N'HONDURAS', N'50501371', N'504', N'Estudio en catolica', 4, NULL, 45000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (177, N'Tania', N'Alba', N'lic', N'Sr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'26 calle 27 avenida', N'chotepe', N'cortes', N'1119', N'HONDURAS', N'5056722', N'504', N'Estudio en unitec', 3, NULL, 25000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (178, N'Clavero', N'Urbina', N'ing', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'27 calle 27 avenida', N'Chamelecon', N'cortes', N'11110', N'HONDURAS', N'631008', N'504', N'Estudio en usap', 2, NULL, 35000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (179, N'Canvani', N'Maroni', N'ing', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'19 calle 27 avenida', N'B.benque', N'cortes', N'12552', N'HONDURAS', N'70001135', N'504', N'Estuadio en ceutec', 4, NULL, 45000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (180, N'Oseguera', N'Alexa', N'lic', N'Sr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'20 calle 27 avenida', N'B.concepcion', N'cortes', N'12663', N'HONDURAS', N'78033106', N'504', N'Estudio en catolica', 3, NULL, 25000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (181, N'Escalantes', N'Elliot', N'ing', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'21 calle 27 avenida', N'B.guardia', N'cortes', N'12774', N'HONDURAS', N'90501307', N'504', N'Estudio en unitec', 2, NULL, 35000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (182, N'Isabel', N'Jose', N'lic', N'Sr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'22 calle 27 avenida', N'Cofradia', N'cortes', N'12885', N'HONDURAS', N'58070148', N'504', N'Estudio en usap', 4, NULL, 55000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (183, N'MFernandez', N'Tromps', N'ing', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'23 calle 27 avenida', N'PazBarahona', N'cortes', N'12996', N'HONDURAS', N'7505009', N'504', N'Estudio en unah', 3, NULL, 30000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (184, N'Diaz', N'Xiomara', N'lic', N'Sr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'24 calle 27 avenida', N'Llanossantos', N'cortes', N'1117', N'HONDURAS', N'57100160', N'504', N'Estuadio en ceutec', 2, NULL, 25000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (185, N'Diaz', N'Lug', N'ing', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'25 calle 27 avenida', N'Rioblanco', N'cortes', N'1118', N'HONDURAS', N'500173441', N'504', N'Estudio en catolica', 4, NULL, 45000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (186, N'Perdomo', N'Dana', N'lic', N'Sr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'26 calle 27 avenida', N'chotepe', N'cortes', N'1119', N'HONDURAS', N'50047742', N'504', N'Estudio en unitec', 3, NULL, 25000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (187, N'Cruz', N'Dan', N'ing', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'27 calle 27 avenida', N'Chamelecon', N'cortes', N'11110', N'HONDURAS', N'9454008', N'504', N'Estudio en usap', 2, NULL, 35000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (188, N'Diaz', N'Omar', N'ing. sistemas', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'7 calle 27 avenida', N'San Pedro Sula', N'cortes', N'1920', N'HONDURAS', N'13525', N'504', N'Estudio en Ceutec', 2, NULL, 50000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (189, N'Teodora', N'Vilma', N'lic', N'Sr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'8 calle 27 avenida', N'chotepe', N'cortes', N'1223', N'HONDURAS', N'1125351', N'504', N'Estudio en unah', 3, NULL, 25000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (190, N'Teodosio', N'Rafael', N'ing', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'9 calle 27 avenida', N'Chamelecon', N'cortes', N'1224', N'HONDURAS', N'122412', N'504', N'Estuadio en ceutec', 2, NULL, 35000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (191, N'Selena', N'Juana', N'lic', N'Sr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'10 calle 27 avenida', N'B.benque', N'cortes', N'1225', N'HONDURAS', N'2355', N'504', N'Estudio en catolica', 4, NULL, 55000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (192, N'cruz ', N'Keyla', N'ing', N'Sr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'11 calle 27 avenida', N'B.concepcion', N'cortes', N'1226', N'HONDURAS', N'35555', N'504', N'Estudio en unitec', 3, NULL, 30000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (193, N'Lopez', N'Alvarado', N'lic', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'12 calle 27 avenida', N'B.guardia', N'cortes', N'1227', N'HONDURAS', N'746666', N'504', N'Estudio en usap', 2, NULL, 25000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (194, N'maquez', N'Asta', N'ing', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'13 calle 27 avenida', N'Cofradia', N'cortes', N'1228', N'HONDURAS', N'306601', N'504', N'Estudio en unah', 4, NULL, 45000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (195, N'Diaz', N'Stepanie', N'lic', N'Sr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'14 calle 27 avenida', N'PazBarahona', N'cortes', N'1339', N'HONDURAS', N'1866120', N'504', N'Estuadio en ceutec', 3, NULL, 25000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (196, N'Dios', N'Richard', N'ing', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'15 calle 27 avenida', N'Llanossantos', N'cortes', N'121110', N'HONDURAS', N'7791401', N'504', N'Estudio en catolica', 2, NULL, 35000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (197, N'Perez', N'Yency', N'lic', N'Sr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'16 calle 27 avenida', N'Rioblanco', N'cortes', N'122211', N'HONDURAS', N'2303552', N'504', N'Estudio en unitec', 4, NULL, 55000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (198, N'Nacho', N'Rene', N'ing', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'17 calle 27 avenida', N'chotepe', N'cortes', N'123312', N'HONDURAS', N'13058303', N'504', N'Estudio en usap', 3, NULL, 30000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (199, N'Albertina', N'Elena', N'lic', N'Sr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'18 calle 27 avenida', N'Chamelecon', N'cortes', N'12441', N'HONDURAS', N'1300584', N'504', N'Estudio en unah', 2, NULL, 25000)
GO
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (200, N'Diaz', N'Moises', N'ing', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'19 calle 27 avenida', N'B.benque', N'cortes', N'12552', N'HONDURAS', N'120155', N'504', N'Estuadio en ceutec', 4, NULL, 45000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (201, N'Oseguera', N'Jackeline', N'lic', N'Sr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'20 calle 27 avenida', N'B.concepcion', N'cortes', N'12663', N'HONDURAS', N'5811006', N'504', N'Estudio en catolica', 3, NULL, 25000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (202, N'Escalantes', N'Joel', N'ing', N'Mr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'21 calle 27 avenida', N'B.guardia', N'cortes', N'12774', N'HONDURAS', N'1582507', N'504', N'Estudio en unitec', 2, NULL, 35000)
INSERT [dbo].[G1Empleados] ([EmpleadoID], [Nombre], [Apellido], [Titulo], [Titulo_de_cortesia], [FechaNacimiento], [FechaContratacion], [Direccion], [Ciudades], [Region], [CodigoPostal], [Pais], [TelefonoCasa], [Extension], [Notas], [ReportarA], [FotoPath], [Salario]) VALUES (203, N'caceres', N'Minorka', N'lic', N'Sr', CAST(N'1999-06-02T00:00:00.000' AS DateTime), CAST(N'2020-08-02T00:00:00.000' AS DateTime), N'22 calle 27 avenida', N'Cofradia', N'cortes', N'12885', N'HONDURAS', N'13075808', N'504', N'Estudio en usap', 4, NULL, 55000)
SET IDENTITY_INSERT [dbo].[G1Empleados] OFF
GO
SET IDENTITY_INSERT [dbo].[G1Orden] ON 
TRUNCATE TABLE G1Orden
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (1, N'1', 1, CAST(N'1997-02-17T00:00:00.000' AS DateTime), CAST(N'1997-03-17T00:00:00.000' AS DateTime), CAST(N'1997-02-24T00:00:00.000' AS DateTime), 2, CAST(38.8200 AS Decimal(10, 4)), N'Rancho grande', N'Av. del Libertador 900', N'Buenos Aires', N'NULL', N'1010', N'Argentina')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (2, N'2', 2, CAST(N'1997-02-18T00:00:00.000' AS DateTime), CAST(N'1997-03-18T00:00:00.000' AS DateTime), CAST(N'1997-02-27T00:00:00.000' AS DateTime), 2, CAST(53.3000 AS Decimal(10, 4)), N'Blondel pre et fils 24', N' place Klber', N'Strasbourg', N'NULL', N'67000', N'France')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (3, N'3', 3, CAST(N'1997-02-19T00:00:00.000' AS DateTime), CAST(N'1997-03-19T00:00:00.000' AS DateTime), CAST(N'1997-03-11T00:00:00.000' AS DateTime), 2, CAST(7.2300 AS Decimal(10, 4)), N'Victuailles en stock 2', N' rue du Commerce', N'Lyon', N'NULL', N'69004', N'France')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (4, N'4', 4, CAST(N'1997-02-19T00:00:00.000' AS DateTime), CAST(N'1997-03-05T00:00:00.000' AS DateTime), CAST(N'1997-03-12T00:00:00.000' AS DateTime), 3, CAST(189.0900 AS Decimal(10, 4)), N'QUICK-Stop', N'Taucherstrae 10', N'Cunewalde', N'NULL', N'1307', N'Germany')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (5, N'104', 5, CAST(N'1997-02-20T00:00:00.000' AS DateTime), CAST(N'1997-03-20T00:00:00.000' AS DateTime), CAST(N'1997-02-26T00:00:00.000' AS DateTime), 1, CAST(140.2600 AS Decimal(10, 4)), N'Save-a-lot Markets', N'187 Suffolk Ln.', N'Boise', N'ID', N'83720', N'USA')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (6, N'6', 6, CAST(N'1997-02-21T00:00:00.000' AS DateTime), CAST(N'1997-03-21T00:00:00.000' AS DateTime), CAST(N'1997-02-26T00:00:00.000' AS DateTime), 2, CAST(25.3600 AS Decimal(10, 4)), N'Around the Horn', N'Brook Farm Stratford St. Mary', N'Colchester', N'Essex', N'CO7 6JX', N'UK')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (7, N'7', 7, CAST(N'1997-02-21T00:00:00.000' AS DateTime), CAST(N'1997-03-21T00:00:00.000' AS DateTime), CAST(N'1997-02-25T00:00:00.000' AS DateTime), 3, CAST(2.7400 AS Decimal(10, 4)), N'La maison d-Asie', N'1 rue Alsace-Lorraine', N'Toulouse', N'NULL', N'31000', N'France')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (8, N'8', 8, CAST(N'1997-02-24T00:00:00.000' AS DateTime), CAST(N'1997-04-07T00:00:00.000' AS DateTime), CAST(N'1997-03-03T00:00:00.000' AS DateTime), 2, CAST(180.4500 AS Decimal(10, 4)), N'Wartian Herkku', N'Torikatu 38', N'Oulu', N'NULL', N'90110', N'Finland')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (9, N'9', 9, CAST(N'1997-02-25T00:00:00.000' AS DateTime), CAST(N'1997-04-08T00:00:00.000' AS DateTime), CAST(N'1997-02-28T00:00:00.000' AS DateTime), 2, CAST(8.1200 AS Decimal(10, 4)), N'Kniglich Essen', N'Maubelstr. 90', N'Brandenburg', N'NULL', N'14776', N'Germany')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (10, N'10', 10, CAST(N'1997-02-25T00:00:00.000' AS DateTime), CAST(N'1997-03-25T00:00:00.000' AS DateTime), CAST(N'1997-03-03T00:00:00.000' AS DateTime), 1, CAST(11.5700 AS Decimal(10, 4)), N'Kniglich Essen', N'Maubelstr. 90', N'Brandenburg', N'NULL', N'14776', N'Germany')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (11, N'11', 11, CAST(N'1997-02-26T00:00:00.000' AS DateTime), CAST(N'1997-03-26T00:00:00.000' AS DateTime), CAST(N'1997-03-04T00:00:00.000' AS DateTime), 3, CAST(147.0600 AS Decimal(10, 4)), N'Suprmes dlices', N'Boulevard Tirou 255', N'Charleroi', N'NULL', N'B-6000', N'Belgium')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (12, N'12', 12, CAST(N'1997-02-27T00:00:00.000' AS DateTime), CAST(N'1997-03-27T00:00:00.000' AS DateTime), CAST(N'1997-02-28T00:00:00.000' AS DateTime), 2, CAST(25.0900 AS Decimal(10, 4)), N'Victuailles en stock 2', N' rue du Commerce', N'Lyon', N'NULL', N'69004', N'France')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (13, N'13', 13, CAST(N'1997-02-28T00:00:00.000' AS DateTime), CAST(N'1997-03-28T00:00:00.000' AS DateTime), CAST(N'1997-03-03T00:00:00.000' AS DateTime), 1, CAST(16.2700 AS Decimal(10, 4)), N'Folk och f HB', N'kergatan 24', N'Brcke', N'NULL', N'S-844 67', N'Sweden')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (14, N'182', 14, CAST(N'1997-02-28T00:00:00.000' AS DateTime), CAST(N'1997-03-28T00:00:00.000' AS DateTime), CAST(N'1997-03-05T00:00:00.000' AS DateTime), 3, CAST(148.6100 AS Decimal(10, 4)), N'LILA-Supermercado', N'Carrera 52 con Ave. Bolvar #65-98 Llano Largo', N'Barquisimeto', N'Lara', N'3508', N'Venezuela')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (15, N'15', 15, CAST(N'1997-03-03T00:00:00.000' AS DateTime), CAST(N'1997-03-31T00:00:00.000' AS DateTime), CAST(N'1997-03-18T00:00:00.000' AS DateTime), 1, CAST(6.1700 AS Decimal(10, 4)), N'Consolidated Holdings', N'Berkeley Gardens 12 Brewery', N'London', N'NULL', N'WX1 6LT', N'UK')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (16, N'16', 16, CAST(N'1997-03-04T00:00:00.000' AS DateTime), CAST(N'1997-04-01T00:00:00.000' AS DateTime), CAST(N'1997-03-06T00:00:00.000' AS DateTime), 3, CAST(14.7800 AS Decimal(10, 4)), N'Suprmes dlices', N'Boulevard Tirou 255', N'Charleroi', N'NULL', N'B-6000', N'Belgium')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (17, N'17', 17, CAST(N'1997-03-04T00:00:00.000' AS DateTime), CAST(N'1997-04-01T00:00:00.000' AS DateTime), CAST(N'1997-03-14T00:00:00.000' AS DateTime), 2, CAST(89.0000 AS Decimal(10, 4)), N'Furia Bacalhau e Frutos do Mar', N'Jardim das rosas n. 32', N'Lisboa', N'NULL', N'1675', N'Portugal')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (18, N'18', 18, CAST(N'1997-03-05T00:00:00.000' AS DateTime), CAST(N'1997-04-02T00:00:00.000' AS DateTime), CAST(N'1997-03-14T00:00:00.000' AS DateTime), 3, CAST(145.0400 AS Decimal(10, 4)), N'Vaffeljernet', N'Smagsloget 45', N'rhus', N'NULL', N'8200', N'Denmark')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (19, N'19', 19, CAST(N'1997-03-06T00:00:00.000' AS DateTime), CAST(N'1997-04-03T00:00:00.000' AS DateTime), CAST(N'1997-03-13T00:00:00.000' AS DateTime), 1, CAST(11.9300 AS Decimal(10, 4)), N'Comrcio Mineiro', N'Av. dos Lusadas 23', N'Sao Paulo', N'SP', N'05432-043', N'Brazil')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (20, N'20', 20, CAST(N'1997-03-06T00:00:00.000' AS DateTime), CAST(N'1997-04-03T00:00:00.000' AS DateTime), CAST(N'1997-03-11T00:00:00.000' AS DateTime), 2, CAST(4.9300 AS Decimal(10, 4)), N'Magazzini Alimentari Riuniti', N'Via Ludovico il Moro 22', N'Bergamo', N'NULL', N'24100', N'Italy')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (21, N'21', 21, CAST(N'1997-03-07T00:00:00.000' AS DateTime), CAST(N'1997-04-04T00:00:00.000' AS DateTime), CAST(N'1997-03-12T00:00:00.000' AS DateTime), 3, CAST(44.1200 AS Decimal(10, 4)), N'Kniglich Essen', N'Maubelstr. 90', N'Brandenburg', N'NULL', N'14776', N'Germany')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (22, N'22', 22, CAST(N'1997-03-10T00:00:00.000' AS DateTime), CAST(N'1997-04-07T00:00:00.000' AS DateTime), CAST(N'1997-03-14T00:00:00.000' AS DateTime), 1, CAST(60.1800 AS Decimal(10, 4)), N'White Clover Markets', N'1029 - 12th Ave. S.', N'Seattle', N'WA', N'98124', N'USA')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (23, N'23', 23, CAST(N'1997-03-11T00:00:00.000' AS DateTime), CAST(N'1997-04-08T00:00:00.000' AS DateTime), CAST(N'1997-03-14T00:00:00.000' AS DateTime), 2, CAST(64.5600 AS Decimal(10, 4)), N'Bon app-12', N' rue des Bouchers', N'Marseille', N'NULL', N'13008', N'France')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (24, N'24', 24, CAST(N'1997-03-11T00:00:00.000' AS DateTime), CAST(N'1997-04-08T00:00:00.000' AS DateTime), CAST(N'1997-03-18T00:00:00.000' AS DateTime), 3, CAST(45.5900 AS Decimal(10, 4)), N'B-s Beverages', N'Fauntleroy Circus', N'London', N'NULL', N'EC2 5NT', N'UK')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (25, N'25', 25, CAST(N'1997-03-12T00:00:00.000' AS DateTime), CAST(N'1997-04-09T00:00:00.000' AS DateTime), CAST(N'1997-03-19T00:00:00.000' AS DateTime), 1, CAST(4.2000 AS Decimal(10, 4)), N'Seven Seas Imports', N'90 Wadhurst Rd.', N'London', N'NULL', N'OX15 4NB', N'UK')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (26, N'17', 26, CAST(N'1997-03-13T00:00:00.000' AS DateTime), CAST(N'1997-03-27T00:00:00.000' AS DateTime), CAST(N'1997-03-21T00:00:00.000' AS DateTime), 3, CAST(16.3700 AS Decimal(10, 4)), N'Island Trading', N'Garden House Crowther Way', N'Cowes', N'Isle of Wight', N'PO31 7PJ', N'UK')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (27, N'27', 27, CAST(N'1997-03-13T00:00:00.000' AS DateTime), CAST(N'1997-04-10T00:00:00.000' AS DateTime), CAST(N'1997-03-21T00:00:00.000' AS DateTime), 2, CAST(83.4900 AS Decimal(10, 4)), N'Pericles Comidas clsicas', N'Calle Dr. Jorge Cash 321', N'Mxico D.F.', N'NULL', N'5033', N'Mexico')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (28, N'28', 28, CAST(N'1997-03-14T00:00:00.000' AS DateTime), CAST(N'1997-04-11T00:00:00.000' AS DateTime), CAST(N'1997-04-04T00:00:00.000' AS DateTime), 1, CAST(68.5200 AS Decimal(10, 4)), N'Suprmes dlices', N'Boulevard Tirou 255', N'Charleroi', N'NULL', N'B-6000', N'Belgium')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (29, N'29', 29, CAST(N'1997-03-17T00:00:00.000' AS DateTime), CAST(N'1997-04-14T00:00:00.000' AS DateTime), CAST(N'1997-03-24T00:00:00.000' AS DateTime), 3, CAST(4.4100 AS Decimal(10, 4)), N'HILARION-Abastos', N'Carrera 22 con Ave. Carlos Soublette #8-35', N'San Cristbal', N'Tchira', N'5022', N'Venezuela')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (30, N'30', 30, CAST(N'1997-03-17T00:00:00.000' AS DateTime), CAST(N'1997-04-14T00:00:00.000' AS DateTime), CAST(N'1997-03-25T00:00:00.000' AS DateTime), 2, CAST(13.0200 AS Decimal(10, 4)), N'Princesa Isabel Vinhos', N'Estrada da sade n. 58', N'Lisboa', N'NULL', N'1756', N'Portugal')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (31, N'31', 31, CAST(N'1997-03-18T00:00:00.000' AS DateTime), CAST(N'1997-04-01T00:00:00.000' AS DateTime), CAST(N'1997-03-26T00:00:00.000' AS DateTime), 3, CAST(4.8100 AS Decimal(10, 4)), N'Victuailles en stock 2', N' rue du Commerce', N'Lyon', N'NULL', N'69004', N'France')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (32, N'32', 32, CAST(N'1997-03-19T00:00:00.000' AS DateTime), CAST(N'1997-04-16T00:00:00.000' AS DateTime), CAST(N'1997-03-21T00:00:00.000' AS DateTime), 3, CAST(708.9500 AS Decimal(10, 4)), N'Rattlesnake Canyon Grocery', N'2817 Milton Dr.', N'Albuquerque', N'NM', N'87110', N'USA')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (33, N'33', 33, CAST(N'1997-03-20T00:00:00.000' AS DateTime), CAST(N'1997-04-17T00:00:00.000' AS DateTime), CAST(N'1997-03-24T00:00:00.000' AS DateTime), 2, CAST(1.3500 AS Decimal(10, 4)), N'Folies gourmandes 184', N' chausse de Tournai', N'Lille', N'NULL', N'59000', N'France')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (34, N'34', 34, CAST(N'1997-03-20T00:00:00.000' AS DateTime), CAST(N'1997-04-17T00:00:00.000' AS DateTime), CAST(N'1997-03-25T00:00:00.000' AS DateTime), 2, CAST(64.3300 AS Decimal(10, 4)), N'Ricardo Adocicados', N'Av. Copacabana 267', N'Rio de Janeiro', N'RJ', N'02389-890', N'Brazil')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (35, N'35', 35, CAST(N'1997-03-21T00:00:00.000' AS DateTime), CAST(N'1997-04-18T00:00:00.000' AS DateTime), CAST(N'1997-04-10T00:00:00.000' AS DateTime), 3, CAST(7.4800 AS Decimal(10, 4)), N'Lazy K Kountry Store', N'12 Orchestra Terrace', N'Walla Walla', N'WA', N'99362', N'USA')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (36, N'36', 36, CAST(N'1997-03-24T00:00:00.000' AS DateTime), CAST(N'1997-04-21T00:00:00.000' AS DateTime), CAST(N'1997-04-25T00:00:00.000' AS DateTime), 2, CAST(15.2800 AS Decimal(10, 4)), N'White Clover Markets', N'1029 - 12th Ave. S.', N'Seattle', N'WA', N'98124', N'USA')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (37, N'37', 37, CAST(N'1997-03-24T00:00:00.000' AS DateTime), CAST(N'1997-04-21T00:00:00.000' AS DateTime), CAST(N'1997-04-01T00:00:00.000' AS DateTime), 3, CAST(6.8800 AS Decimal(10, 4)), N'B-s Beverages', N'Fauntleroy Circus', N'London', N'NULL', N'EC2 5NT', N'UK')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (38, N'38', 38, CAST(N'1997-03-25T00:00:00.000' AS DateTime), CAST(N'1997-04-08T00:00:00.000' AS DateTime), CAST(N'1997-03-31T00:00:00.000' AS DateTime), 2, CAST(64.4500 AS Decimal(10, 4)), N'LINO-Delicateses', N'Ave. 5 de Mayo Porlamar', N'I. de Margarita', N'Nueva Esparta', N'4980', N'Venezuela')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (39, N'39', 39, CAST(N'1997-03-26T00:00:00.000' AS DateTime), CAST(N'1997-04-23T00:00:00.000' AS DateTime), CAST(N'1997-04-02T00:00:00.000' AS DateTime), 2, CAST(30.5300 AS Decimal(10, 4)), N'HILARION-Abastos', N'Carrera 22 con Ave. Carlos Soublette #8-35', N'San Cristbal', N'Tchira', N'5022', N'Venezuela')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (40, N'182', 40, CAST(N'1997-03-26T00:00:00.000' AS DateTime), CAST(N'1997-04-23T00:00:00.000' AS DateTime), CAST(N'1997-03-28T00:00:00.000' AS DateTime), 2, CAST(71.0700 AS Decimal(10, 4)), N'Queen Cozinha', N'Alameda dos Canrios 891', N'Sao Paulo', N'SP', N'05487-020', N'Brazil')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (41, N'41', 41, CAST(N'1997-03-27T00:00:00.000' AS DateTime), CAST(N'1997-04-24T00:00:00.000' AS DateTime), CAST(N'1997-04-02T00:00:00.000' AS DateTime), 2, CAST(4.9300 AS Decimal(10, 4)), N'Frankenversand', N'Berliner Platz 43', N'Mnchen', N'NULL', N'80805', N'Germany')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (42, N'42', 42, CAST(N'1997-03-28T00:00:00.000' AS DateTime), CAST(N'1997-04-25T00:00:00.000' AS DateTime), CAST(N'1997-04-09T00:00:00.000' AS DateTime), 2, CAST(5.2900 AS Decimal(10, 4)), N'Piccolo und mehr', N'Geislweg 14', N'Salzburg', N'NULL', N'5020', N'Austria')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (43, N'43', 43, CAST(N'1997-03-31T00:00:00.000' AS DateTime), CAST(N'1997-04-28T00:00:00.000' AS DateTime), CAST(N'1997-04-03T00:00:00.000' AS DateTime), 2, CAST(210.1900 AS Decimal(10, 4)), N'HILARION-Abastos', N'Carrera 22 con Ave. Carlos Soublette #8-35', N'San Cristbal', N'Tchira', N'5022', N'Venezuela')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (44, N'44', 44, CAST(N'1997-03-31T00:00:00.000' AS DateTime), CAST(N'1997-04-28T00:00:00.000' AS DateTime), CAST(N'1997-04-08T00:00:00.000' AS DateTime), 3, CAST(16.9600 AS Decimal(10, 4)), N'Furia Bacalhau e Frutos do Mar', N'Jardim das rosas n. 32', N'Lisboa', N'NULL', N'1675', N'Portugal')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (45, N'45', 45, CAST(N'1997-04-01T00:00:00.000' AS DateTime), CAST(N'1997-04-29T00:00:00.000' AS DateTime), CAST(N'1997-04-11T00:00:00.000' AS DateTime), 1, CAST(62.8900 AS Decimal(10, 4)), N'Bottom-Dollar Markets', N'23 Tsawassen Blvd.', N'Tsawassen', N'BC', N'T2F 8M4', N'Canada')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (46, N'46', 46, CAST(N'1997-04-02T00:00:00.000' AS DateTime), CAST(N'1997-04-30T00:00:00.000' AS DateTime), CAST(N'1997-04-10T00:00:00.000' AS DateTime), 3, CAST(10.6400 AS Decimal(10, 4)), N'La maison d-Asie', N'1 rue Alsace-Lorraine', N'Toulouse', N'NULL', N'31000', N'France')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (47, N'47', 47, CAST(N'1997-04-02T00:00:00.000' AS DateTime), CAST(N'1997-04-30T00:00:00.000' AS DateTime), CAST(N'1997-04-09T00:00:00.000' AS DateTime), 2, CAST(65.9900 AS Decimal(10, 4)), N'Comrcio Mineiro', N'Av. dos Lusadas 23', N'Sao Paulo', N'SP', N'05432-043', N'Brazil')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (48, N'48', 48, CAST(N'1997-04-03T00:00:00.000' AS DateTime), CAST(N'1997-05-01T00:00:00.000' AS DateTime), CAST(N'1997-04-11T00:00:00.000' AS DateTime), 3, CAST(4.6500 AS Decimal(10, 4)), N'Laughing Bacchus Wine Cellars', N'2319 Elm St.', N'Vancouver', N'BC', N'V3F 2K1', N'Canada')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (49, N'49', 49, CAST(N'1997-04-04T00:00:00.000' AS DateTime), CAST(N'1997-05-02T00:00:00.000' AS DateTime), CAST(N'1997-04-07T00:00:00.000' AS DateTime), 2, CAST(46.7700 AS Decimal(10, 4)), N'Tradiao Hipermercados', N'Av. Ins de Castro 414', N'Sao Paulo', N'SP', N'05634-030', N'Brazil')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (50, N'50', 50, CAST(N'1997-04-04T00:00:00.000' AS DateTime), CAST(N'1997-05-02T00:00:00.000' AS DateTime), CAST(N'1997-04-07T00:00:00.000' AS DateTime), 1, CAST(36.2100 AS Decimal(10, 4)), N'Lehmanns Marktstand', N'Magazinweg 7', N'Frankfurt a.M.', N'NULL', N'60528', N'Germany')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (51, N'51', 51, CAST(N'1997-04-07T00:00:00.000' AS DateTime), CAST(N'1997-05-05T00:00:00.000' AS DateTime), CAST(N'1997-04-11T00:00:00.000' AS DateTime), 2, CAST(29.7500 AS Decimal(10, 4)), N'HILARION-Abastos', N'Carrera 22 con Ave. Carlos Soublette #8-35', N'San Cristbal', N'Tchira', N'5022', N'Venezuela')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (52, N'52', 52, CAST(N'1997-04-08T00:00:00.000' AS DateTime), CAST(N'1997-05-06T00:00:00.000' AS DateTime), CAST(N'1997-04-16T00:00:00.000' AS DateTime), 2, CAST(102.0200 AS Decimal(10, 4)), N'LILA-Supermercado', N'Carrera 52 con Ave. Bolvar #65-98 Llano Largo', N'Barquisimeto', N'Lara', N'3508', N'Venezuela')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (53, N'53', 53, CAST(N'1997-04-09T00:00:00.000' AS DateTime), CAST(N'1997-05-07T00:00:00.000' AS DateTime), CAST(N'1997-04-17T00:00:00.000' AS DateTime), 1, CAST(42.6800 AS Decimal(10, 4)), N'La maison d-Asie', N'1 rue Alsace-Lorraine', N'Toulouse', N'NULL', N'31000', N'France')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (54, N'54', 54, CAST(N'1997-04-09T00:00:00.000' AS DateTime), CAST(N'1997-05-07T00:00:00.000' AS DateTime), CAST(N'1997-04-16T00:00:00.000' AS DateTime), 3, CAST(8.8500 AS Decimal(10, 4)), N'Blauer See Delikatessen', N'Forsterstr. 57', N'Mannheim', N'NULL', N'68306', N'Germany')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (55, N'55', 55, CAST(N'1997-04-10T00:00:00.000' AS DateTime), CAST(N'1997-05-08T00:00:00.000' AS DateTime), CAST(N'1997-04-29T00:00:00.000' AS DateTime), 1, CAST(69.3200 AS Decimal(10, 4)), N'Pericles Comidas clsicas', N'Calle Dr. Jorge Cash 321', N'Mxico D.F.', N'NULL', N'5033', N'Mexico')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (56, N'56', 56, CAST(N'1997-04-11T00:00:00.000' AS DateTime), CAST(N'1997-05-09T00:00:00.000' AS DateTime), CAST(N'1997-04-16T00:00:00.000' AS DateTime), 2, CAST(16.7400 AS Decimal(10, 4)), N'Hungry Owl All-Night Grocers', N'8 Johnstown Road', N'Cork', N'Co. Cork', N'NULL', N'Ireland')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (57, N'6', 57, CAST(N'1997-04-11T00:00:00.000' AS DateTime), CAST(N'1997-05-09T00:00:00.000' AS DateTime), CAST(N'1997-04-18T00:00:00.000' AS DateTime), 3, CAST(59.1300 AS Decimal(10, 4)), N'White Clover Markets', N'1029 - 12th Ave. S.', N'Seattle', N'WA', N'98124', N'USA')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (58, N'58', 58, CAST(N'1997-04-14T00:00:00.000' AS DateTime), CAST(N'1997-05-12T00:00:00.000' AS DateTime), CAST(N'1997-04-21T00:00:00.000' AS DateTime), 3, CAST(7.1300 AS Decimal(10, 4)), N'Mre Paillarde', N'43 rue St. Laurent', N'Montral', N'Qubec', N'H1J 1C3', N'Canada')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (59, N'59', 59, CAST(N'1997-04-15T00:00:00.000' AS DateTime), CAST(N'1997-05-13T00:00:00.000' AS DateTime), CAST(N'1997-05-02T00:00:00.000' AS DateTime), 2, CAST(21.1900 AS Decimal(10, 4)), N'Kniglich Essen', N'Maubelstr. 90', N'Brandenburg', N'NULL', N'14776', N'Germany')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (60, N'182', 60, CAST(N'1997-04-15T00:00:00.000' AS DateTime), CAST(N'1997-05-13T00:00:00.000' AS DateTime), CAST(N'1997-04-22T00:00:00.000' AS DateTime), 1, CAST(47.4500 AS Decimal(10, 4)), N'Antonio Moreno Taquera', N'Mataderos 2312', N'Mxico D.F.', N'NULL', N'5023', N'Mexico')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (61, N'61', 61, CAST(N'1997-04-16T00:00:00.000' AS DateTime), CAST(N'1997-05-14T00:00:00.000' AS DateTime), CAST(N'1997-05-13T00:00:00.000' AS DateTime), 2, CAST(4.9900 AS Decimal(10, 4)), N'Ottilies Kseladen', N'Mehrheimerstr. 369', N'Kln', N'NULL', N'50739', N'Germany')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (62, N'62', 62, CAST(N'1997-04-17T00:00:00.000' AS DateTime), CAST(N'1997-05-15T00:00:00.000' AS DateTime), CAST(N'1997-04-29T00:00:00.000' AS DateTime), 1, CAST(0.1500 AS Decimal(10, 4)), N'Blauer See Delikatessen', N'Forsterstr. 57', N'Mannheim', N'NULL', N'68306', N'Germany')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (63, N'63', 63, CAST(N'1997-04-18T00:00:00.000' AS DateTime), CAST(N'1997-05-16T00:00:00.000' AS DateTime), CAST(N'1997-04-28T00:00:00.000' AS DateTime), 3, CAST(367.6300 AS Decimal(10, 4)), N'Save-a-lot Markets', N'187 Suffolk Ln.', N'Boise', N'ID', N'83720', N'USA')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (64, N'64', 64, CAST(N'1997-04-18T00:00:00.000' AS DateTime), CAST(N'1997-05-16T00:00:00.000' AS DateTime), CAST(N'1997-04-21T00:00:00.000' AS DateTime), 3, CAST(350.6400 AS Decimal(10, 4)), N'Bon app-12', N' rue des Bouchers', N'Marseille', N'NULL', N'13008', N'France')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (65, N'65', 65, CAST(N'1997-04-21T00:00:00.000' AS DateTime), CAST(N'1997-05-19T00:00:00.000' AS DateTime), CAST(N'1997-04-24T00:00:00.000' AS DateTime), 2, CAST(3.5300 AS Decimal(10, 4)), N'Familia Arquibaldo', N'Rua Ors 92', N'Sao Paulo', N'SP', N'05442-030', N'Brazil')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (66, N'66', 66, CAST(N'1997-04-22T00:00:00.000' AS DateTime), CAST(N'1997-06-03T00:00:00.000' AS DateTime), CAST(N'1997-04-28T00:00:00.000' AS DateTime), 1, CAST(105.6500 AS Decimal(10, 4)), N'Die Wandernde Kuh', N'Adenauerallee 900', N'Stuttgart', N'NULL', N'70563', N'Germany')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (67, N'67', 67, CAST(N'1997-04-22T00:00:00.000' AS DateTime), CAST(N'1997-05-20T00:00:00.000' AS DateTime), CAST(N'1997-05-16T00:00:00.000' AS DateTime), 2, CAST(789.9500 AS Decimal(10, 4)), N'Ernst Handel', N'Kirchgasse 6', N'Graz', N'NULL', N'8010', N'Austria')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (68, N'68', 68, CAST(N'1997-04-23T00:00:00.000' AS DateTime), CAST(N'1997-05-07T00:00:00.000' AS DateTime), CAST(N'1997-05-23T00:00:00.000' AS DateTime), 1, CAST(204.4700 AS Decimal(10, 4)), N'QUICK-Stop', N'Taucherstrae 10', N'Cunewalde', N'NULL', N'1307', N'Germany')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (69, N'69', 69, CAST(N'1997-04-24T00:00:00.000' AS DateTime), CAST(N'1997-05-22T00:00:00.000' AS DateTime), CAST(N'1997-05-01T00:00:00.000' AS DateTime), 3, CAST(62.7800 AS Decimal(10, 4)), N'Hungry Owl All-Night Grocers', N'8 Johnstown Road', N'Cork', N'Co. Cork', N'NULL', N'Ireland')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (70, N'70', 70, CAST(N'1997-04-24T00:00:00.000' AS DateTime), CAST(N'1997-05-22T00:00:00.000' AS DateTime), CAST(N'1997-04-29T00:00:00.000' AS DateTime), 3, CAST(32.0700 AS Decimal(10, 4)), N'North/South', N'South House 300 Queensbridge', N'London', N'NULL', N'SW7 1RZ', N'UK')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (71, N'71', 71, CAST(N'1997-04-25T00:00:00.000' AS DateTime), CAST(N'1997-05-09T00:00:00.000' AS DateTime), CAST(N'1997-05-05T00:00:00.000' AS DateTime), 2, CAST(218.1500 AS Decimal(10, 4)), N'Tortuga Restaurante', N'Avda. Azteca 123', N'Mxico D.F.', N'NULL', N'5033', N'Mexico')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (72, N'72', 72, CAST(N'1997-04-28T00:00:00.000' AS DateTime), CAST(N'1997-05-26T00:00:00.000' AS DateTime), CAST(N'1997-05-01T00:00:00.000' AS DateTime), 3, CAST(91.7600 AS Decimal(10, 4)), N'Chop-suey Chinese', N'Hauptstr. 31', N'Bern', N'NULL', N'3012', N'Switzerland')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (73, N'73', 73, CAST(N'1997-04-29T00:00:00.000' AS DateTime), CAST(N'1997-05-27T00:00:00.000' AS DateTime), CAST(N'1997-05-01T00:00:00.000' AS DateTime), 1, CAST(13.3700 AS Decimal(10, 4)), N'Sant Gourmet', N'Erling Skakkes gate 78', N'Stavern', N'NULL', N'4110', N'Norway')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (74, N'74', 74, CAST(N'1997-04-29T00:00:00.000' AS DateTime), CAST(N'1997-05-27T00:00:00.000' AS DateTime), CAST(N'1997-05-02T00:00:00.000' AS DateTime), 2, CAST(17.2200 AS Decimal(10, 4)), N'Cactus Comidas para llevar', N'Cerrito 333', N'Buenos Aires', N'NULL', N'1010', N'Argentina')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (75, N'75', 75, CAST(N'1997-04-30T00:00:00.000' AS DateTime), CAST(N'1997-05-28T00:00:00.000' AS DateTime), CAST(N'1997-05-06T00:00:00.000' AS DateTime), 1, CAST(45.3300 AS Decimal(10, 4)), N'Lehmanns Marktstand', N'Magazinweg 7', N'Frankfurt a.M.', N'NULL', N'60528', N'Germany')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (76, N'76', 76, CAST(N'1997-05-01T00:00:00.000' AS DateTime), CAST(N'1997-05-29T00:00:00.000' AS DateTime), CAST(N'1997-05-30T00:00:00.000' AS DateTime), 2, CAST(77.6300 AS Decimal(10, 4)), N'Seven Seas Imports', N'90 Wadhurst Rd.', N'London', N'NULL', N'OX15 4NB', N'UK')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (77, N'77', 77, CAST(N'1997-05-01T00:00:00.000' AS DateTime), CAST(N'1997-05-29T00:00:00.000' AS DateTime), CAST(N'1997-05-07T00:00:00.000' AS DateTime), 2, CAST(244.7900 AS Decimal(10, 4)), N'Berglunds snabbkp', N'Berguvsvgen 8', N'Lule', N'NULL', N'S-958 22', N'Sweden')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (78, N'78', 78, CAST(N'1997-05-02T00:00:00.000' AS DateTime), CAST(N'1997-05-30T00:00:00.000' AS DateTime), CAST(N'1997-05-23T00:00:00.000' AS DateTime), 2, CAST(11.0600 AS Decimal(10, 4)), N'Bon app-12', N' rue des Bouchers', N'Marseille', N'NULL', N'13008', N'France')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (79, N'79', 79, CAST(N'1997-05-05T00:00:00.000' AS DateTime), CAST(N'1997-06-02T00:00:00.000' AS DateTime), CAST(N'1997-05-15T00:00:00.000' AS DateTime), 2, CAST(58.5900 AS Decimal(10, 4)), N'Wartian Herkku', N'Torikatu 38', N'Oulu', N'NULL', N'90110', N'Finland')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (80, N'80', 80, CAST(N'1997-05-05T00:00:00.000' AS DateTime), CAST(N'1997-06-02T00:00:00.000' AS DateTime), CAST(N'1997-05-07T00:00:00.000' AS DateTime), 1, CAST(41.9000 AS Decimal(10, 4)), N'QUICK-Stop', N'Taucherstrae 10', N'Cunewalde', N'NULL', N'1307', N'Germany')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (81, N'81', 81, CAST(N'1997-05-06T00:00:00.000' AS DateTime), CAST(N'1997-05-20T00:00:00.000' AS DateTime), CAST(N'1997-05-09T00:00:00.000' AS DateTime), 2, CAST(3.3500 AS Decimal(10, 4)), N'Great Lakes Food Market', N'2732 Baker Blvd.', N'Eugene', N'OR', N'97403', N'USA')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (82, N'82', 82, CAST(N'1997-05-07T00:00:00.000' AS DateTime), CAST(N'1997-06-04T00:00:00.000' AS DateTime), CAST(N'1997-05-09T00:00:00.000' AS DateTime), 2, CAST(66.6900 AS Decimal(10, 4)), N'Maison Dewey', N'Rue Joseph-Bens 532', N'Bruxelles', N'NULL', N'B-1180', N'Belgium')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (83, N'83', 83, CAST(N'1997-05-08T00:00:00.000' AS DateTime), CAST(N'1997-06-05T00:00:00.000' AS DateTime), CAST(N'1997-05-12T00:00:00.000' AS DateTime), 2, CAST(339.2200 AS Decimal(10, 4)), N'Piccolo und mehr', N'Geislweg 14', N'Salzburg', N'NULL', N'5020', N'Austria')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (84, N'84', 84, CAST(N'1997-05-08T00:00:00.000' AS DateTime), CAST(N'1997-06-05T00:00:00.000' AS DateTime), CAST(N'1997-05-19T00:00:00.000' AS DateTime), 1, CAST(8.1200 AS Decimal(10, 4)), N'Ocano Atlntico Ltda.', N'Ing. Gustavo Moncada 8585 Piso 20-A', N'Buenos Aires', N'NULL', N'1010', N'Argentina')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (85, N'85', 85, CAST(N'1997-05-09T00:00:00.000' AS DateTime), CAST(N'1997-06-06T00:00:00.000' AS DateTime), CAST(N'1997-05-12T00:00:00.000' AS DateTime), 3, CAST(74.4600 AS Decimal(10, 4)), N'Eastern Connection', N'35 King George', N'London', N'NULL', N'WX3 6FW', N'UK')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (86, N'86', 86, CAST(N'1997-05-12T00:00:00.000' AS DateTime), CAST(N'1997-06-09T00:00:00.000' AS DateTime), CAST(N'1997-05-22T00:00:00.000' AS DateTime), 1, CAST(188.0400 AS Decimal(10, 4)), N'Folk och f HB', N'kergatan 24', N'Brcke', N'NULL', N'S-844 67', N'Sweden')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (87, N'87', 87, CAST(N'1997-05-12T00:00:00.000' AS DateTime), CAST(N'1997-06-09T00:00:00.000' AS DateTime), CAST(N'1997-05-14T00:00:00.000' AS DateTime), 2, CAST(27.9400 AS Decimal(10, 4)), N'Lehmanns Marktstand', N'Magazinweg 7', N'Frankfurt a.M.', N'NULL', N'60528', N'Germany')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (88, N'88', 88, CAST(N'1997-05-13T00:00:00.000' AS DateTime), CAST(N'1997-06-10T00:00:00.000' AS DateTime), CAST(N'1997-05-21T00:00:00.000' AS DateTime), 1, CAST(15.6400 AS Decimal(10, 4)), N'Antonio Moreno Taquera', N'Mataderos 2312', N'Mxico D.F.', N'NULL', N'5023', N'Mexico')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (89, N'89', 89, CAST(N'1997-05-14T00:00:00.000' AS DateTime), CAST(N'1997-06-11T00:00:00.000' AS DateTime), CAST(N'1997-06-06T00:00:00.000' AS DateTime), 2, CAST(58.8800 AS Decimal(10, 4)), N'Lehmanns Marktstand', N'Magazinweg 7', N'Frankfurt a.M.', N'NULL', N'60528', N'Germany')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (90, N'90', 90, CAST(N'1997-05-14T00:00:00.000' AS DateTime), CAST(N'1997-05-28T00:00:00.000' AS DateTime), CAST(N'1997-05-19T00:00:00.000' AS DateTime), 1, CAST(78.8500 AS Decimal(10, 4)), N'Richter Supermarkt', N'Starenweg 5', N'Genve', N'NULL', N'1204', N'Switzerland')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (91, N'91', 91, CAST(N'1997-05-15T00:00:00.000' AS DateTime), CAST(N'1997-06-12T00:00:00.000' AS DateTime), CAST(N'1997-05-16T00:00:00.000' AS DateTime), 3, CAST(4.8700 AS Decimal(10, 4)), N'B-s Beverages', N'Fauntleroy Circus', N'London', N'NULL', N'EC2 5NT', N'UK')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (92, N'92', 92, CAST(N'1997-05-16T00:00:00.000' AS DateTime), CAST(N'1997-06-13T00:00:00.000' AS DateTime), CAST(N'1997-05-23T00:00:00.000' AS DateTime), 3, CAST(12.3600 AS Decimal(10, 4)), N'B-s Beverages', N'Fauntleroy Circus', N'London', N'NULL', N'EC2 5NT', N'UK')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (93, N'93', 93, CAST(N'1997-05-19T00:00:00.000' AS DateTime), CAST(N'1997-06-16T00:00:00.000' AS DateTime), CAST(N'1997-06-13T00:00:00.000' AS DateTime), 3, CAST(1007.6400 AS Decimal(10, 4)), N'QUICK-Stop', N'Taucherstrae 10', N'Cunewalde', N'NULL', N'1307', N'Germany')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (94, N'94', 94, CAST(N'1997-05-19T00:00:00.000' AS DateTime), CAST(N'1997-06-16T00:00:00.000' AS DateTime), CAST(N'1997-05-29T00:00:00.000' AS DateTime), 1, CAST(68.6500 AS Decimal(10, 4)), N'Hanari Carnes', N'Rua do Pao 67', N'Rio de Janeiro', N'RJ', N'05454-876', N'Brazil')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (95, N'95', 95, CAST(N'1997-05-20T00:00:00.000' AS DateTime), CAST(N'1997-06-17T00:00:00.000' AS DateTime), CAST(N'1997-05-26T00:00:00.000' AS DateTime), 3, CAST(10.9500 AS Decimal(10, 4)), N'Kniglich Essen', N'Maubelstr. 90', N'Brandenburg', N'NULL', N'14776', N'Germany')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (96, N'96', 96, CAST(N'1997-05-21T00:00:00.000' AS DateTime), CAST(N'1997-06-18T00:00:00.000' AS DateTime), CAST(N'1997-05-23T00:00:00.000' AS DateTime), 2, CAST(48.1700 AS Decimal(10, 4)), N'LILA-Supermercado', N'Carrera 52 con Ave. Bolvar #65-98 Llano Largo', N'Barquisimeto', N'Lara', N'3508', N'Venezuela')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (97, N'97', 97, CAST(N'1997-05-21T00:00:00.000' AS DateTime), CAST(N'1997-06-18T00:00:00.000' AS DateTime), CAST(N'1997-05-30T00:00:00.000' AS DateTime), 1, CAST(24.9100 AS Decimal(10, 4)), N'Lonesome Pine Restaurant', N'89 Chiaroscuro Rd.', N'Portland', N'OR', N'97219', N'USA')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (98, N'98', 98, CAST(N'1997-05-22T00:00:00.000' AS DateTime), CAST(N'1997-06-19T00:00:00.000' AS DateTime), CAST(N'1997-06-26T00:00:00.000' AS DateTime), 2, CAST(11.9200 AS Decimal(10, 4)), N'Lazy K Kountry Store', N'12 Orchestra Terrace', N'Walla Walla', N'WA', N'99362', N'USA')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (99, N'99', 99, CAST(N'1997-05-23T00:00:00.000' AS DateTime), CAST(N'1997-06-20T00:00:00.000' AS DateTime), CAST(N'1997-05-27T00:00:00.000' AS DateTime), 3, CAST(194.7200 AS Decimal(10, 4)), N'Victuailles en stock 2', N' rue du Commerce', N'Lyon', N'NULL', N'69004', N'France')
GO
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (100, N'100', 100, CAST(N'1997-05-23T00:00:00.000' AS DateTime), CAST(N'1997-06-20T00:00:00.000' AS DateTime), CAST(N'1997-06-02T00:00:00.000' AS DateTime), 2, CAST(178.4300 AS Decimal(10, 4)), N'Seven Seas Imports', N'90 Wadhurst Rd.', N'London', N'NULL', N'OX15 4NB', N'UK')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (101, N'101', 101, CAST(N'1997-05-26T00:00:00.000' AS DateTime), CAST(N'1997-06-23T00:00:00.000' AS DateTime), CAST(N'1997-06-02T00:00:00.000' AS DateTime), 2, CAST(1.4300 AS Decimal(10, 4)), N'Toms Spezialitten', N'Luisenstr. 48', N'Mnster', N'NULL', N'44087', N'Germany')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (102, N'102', 102, CAST(N'1997-05-27T00:00:00.000' AS DateTime), CAST(N'1997-06-10T00:00:00.000' AS DateTime), CAST(N'1997-05-30T00:00:00.000' AS DateTime), 1, CAST(171.2400 AS Decimal(10, 4)), N'QUICK-Stop', N'Taucherstrae 10', N'Cunewalde', N'NULL', N'1307', N'Germany')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (103, N'103', 103, CAST(N'1997-05-28T00:00:00.000' AS DateTime), CAST(N'1997-06-25T00:00:00.000' AS DateTime), CAST(N'1997-06-06T00:00:00.000' AS DateTime), 3, CAST(4.3200 AS Decimal(10, 4)), N'Godos Cocina Tpica', N'C/ Romero 33', N'Sevilla', N'NULL', N'41101', N'Spain')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (104, N'104', 104, CAST(N'1997-05-28T00:00:00.000' AS DateTime), CAST(N'1997-07-09T00:00:00.000' AS DateTime), CAST(N'1997-06-06T00:00:00.000' AS DateTime), 3, CAST(72.9500 AS Decimal(10, 4)), N'Furia Bacalhau e Frutos do Mar', N'Jardim das rosas n. 32', N'Lisboa', N'NULL', N'1675', N'Portugal')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (105, N'105', 105, CAST(N'1997-05-29T00:00:00.000' AS DateTime), CAST(N'1997-06-26T00:00:00.000' AS DateTime), CAST(N'1997-06-05T00:00:00.000' AS DateTime), 1, CAST(83.2200 AS Decimal(10, 4)), N'HILARION-Abastos', N'Carrera 22 con Ave. Carlos Soublette #8-35', N'San Cristbal', N'Tchira', N'5022', N'Venezuela')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (106, N'106', 106, CAST(N'1997-05-30T00:00:00.000' AS DateTime), CAST(N'1997-06-27T00:00:00.000' AS DateTime), CAST(N'1997-06-03T00:00:00.000' AS DateTime), 2, CAST(149.4900 AS Decimal(10, 4)), N'Wartian Herkku', N'Torikatu 38', N'Oulu', N'NULL', N'90110', N'Finland')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (107, N'107', 107, CAST(N'1997-05-30T00:00:00.000' AS DateTime), CAST(N'1997-06-27T00:00:00.000' AS DateTime), CAST(N'1997-06-05T00:00:00.000' AS DateTime), 3, CAST(120.9700 AS Decimal(10, 4)), N'Ottilies Kseladen', N'Mehrheimerstr. 369', N'Kln', N'NULL', N'50739', N'Germany')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (108, N'108', 108, CAST(N'1997-06-02T00:00:00.000' AS DateTime), CAST(N'1997-06-30T00:00:00.000' AS DateTime), CAST(N'1997-06-04T00:00:00.000' AS DateTime), 3, CAST(252.4900 AS Decimal(10, 4)), N'Save-a-lot Markets', N'187 Suffolk Ln.', N'Boise', N'ID', N'83720', N'USA')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (109, N'109', 109, CAST(N'1997-06-03T00:00:00.000' AS DateTime), CAST(N'1997-07-15T00:00:00.000' AS DateTime), CAST(N'1997-06-13T00:00:00.000' AS DateTime), 1, CAST(9.8000 AS Decimal(10, 4)), N'Simons bistro', N'Vinbltet 34', N'Kobenhavn', N'NULL', N'1734', N'Denmark')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (110, N'110', 110, CAST(N'1997-06-03T00:00:00.000' AS DateTime), CAST(N'1997-06-17T00:00:00.000' AS DateTime), CAST(N'1997-06-06T00:00:00.000' AS DateTime), 2, CAST(96.7200 AS Decimal(10, 4)), N'Lehmanns Marktstand', N'Magazinweg 7', N'Frankfurt a.M.', N'NULL', N'60528', N'Germany')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (111, N'111', 111, CAST(N'1997-06-04T00:00:00.000' AS DateTime), CAST(N'1997-07-02T00:00:00.000' AS DateTime), CAST(N'1997-06-10T00:00:00.000' AS DateTime), 2, CAST(72.9700 AS Decimal(10, 4)), N'Around the Horn', N'Brook Farm Stratford St. Mary', N'Colchester', N'Essex', N'CO7 6JX', N'UK')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (112, N'112', 112, CAST(N'1997-06-05T00:00:00.000' AS DateTime), CAST(N'1997-07-03T00:00:00.000' AS DateTime), CAST(N'1997-06-13T00:00:00.000' AS DateTime), 1, CAST(8.0500 AS Decimal(10, 4)), N'Blondel pre et fils 24', N' place Klber', N'Strasbourg', N'NULL', N'67000', N'France')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (113, N'113', 113, CAST(N'1997-06-06T00:00:00.000' AS DateTime), CAST(N'1997-07-04T00:00:00.000' AS DateTime), CAST(N'1997-06-09T00:00:00.000' AS DateTime), 1, CAST(36.6500 AS Decimal(10, 4)), N'Frankenversand', N'Berliner Platz 43', N'Mnchen', N'NULL', N'80805', N'Germany')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (114, N'114', 114, CAST(N'1997-06-06T00:00:00.000' AS DateTime), CAST(N'1997-07-04T00:00:00.000' AS DateTime), CAST(N'1997-06-09T00:00:00.000' AS DateTime), 2, CAST(242.2100 AS Decimal(10, 4)), N'Folk och f HB', N'kergatan 24', N'Brcke', N'NULL', N'S-844 67', N'Sweden')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (115, N'115', 115, CAST(N'1997-06-09T00:00:00.000' AS DateTime), CAST(N'1997-07-07T00:00:00.000' AS DateTime), CAST(N'1997-06-12T00:00:00.000' AS DateTime), 1, CAST(22.9500 AS Decimal(10, 4)), N'Reggiani Caseifici', N'Strada Provinciale 124', N'Reggio Emilia', N'NULL', N'42100', N'Italy')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (116, N'116', 116, CAST(N'1997-06-10T00:00:00.000' AS DateTime), CAST(N'1997-07-22T00:00:00.000' AS DateTime), CAST(N'1997-06-24T00:00:00.000' AS DateTime), 2, CAST(60.4300 AS Decimal(10, 4)), N'Ricardo Adocicados', N'Av. Copacabana 267', N'Rio de Janeiro', N'RJ', N'02389-890', N'Brazil')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (117, N'117', 117, CAST(N'1997-06-10T00:00:00.000' AS DateTime), CAST(N'1997-07-08T00:00:00.000' AS DateTime), CAST(N'1997-06-16T00:00:00.000' AS DateTime), 3, CAST(13.7500 AS Decimal(10, 4)), N'Rattlesnake Canyon Grocery', N'2817 Milton Dr.', N'Albuquerque', N'NM', N'87110', N'USA')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (118, N'118', 118, CAST(N'1997-06-11T00:00:00.000' AS DateTime), CAST(N'1997-07-09T00:00:00.000' AS DateTime), CAST(N'1997-06-18T00:00:00.000' AS DateTime), 2, CAST(7.1500 AS Decimal(10, 4)), N'Mre Paillarde', N'43 rue St. Laurent', N'Montral', N'Qubec', N'H1J 1C3', N'Canada')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (119, N'119', 119, CAST(N'1997-06-12T00:00:00.000' AS DateTime), CAST(N'1997-07-10T00:00:00.000' AS DateTime), CAST(N'1997-06-18T00:00:00.000' AS DateTime), 1, CAST(88.4000 AS Decimal(10, 4)), N'Blondel pre et fils 24', N' place Klber', N'Strasbourg', N'NULL', N'67000', N'France')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (120, N'120', 120, CAST(N'1997-06-12T00:00:00.000' AS DateTime), CAST(N'1997-07-10T00:00:00.000' AS DateTime), CAST(N'1997-06-17T00:00:00.000' AS DateTime), 1, CAST(33.9700 AS Decimal(10, 4)), N'Hungry Owl All-Night Grocers', N'8 Johnstown Road', N'Cork', N'Co. Cork', N'NULL', N'Ireland')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (121, N'121', 121, CAST(N'1997-06-13T00:00:00.000' AS DateTime), CAST(N'1997-07-11T00:00:00.000' AS DateTime), CAST(N'1997-07-09T00:00:00.000' AS DateTime), 3, CAST(6.5400 AS Decimal(10, 4)), N'Galera del gastronmo', N'Rambla de Catalua 23', N'Barcelona', N'NULL', N'8022', N'Spain')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (122, N'122', 122, CAST(N'1997-06-16T00:00:00.000' AS DateTime), CAST(N'1997-07-14T00:00:00.000' AS DateTime), CAST(N'1997-07-11T00:00:00.000' AS DateTime), 1, CAST(58.9800 AS Decimal(10, 4)), N'Rattlesnake Canyon Grocery', N'2817 Milton Dr.', N'Albuquerque', N'NM', N'87110', N'USA')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (123, N'123', 123, CAST(N'1997-06-17T00:00:00.000' AS DateTime), CAST(N'1997-07-15T00:00:00.000' AS DateTime), CAST(N'1997-06-19T00:00:00.000' AS DateTime), 3, CAST(188.9900 AS Decimal(10, 4)), N'Mre Paillarde', N'43 rue St. Laurent', N'Montral', N'Qubec', N'H1J 1C3', N'Canada')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (124, N'200', 124, CAST(N'1997-06-17T00:00:00.000' AS DateTime), CAST(N'1997-07-29T00:00:00.000' AS DateTime), CAST(N'1997-07-04T00:00:00.000' AS DateTime), 3, CAST(26.0600 AS Decimal(10, 4)), N'Ernst Handel', N'Kirchgasse 6', N'Graz', N'NULL', N'8010', N'Austria')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (125, N'125', 125, CAST(N'1997-06-18T00:00:00.000' AS DateTime), CAST(N'1997-07-16T00:00:00.000' AS DateTime), CAST(N'1997-06-25T00:00:00.000' AS DateTime), 2, CAST(116.4300 AS Decimal(10, 4)), N'Berglunds snabbkp', N'Berguvsvgen 8', N'Lule', N'NULL', N'S-958 22', N'Sweden')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (126, N'126', 126, CAST(N'1997-06-19T00:00:00.000' AS DateTime), CAST(N'1997-07-17T00:00:00.000' AS DateTime), CAST(N'1997-06-20T00:00:00.000' AS DateTime), 3, CAST(84.8400 AS Decimal(10, 4)), N'Antonio Moreno Taquera', N'Mataderos 2312', N'Mxico D.F.', N'NULL', N'5023', N'Mexico')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (127, N'127', 127, CAST(N'1997-06-19T00:00:00.000' AS DateTime), CAST(N'1997-07-17T00:00:00.000' AS DateTime), CAST(N'1997-06-30T00:00:00.000' AS DateTime), 2, CAST(37.6000 AS Decimal(10, 4)), N'Trail-s Head Gourmet Provisioners', N'722 DaVinci Blvd.', N'Kirkland', N'WA', N'98034', N'USA')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (128, N'128', 128, CAST(N'1997-06-20T00:00:00.000' AS DateTime), CAST(N'1997-07-04T00:00:00.000' AS DateTime), CAST(N'1997-06-30T00:00:00.000' AS DateTime), 1, CAST(127.3400 AS Decimal(10, 4)), N'Morgenstern Gesundkost', N'Heerstr. 22', N'Leipzig', N'NULL', N'4179', N'Germany')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (129, N'129', 129, CAST(N'1997-06-23T00:00:00.000' AS DateTime), CAST(N'1997-07-07T00:00:00.000' AS DateTime), CAST(N'1997-06-30T00:00:00.000' AS DateTime), 3, CAST(18.5600 AS Decimal(10, 4)), N'Tortuga Restaurante', N'Avda. Azteca 123', N'Mxico D.F.', N'NULL', N'5033', N'Mexico')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (130, N'130', 130, CAST(N'1997-06-23T00:00:00.000' AS DateTime), CAST(N'1997-08-04T00:00:00.000' AS DateTime), CAST(N'1997-06-30T00:00:00.000' AS DateTime), 2, CAST(25.4100 AS Decimal(10, 4)), N'Trail-s Head Gourmet Provisioners', N'722 DaVinci Blvd.', N'Kirkland', N'WA', N'98034', N'USA')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (131, N'131', 131, CAST(N'1997-06-24T00:00:00.000' AS DateTime), CAST(N'1997-07-22T00:00:00.000' AS DateTime), CAST(N'1997-07-25T00:00:00.000' AS DateTime), 3, CAST(29.6000 AS Decimal(10, 4)), N'B-s Beverages', N'Fauntleroy Circus', N'London', N'NULL', N'EC2 5NT', N'UK')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (132, N'132', 132, CAST(N'1997-06-25T00:00:00.000' AS DateTime), CAST(N'1997-07-23T00:00:00.000' AS DateTime), CAST(N'1997-07-04T00:00:00.000' AS DateTime), 2, CAST(13.7300 AS Decimal(10, 4)), N'Let-s Stop N Shop', N'87 Polk St. Suite 5', N'San Francisco', N'CA', N'94117', N'USA')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (133, N'17', 133, CAST(N'1997-06-26T00:00:00.000' AS DateTime), CAST(N'1997-07-24T00:00:00.000' AS DateTime), CAST(N'1997-07-01T00:00:00.000' AS DateTime), 3, CAST(75.8900 AS Decimal(10, 4)), N'Ottilies Kseladen', N'Mehrheimerstr. 369', N'Kln', N'NULL', N'50739', N'Germany')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (134, N'134', 134, CAST(N'1997-06-26T00:00:00.000' AS DateTime), CAST(N'1997-07-24T00:00:00.000' AS DateTime), CAST(N'1997-07-02T00:00:00.000' AS DateTime), 1, CAST(3.0100 AS Decimal(10, 4)), N'Familia Arquibaldo', N'Rua Ors 92', N'Sao Paulo', N'SP', N'05442-030', N'Brazil')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (135, N'135', 135, CAST(N'1997-06-27T00:00:00.000' AS DateTime), CAST(N'1997-07-25T00:00:00.000' AS DateTime), CAST(N'1997-07-14T00:00:00.000' AS DateTime), 2, CAST(27.7100 AS Decimal(10, 4)), N'Blauer See Delikatessen', N'Forsterstr. 57', N'Mannheim', N'NULL', N'68306', N'Germany')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (136, N'136', 136, CAST(N'1997-06-30T00:00:00.000' AS DateTime), CAST(N'1997-07-28T00:00:00.000' AS DateTime), CAST(N'1997-07-04T00:00:00.000' AS DateTime), 2, CAST(7.2800 AS Decimal(10, 4)), N'Wartian Herkku', N'Torikatu 38', N'Oulu', N'NULL', N'90110', N'Finland')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (137, N'137', 137, CAST(N'1997-06-30T00:00:00.000' AS DateTime), CAST(N'1997-07-28T00:00:00.000' AS DateTime), CAST(N'1997-07-04T00:00:00.000' AS DateTime), 1, CAST(59.1400 AS Decimal(10, 4)), N'Blondel pre et fils 24', N' place Klber', N'Strasbourg', N'NULL', N'67000', N'France')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (138, N'138', 138, CAST(N'1997-07-01T00:00:00.000' AS DateTime), CAST(N'1997-07-29T00:00:00.000' AS DateTime), CAST(N'1997-07-10T00:00:00.000' AS DateTime), 1, CAST(13.4100 AS Decimal(10, 4)), N'Wellington Importadora', N'Rua do Mercado 12', N'Resende', N'SP', N'08737-363', N'Brazil')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (139, N'139', 139, CAST(N'1997-07-02T00:00:00.000' AS DateTime), CAST(N'1997-07-30T00:00:00.000' AS DateTime), CAST(N'1997-07-09T00:00:00.000' AS DateTime), 1, CAST(0.4800 AS Decimal(10, 4)), N'Reggiani Caseifici', N'Strada Provinciale 124', N'Reggio Emilia', N'NULL', N'42100', N'Italy')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (140, N'140', 140, CAST(N'1997-07-02T00:00:00.000' AS DateTime), CAST(N'1997-07-30T00:00:00.000' AS DateTime), CAST(N'1997-07-09T00:00:00.000' AS DateTime), 1, CAST(62.5200 AS Decimal(10, 4)), N'Que Delcia', N'Rua da Panificadora 12', N'Rio de Janeiro', N'RJ', N'02389-673', N'Brazil')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (141, N'141', 141, CAST(N'1997-07-03T00:00:00.000' AS DateTime), CAST(N'1997-07-31T00:00:00.000' AS DateTime), CAST(N'1997-07-10T00:00:00.000' AS DateTime), 3, CAST(194.6700 AS Decimal(10, 4)), N'QUICK-Stop', N'Taucherstrae 10', N'Cunewalde', N'NULL', N'1307', N'Germany')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (142, N'142', 142, CAST(N'1997-07-04T00:00:00.000' AS DateTime), CAST(N'1997-08-01T00:00:00.000' AS DateTime), CAST(N'1997-07-14T00:00:00.000' AS DateTime), 2, CAST(4.4200 AS Decimal(10, 4)), N'Great Lakes Food Market', N'2732 Baker Blvd.', N'Eugene', N'OR', N'97403', N'USA')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (143, N'143', 143, CAST(N'1997-07-07T00:00:00.000' AS DateTime), CAST(N'1997-08-04T00:00:00.000' AS DateTime), CAST(N'1997-07-14T00:00:00.000' AS DateTime), 3, CAST(44.7700 AS Decimal(10, 4)), N'Mre Paillarde', N'43 rue St. Laurent', N'Montral', N'Qubec', N'H1J 1C3', N'Canada')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (144, N'144', 144, CAST(N'1997-07-07T00:00:00.000' AS DateTime), CAST(N'1997-07-21T00:00:00.000' AS DateTime), CAST(N'1997-07-16T00:00:00.000' AS DateTime), 1, CAST(55.9200 AS Decimal(10, 4)), N'Vaffeljernet', N'Smagsloget 45', N'rhus', N'NULL', N'8200', N'Denmark')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (145, N'145', 145, CAST(N'1997-07-08T00:00:00.000' AS DateTime), CAST(N'1997-08-05T00:00:00.000' AS DateTime), CAST(N'1997-07-16T00:00:00.000' AS DateTime), 1, CAST(32.1000 AS Decimal(10, 4)), N'Lehmanns Marktstand', N'Magazinweg 7', N'Frankfurt a.M.', N'NULL', N'60528', N'Germany')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (146, N'146', 146, CAST(N'1997-07-09T00:00:00.000' AS DateTime), CAST(N'1997-08-06T00:00:00.000' AS DateTime), CAST(N'1997-08-13T00:00:00.000' AS DateTime), 2, CAST(174.2000 AS Decimal(10, 4)), N'Lehmanns Marktstand', N'Magazinweg 7', N'Frankfurt a.M.', N'NULL', N'60528', N'Germany')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (147, N'147', 147, CAST(N'1997-07-09T00:00:00.000' AS DateTime), CAST(N'1997-08-06T00:00:00.000' AS DateTime), CAST(N'1997-07-16T00:00:00.000' AS DateTime), 2, CAST(5.2400 AS Decimal(10, 4)), N'Old World Delicatessen', N'2743 Bering St.', N'Anchorage', N'AK', N'99508', N'USA')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (148, N'148', 148, CAST(N'1997-07-10T00:00:00.000' AS DateTime), CAST(N'1997-08-07T00:00:00.000' AS DateTime), CAST(N'1997-07-14T00:00:00.000' AS DateTime), 1, CAST(96.7800 AS Decimal(10, 4)), N'Ernst Handel', N'Kirchgasse 6', N'Graz', N'NULL', N'8010', N'Austria')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (149, N'149', 149, CAST(N'1997-07-11T00:00:00.000' AS DateTime), CAST(N'1997-08-08T00:00:00.000' AS DateTime), CAST(N'1997-08-12T00:00:00.000' AS DateTime), 1, CAST(16.3400 AS Decimal(10, 4)), N'White Clover Markets', N'1029 - 12th Ave. S.', N'Seattle', N'WA', N'98124', N'USA')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (150, N'150', 150, CAST(N'1997-07-11T00:00:00.000' AS DateTime), CAST(N'1997-08-08T00:00:00.000' AS DateTime), CAST(N'1997-07-18T00:00:00.000' AS DateTime), 3, CAST(35.1200 AS Decimal(10, 4)), N'Piccolo und mehr', N'Geislweg 14', N'Salzburg', N'NULL', N'5020', N'Austria')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (151, N'151', 151, CAST(N'1997-07-14T00:00:00.000' AS DateTime), CAST(N'1997-08-11T00:00:00.000' AS DateTime), CAST(N'1997-07-18T00:00:00.000' AS DateTime), 3, CAST(44.4200 AS Decimal(10, 4)), N'Rattlesnake Canyon Grocery', N'2817 Milton Dr.', N'Albuquerque', N'NM', N'87110', N'USA')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (152, N'152', 152, CAST(N'1997-07-15T00:00:00.000' AS DateTime), CAST(N'1997-08-26T00:00:00.000' AS DateTime), CAST(N'1997-07-21T00:00:00.000' AS DateTime), 3, CAST(29.9800 AS Decimal(10, 4)), N'B-s Beverages', N'Fauntleroy Circus', N'London', N'NULL', N'EC2 5NT', N'UK')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (153, N'153', 153, CAST(N'1997-07-16T00:00:00.000' AS DateTime), CAST(N'1997-08-13T00:00:00.000' AS DateTime), CAST(N'1997-07-21T00:00:00.000' AS DateTime), 1, CAST(45.1300 AS Decimal(10, 4)), N'Hungry Coyote Import Store', N'City Center Plaza 516 Main St.', N'Elgin', N'OR', N'97827', N'USA')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (154, N'154', 154, CAST(N'1997-07-16T00:00:00.000' AS DateTime), CAST(N'1997-08-27T00:00:00.000' AS DateTime), CAST(N'1997-07-22T00:00:00.000' AS DateTime), 1, CAST(58.3000 AS Decimal(10, 4)), N'HILARION-Abastos', N'Carrera 22 con Ave. Carlos Soublette #8-35', N'San Cristbal', N'Tchira', N'5022', N'Venezuela')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (155, N'155', 155, CAST(N'1997-07-17T00:00:00.000' AS DateTime), CAST(N'1997-08-14T00:00:00.000' AS DateTime), CAST(N'1997-07-22T00:00:00.000' AS DateTime), 2, CAST(2.9200 AS Decimal(10, 4)), N'Vaffeljernet', N'Smagsloget 45', N'rhus', N'NULL', N'8200', N'Denmark')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (156, N'156', 156, CAST(N'1997-07-18T00:00:00.000' AS DateTime), CAST(N'1997-08-15T00:00:00.000' AS DateTime), CAST(N'1997-08-08T00:00:00.000' AS DateTime), 2, CAST(48.7700 AS Decimal(10, 4)), N'Save-a-lot Markets', N'187 Suffolk Ln.', N'Boise', N'ID', N'83720', N'USA')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (157, N'157', 157, CAST(N'1997-07-18T00:00:00.000' AS DateTime), CAST(N'1997-08-15T00:00:00.000' AS DateTime), CAST(N'1997-07-29T00:00:00.000' AS DateTime), 1, CAST(7.4600 AS Decimal(10, 4)), N'Furia Bacalhau e Frutos do Mar', N'Jardim das rosas n. 32', N'Lisboa', N'NULL', N'1675', N'Portugal')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (158, N'158', 158, CAST(N'1997-07-21T00:00:00.000' AS DateTime), CAST(N'1997-08-18T00:00:00.000' AS DateTime), CAST(N'1997-07-29T00:00:00.000' AS DateTime), 2, CAST(379.1300 AS Decimal(10, 4)), N'Mre Paillarde', N'43 rue St. Laurent', N'Montral', N'Qubec', N'H1J 1C3', N'Canada')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (159, N'159', 159, CAST(N'1997-07-22T00:00:00.000' AS DateTime), CAST(N'1997-08-19T00:00:00.000' AS DateTime), CAST(N'1997-07-31T00:00:00.000' AS DateTime), 3, CAST(79.4000 AS Decimal(10, 4)), N'Tradiao Hipermercados', N'Av. Ins de Castro 414', N'Sao Paulo', N'SP', N'05634-030', N'Brazil')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (160, N'160', 160, CAST(N'1997-07-22T00:00:00.000' AS DateTime), CAST(N'1997-08-19T00:00:00.000' AS DateTime), CAST(N'1997-07-25T00:00:00.000' AS DateTime), 1, CAST(200.2400 AS Decimal(10, 4)), N'Save-a-lot Markets', N'187 Suffolk Ln.', N'Boise', N'ID', N'83720', N'USA')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (161, N'161', 161, CAST(N'1997-07-23T00:00:00.000' AS DateTime), CAST(N'1997-08-20T00:00:00.000' AS DateTime), CAST(N'1997-08-01T00:00:00.000' AS DateTime), 2, CAST(27.7900 AS Decimal(10, 4)), N'Toms Spezialitten', N'Luisenstr. 48', N'Mnster', N'NULL', N'44087', N'Germany')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (162, N'162', 162, CAST(N'1997-07-24T00:00:00.000' AS DateTime), CAST(N'1997-08-21T00:00:00.000' AS DateTime), CAST(N'1997-07-30T00:00:00.000' AS DateTime), 2, CAST(1.8500 AS Decimal(10, 4)), N'Du monde entier 67', N' rue des Cinquante Otages', N'Nantes', N'NULL', N'44000', N'France')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (163, N'163', 163, CAST(N'1997-07-25T00:00:00.000' AS DateTime), CAST(N'1997-08-22T00:00:00.000' AS DateTime), CAST(N'1997-08-06T00:00:00.000' AS DateTime), 1, CAST(26.7800 AS Decimal(10, 4)), N'La maison d-Asie', N'1 rue Alsace-Lorraine', N'Toulouse', N'NULL', N'31000', N'France')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (164, N'104', 164, CAST(N'1997-07-25T00:00:00.000' AS DateTime), CAST(N'1997-08-22T00:00:00.000' AS DateTime), CAST(N'1997-08-01T00:00:00.000' AS DateTime), 2, CAST(80.6500 AS Decimal(10, 4)), N'Wolski Zajazd', N'ul. Filtrowa 68', N'Warszawa', N'NULL', N'01-012', N'Poland')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (165, N'165', 165, CAST(N'1997-07-28T00:00:00.000' AS DateTime), CAST(N'1997-08-25T00:00:00.000' AS DateTime), CAST(N'1997-08-01T00:00:00.000' AS DateTime), 2, CAST(544.0800 AS Decimal(10, 4)), N'Save-a-lot Markets', N'187 Suffolk Ln.', N'Boise', N'ID', N'83720', N'USA')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (166, N'166', 166, CAST(N'1997-07-29T00:00:00.000' AS DateTime), CAST(N'1997-08-26T00:00:00.000' AS DateTime), CAST(N'1997-08-01T00:00:00.000' AS DateTime), 2, CAST(8.1100 AS Decimal(10, 4)), N'HILARION-Abastos', N'Carrera 22 con Ave. Carlos Soublette #8-35', N'San Cristbal', N'Tchira', N'5022', N'Venezuela')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (167, N'167', 167, CAST(N'1997-07-29T00:00:00.000' AS DateTime), CAST(N'1997-08-26T00:00:00.000' AS DateTime), CAST(N'1997-08-01T00:00:00.000' AS DateTime), 3, CAST(1.9300 AS Decimal(10, 4)), N'Blauer See Delikatessen', N'Forsterstr. 57', N'Mannheim', N'NULL', N'68306', N'Germany')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (168, N'168', 168, CAST(N'1997-07-30T00:00:00.000' AS DateTime), CAST(N'1997-08-27T00:00:00.000' AS DateTime), CAST(N'1997-08-06T00:00:00.000' AS DateTime), 3, CAST(0.7500 AS Decimal(10, 4)), N'Wilman Kala', N'Keskuskatu 45', N'Helsinki', N'NULL', N'21240', N'Finland')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (169, N'169', 169, CAST(N'1997-07-31T00:00:00.000' AS DateTime), CAST(N'1997-08-28T00:00:00.000' AS DateTime), CAST(N'1997-08-05T00:00:00.000' AS DateTime), 2, CAST(116.5300 AS Decimal(10, 4)), N'Great Lakes Food Market', N'2732 Baker Blvd.', N'Eugene', N'OR', N'97403', N'USA')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (170, N'170', 170, CAST(N'1997-07-31T00:00:00.000' AS DateTime), CAST(N'1997-08-28T00:00:00.000' AS DateTime), CAST(N'1997-08-04T00:00:00.000' AS DateTime), 2, CAST(18.5300 AS Decimal(10, 4)), N'Great Lakes Food Market', N'2732 Baker Blvd.', N'Eugene', N'OR', N'97403', N'USA')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (171, N'171', 171, CAST(N'1997-08-01T00:00:00.000' AS DateTime), CAST(N'1997-09-12T00:00:00.000' AS DateTime), CAST(N'1997-08-08T00:00:00.000' AS DateTime), 1, CAST(154.6800 AS Decimal(10, 4)), N'Mre Paillarde', N'43 rue St. Laurent', N'Montral', N'Qubec', N'H1J 1C3', N'Canada')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (172, N'172', 172, CAST(N'1997-08-04T00:00:00.000' AS DateTime), CAST(N'1997-09-01T00:00:00.000' AS DateTime), CAST(N'1997-08-07T00:00:00.000' AS DateTime), 3, CAST(91.0500 AS Decimal(10, 4)), N'Mre Paillarde', N'43 rue St. Laurent', N'Montral', N'Qubec', N'H1J 1C3', N'Canada')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (173, N'173', 173, CAST(N'1997-08-05T00:00:00.000' AS DateTime), CAST(N'1997-09-02T00:00:00.000' AS DateTime), CAST(N'1997-08-14T00:00:00.000' AS DateTime), 3, CAST(0.9400 AS Decimal(10, 4)), N'Laughing Bacchus Wine Cellars', N'2319 Elm St.', N'Vancouver', N'BC', N'V3F 2K1', N'Canada')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (174, N'174', 174, CAST(N'1997-08-05T00:00:00.000' AS DateTime), CAST(N'1997-09-02T00:00:00.000' AS DateTime), CAST(N'1997-08-11T00:00:00.000' AS DateTime), 2, CAST(23.7300 AS Decimal(10, 4)), N'Island Trading', N'Garden House Crowther Way', N'Cowes', N'Isle of Wight', N'PO31 7PJ', N'UK')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (175, N'175', 175, CAST(N'1997-08-06T00:00:00.000' AS DateTime), CAST(N'1997-09-03T00:00:00.000' AS DateTime), CAST(N'1997-08-11T00:00:00.000' AS DateTime), 3, CAST(50.9700 AS Decimal(10, 4)), N'Ricardo Adocicados', N'Av. Copacabana 267', N'Rio de Janeiro', N'RJ', N'02389-890', N'Brazil')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (176, N'176', 176, CAST(N'1997-08-07T00:00:00.000' AS DateTime), CAST(N'1997-09-04T00:00:00.000' AS DateTime), CAST(N'1997-08-12T00:00:00.000' AS DateTime), 2, CAST(97.1800 AS Decimal(10, 4)), N'Frankenversand', N'Berliner Platz 43', N'Mnchen', N'NULL', N'80805', N'Germany')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (177, N'177', 177, CAST(N'1997-08-07T00:00:00.000' AS DateTime), CAST(N'1997-09-04T00:00:00.000' AS DateTime), CAST(N'1997-08-19T00:00:00.000' AS DateTime), 2, CAST(94.8000 AS Decimal(10, 4)), N'The Cracker Box', N'55 Grizzly Peak Rd.', N'Butte', N'MT', N'59801', N'USA')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (178, N'178', 178, CAST(N'1997-08-08T00:00:00.000' AS DateTime), CAST(N'1997-09-05T00:00:00.000' AS DateTime), CAST(N'1997-08-14T00:00:00.000' AS DateTime), 1, CAST(43.9000 AS Decimal(10, 4)), N'Ana Trujillo Emparedados y helados', N'Avda. de la Constitucin 2222', N'Mxico D.F.', N'NULL', N'5021', N'Mexico')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (179, N'179', 179, CAST(N'1997-08-11T00:00:00.000' AS DateTime), CAST(N'1997-09-08T00:00:00.000' AS DateTime), CAST(N'1997-08-20T00:00:00.000' AS DateTime), 2, CAST(138.6900 AS Decimal(10, 4)), N'Berglunds snabbkp', N'Berguvsvgen 8', N'Lule', N'NULL', N'S-958 22', N'Sweden')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (180, N'180', 180, CAST(N'1997-08-11T00:00:00.000' AS DateTime), CAST(N'1997-09-22T00:00:00.000' AS DateTime), CAST(N'1997-08-21T00:00:00.000' AS DateTime), 3, CAST(107.4600 AS Decimal(10, 4)), N'Save-a-lot Markets', N'187 Suffolk Ln.', N'Boise', N'ID', N'83720', N'USA')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (181, N'181', 181, CAST(N'1997-08-12T00:00:00.000' AS DateTime), CAST(N'1997-09-09T00:00:00.000' AS DateTime), CAST(N'1997-08-20T00:00:00.000' AS DateTime), 3, CAST(30.3600 AS Decimal(10, 4)), N'Blondel pre et fils 24', N' place Klber', N'Strasbourg', N'NULL', N'67000', N'France')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (182, N'182', 182, CAST(N'1997-08-12T00:00:00.000' AS DateTime), CAST(N'1997-09-09T00:00:00.000' AS DateTime), CAST(N'1997-08-20T00:00:00.000' AS DateTime), 3, CAST(85.4600 AS Decimal(10, 4)), N'Godos Cocina Tpica', N'C/ Romero 33', N'Sevilla', N'NULL', N'41101', N'Spain')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (183, N'183', 183, CAST(N'1997-08-13T00:00:00.000' AS DateTime), CAST(N'1997-09-10T00:00:00.000' AS DateTime), CAST(N'1997-08-19T00:00:00.000' AS DateTime), 2, CAST(32.3500 AS Decimal(10, 4)), N'Kniglich Essen', N'Maubelstr. 90', N'Brandenburg', N'NULL', N'14776', N'Germany')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (184, N'184', 184, CAST(N'1997-08-14T00:00:00.000' AS DateTime), CAST(N'1997-09-11T00:00:00.000' AS DateTime), CAST(N'1997-08-15T00:00:00.000' AS DateTime), 1, CAST(0.8700 AS Decimal(10, 4)), N'La maison d-Asie', N'1 rue Alsace-Lorraine', N'Toulouse', N'NULL', N'31000', N'France')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (185, N'185', 185, CAST(N'1997-08-14T00:00:00.000' AS DateTime), CAST(N'1997-09-11T00:00:00.000' AS DateTime), CAST(N'1997-08-19T00:00:00.000' AS DateTime), 1, CAST(41.3800 AS Decimal(10, 4)), N'Die Wandernde Kuh', N'Adenauerallee 900', N'Stuttgart', N'NULL', N'70563', N'Germany')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (186, N'186', 186, CAST(N'1997-08-15T00:00:00.000' AS DateTime), CAST(N'1997-09-12T00:00:00.000' AS DateTime), CAST(N'1997-08-18T00:00:00.000' AS DateTime), 3, CAST(477.9000 AS Decimal(10, 4)), N'Ernst Handel', N'Kirchgasse 6', N'Graz', N'NULL', N'8010', N'Austria')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (187, N'187', 187, CAST(N'1997-08-15T00:00:00.000' AS DateTime), CAST(N'1997-09-12T00:00:00.000' AS DateTime), CAST(N'1997-08-21T00:00:00.000' AS DateTime), 3, CAST(487.3800 AS Decimal(10, 4)), N'Folies gourmandes 184', N' chausse de Tournai', N'Lille', N'NULL', N'59000', N'France')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (188, N'188', 188, CAST(N'1997-08-18T00:00:00.000' AS DateTime), CAST(N'1997-09-15T00:00:00.000' AS DateTime), CAST(N'1997-08-21T00:00:00.000' AS DateTime), 3, CAST(47.4600 AS Decimal(10, 4)), N'Magazzini Alimentari Riuniti', N'Via Ludovico il Moro 22', N'Bergamo', N'NULL', N'24100', N'Italy')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (189, N'189', 189, CAST(N'1997-08-19T00:00:00.000' AS DateTime), CAST(N'1997-09-16T00:00:00.000' AS DateTime), CAST(N'1997-08-26T00:00:00.000' AS DateTime), 1, CAST(1.1500 AS Decimal(10, 4)), N'Wartian Herkku', N'Torikatu 38', N'Oulu', N'NULL', N'90110', N'Finland')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (190, N'104', 190, CAST(N'1997-08-19T00:00:00.000' AS DateTime), CAST(N'1997-09-16T00:00:00.000' AS DateTime), CAST(N'1997-08-26T00:00:00.000' AS DateTime), 1, CAST(201.2900 AS Decimal(10, 4)), N'Queen Cozinha', N'Alameda dos Canrios 891', N'Sao Paulo', N'SP', N'05487-020', N'Brazil')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (191, N'191', 191, CAST(N'1997-08-20T00:00:00.000' AS DateTime), CAST(N'1997-09-17T00:00:00.000' AS DateTime), CAST(N'1997-09-01T00:00:00.000' AS DateTime), 1, CAST(158.4400 AS Decimal(10, 4)), N'LINO-Delicateses', N'Ave. 5 de Mayo Porlamar', N'I. de Margarita', N'Nueva Esparta', N'4980', N'Venezuela')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (192, N'192', 192, CAST(N'1997-08-20T00:00:00.000' AS DateTime), CAST(N'1997-09-17T00:00:00.000' AS DateTime), CAST(N'1997-08-27T00:00:00.000' AS DateTime), 3, CAST(38.6400 AS Decimal(10, 4)), N'Sant Gourmet', N'Erling Skakkes gate 78', N'Stavern', N'NULL', N'4110', N'Norway')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (193, N'193', 193, CAST(N'1997-08-21T00:00:00.000' AS DateTime), CAST(N'1997-09-18T00:00:00.000' AS DateTime), CAST(N'1997-08-28T00:00:00.000' AS DateTime), 1, CAST(23.5500 AS Decimal(10, 4)), N'Die Wandernde Kuh', N'Adenauerallee 900', N'Stuttgart', N'NULL', N'70563', N'Germany')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (194, N'194', 194, CAST(N'1997-08-22T00:00:00.000' AS DateTime), CAST(N'1997-09-19T00:00:00.000' AS DateTime), CAST(N'1997-08-26T00:00:00.000' AS DateTime), 2, CAST(179.6100 AS Decimal(10, 4)), N'HILARION-Abastos', N'Carrera 22 con Ave. Carlos Soublette #8-35', N'San Cristbal', N'Tchira', N'5022', N'Venezuela')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (195, N'195', 195, CAST(N'1997-08-22T00:00:00.000' AS DateTime), CAST(N'1997-09-19T00:00:00.000' AS DateTime), CAST(N'1997-09-05T00:00:00.000' AS DateTime), 3, CAST(41.8900 AS Decimal(10, 4)), N'Simons bistro', N'Vinbltet 34', N'Kobenhavn', N'NULL', N'1734', N'Denmark')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (196, N'196', 196, CAST(N'1997-08-25T00:00:00.000' AS DateTime), CAST(N'1997-09-22T00:00:00.000' AS DateTime), CAST(N'1997-09-02T00:00:00.000' AS DateTime), 1, CAST(29.4600 AS Decimal(10, 4)), N'Alfreds Futterkiste', N'Obere Str. 57', N'Berlin', N'NULL', N'12209', N'Germany')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (197, N'6', 197, CAST(N'1997-08-25T00:00:00.000' AS DateTime), CAST(N'1997-09-22T00:00:00.000' AS DateTime), CAST(N'1997-09-01T00:00:00.000' AS DateTime), 2, CAST(0.1400 AS Decimal(10, 4)), N'Wellington Importadora', N'Rua do Mercado 12', N'Resende', N'SP', N'08737-363', N'Brazil')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (198, N'198', 198, CAST(N'1997-08-26T00:00:00.000' AS DateTime), CAST(N'1997-09-23T00:00:00.000' AS DateTime), CAST(N'1997-09-02T00:00:00.000' AS DateTime), 1, CAST(12.4100 AS Decimal(10, 4)), N'Hanari Carnes', N'Rua do Pao 67', N'Rio de Janeiro', N'RJ', N'05454-876', N'Brazil')
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (199, N'182', 199, CAST(N'1997-08-27T00:00:00.000' AS DateTime), CAST(N'1997-10-08T00:00:00.000' AS DateTime), CAST(N'1997-09-03T00:00:00.000' AS DateTime), 3, CAST(142.3300 AS Decimal(10, 4)), N'Hungry Owl All-Night Grocers', N'8 Johnstown Road', N'Cork', N'Co. Cork', N'NULL', N'Ireland')
GO
INSERT [dbo].[G1Orden] ([OrdenID], [ClienteID], [EmpleadoID], [FechaOrden], [FechaRequerida], [FechadeEntrega], [EnvioVia], [Peso], [Transporte], [DireccionTransporte], [CiudaddelTransporte], [RegiondelTransporte], [CodigoPostadelTransporte], [PaisdelTransporte]) VALUES (200, N'104', 200, CAST(N'1997-08-27T00:00:00.000' AS DateTime), CAST(N'1997-09-10T00:00:00.000' AS DateTime), CAST(N'1997-09-03T00:00:00.000' AS DateTime), 2, CAST(45.5400 AS Decimal(10, 4)), N'Que Delicia', N' Rua da Panificadora 12', N' Rio de Janeiro', N'RJ', N'02389-673', N'Brazil')
SET IDENTITY_INSERT [dbo].[G1Orden] OFF
GO
SET IDENTITY_INSERT [dbo].[G1Productos] ON 
TRUNCATE TABLE G1Productos
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (1, N'Ravioli', 1, 1, N'10 cajas x 20 bolsas', CAST(18.0000 AS Decimal(10, 4)), 39, 0, 15, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (2, N'Cafe', 2, 2, N'8 latas de 500 g', CAST(35.0000 AS Decimal(10, 4)), 17, 40, 20, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (3, N'Jarabe de anís', 3, 3, N'5 botes', CAST(18.0000 AS Decimal(10, 4)), 39, 60, 10, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (4, N'Condimento cajún del Chef Anton', 4, 4, N'5 bolsas', CAST(10.0000 AS Decimal(10, 4)), 30, 70, 25, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (5, N'Mezcla de Gumbo', 5, 5, N'5 botes', CAST(12.0000 AS Decimal(10, 4)), 20, 0, 10, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (6, N'Crema de Boysenberry de la abuela', 6, 6, N'8 cajas', CAST(17.0000 AS Decimal(10, 4)), 16, 0, 25, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (7, N'Peras secas orgánicas', 7, 7, N'10 cajas ', CAST(25.0000 AS Decimal(10, 4)), 125, 0, 30, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (8, N'Salsa de arándanos', 8, 8, N'15 bolsas', CAST(7.0000 AS Decimal(10, 4)), 40, 0, 0, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (9, N'Queso Cabrales', 9, 9, N'8 libras', CAST(50.0750 AS Decimal(10, 4)), 26, 0, 0, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (10, N'Queso Manchego La Pastora', 10, 10, N'15 libras', CAST(55.0000 AS Decimal(10, 4)), 17, 0, 0, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (11, N'Tigres de Carnarvon', 11, 11, N'15 cajas', CAST(100.0000 AS Decimal(10, 4)), 15, 40, 15, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (12, N'Galletas De Chocolate', 12, 12, N'5 paquetes', CAST(25.0000 AS Decimal(10, 4)), 35, 0, 10, 1)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (13, N'Galletas caramelo', 13, 13, N'3 cajas', CAST(15.0000 AS Decimal(10, 4)), 22, 0, 20, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (14, N'Galletas grandes', 14, 14, N'5 cajas', CAST(25.6500 AS Decimal(10, 4)), 30, 0, 30, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (15, N'Ravioli', 15, 15, N'10 cajas x 20 bolsas', CAST(19.0000 AS Decimal(10, 4)), 39, 0, 20, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (16, N'Croissants ', 16, 16, N'1 caja', CAST(55.0000 AS Decimal(10, 4)), 110, 0, 10, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (17, N'Mascarpone Fabioli ', 17, 17, N'15 bolsas', CAST(60.0000 AS Decimal(10, 4)), 105, 0, 15, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (18, N'Cerveza Sasquatch', 18, 18, N'5 cajas', CAST(80.0000 AS Decimal(10, 4)), 20, 0, 30, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (19, N'Carne de cangrejo de Boston', 19, 19, N'5 libras', CAST(85.0000 AS Decimal(10, 4)), 32, 0, 20, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (20, N'Sopa de almejas', 20, 20, N'12 latas de 12 onzas', CAST(100.6000 AS Decimal(10, 4)), 19, 50, 10, 1)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (21, N'Café ', 21, 21, N'16 latas de 500 g', CAST(35.0000 AS Decimal(10, 4)), 18, 0, 20, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (22, N'chocolatada', 22, 22, N'10 paquetes.', CAST(60.6500 AS Decimal(10, 4)), 11, 0, 20, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (23, N'Empanadas', 23, 23, N'40 ordenes', CAST(62.6000 AS Decimal(10, 4)), 31, 0, 15, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (24, N'Caracoles de Borgoña', 24, 24, N'24 piezas', CAST(15.4500 AS Decimal(10, 4)), 8, 0, 25, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (25, N'tarta de sucre', 25, 25, N'48 unidades', CAST(50.6000 AS Decimal(10, 4)), 9, 0, 15, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (26, N'Crema de verduras', 26, 26, N'15 tarros de 625 g', CAST(46.4070 AS Decimal(10, 4)), 16, 0, 25, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (27, N'Salsa picante de Luisiana', 27, 27, N'32 botellas de 8 onz', CAST(20.0000 AS Decimal(10, 4)), 19, 0, 30, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (28, N'Quimbombó especiado picante de Luisiana', 28, 28, N'24 frascos de 8 onz', CAST(21.0000 AS Decimal(10, 4)), 35, 30, 10, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (29, N'Panes largos escoceses', 29, 29, N'8 cajas x 8 piezas', CAST(135.0000 AS Decimal(10, 4)), 4, 0, 30, 1)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (30, N'Cerveza', 30, 30, N'24 botellas de 355ml', CAST(35.0000 AS Decimal(10, 4)), 8, 0, 25, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (31, N'Mozzarella', 31, 31, N'24 paquetes de 200 g', CAST(28.0000 AS Decimal(10, 4)), 3, 0, 25, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (32, N'Kaviar', 32, 32, N'24 botes de 150 g', CAST(20.0000 AS Decimal(10, 4)), 10, 0, 30, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (33, N'Huevos', 33, 33, N'8 cajas', CAST(100.0000 AS Decimal(10, 4)), 19, 0, 30, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (34, N'Limones', 34, 34, N'5 cajas', CAST(85.0000 AS Decimal(10, 4)), 25, 0, 15, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (35, N'Vodka', 35, 35, N'6 cajas de 300ml', CAST(90.8000 AS Decimal(10, 4)), 2, 0, 15, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (36, N'Vino', 36, 36, N'9 botellas', CAST(500.0000 AS Decimal(10, 4)), 45, 0, 10, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (37, N'Whisky Escoces', 37, 37, N'15 botellas de 400ml', CAST(450.0000 AS Decimal(10, 4)), 50, 0, 20, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (38, N'Pasta Italiana', 38, 38, N'8 paquetes', CAST(60.4000 AS Decimal(10, 4)), 56, 0, 25, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (39, N'Paella Española', 39, 39, N'5 cajas', CAST(80.0000 AS Decimal(10, 4)), 40, 0, 15, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (40, N'Sushi de Japón', 40, 40, N'6 cajas', CAST(60.0000 AS Decimal(10, 4)), 30, 0, 10, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (41, N'Cerveza', 41, 41, N'8 botellas de 200ml', CAST(35.5000 AS Decimal(10, 4)), 3, 0, 30, 1)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (42, N'Mate Argentino', 42, 42, N'6 botellas', CAST(38.8000 AS Decimal(10, 4)), 31, 0, 20, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (43, N'Empanadas', 43, 43, N'5 piezas', CAST(62.9000 AS Decimal(10, 4)), 46, 0, 20, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (44, N'Musaca de Grecia.', 44, 44, N'10 cajas', CAST(80.0000 AS Decimal(10, 4)), 15, 0, 10, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (45, N'Tacos', 45, 45, N'20 ordenes', CAST(18.0000 AS Decimal(10, 4)), 38, 20, 15, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (46, N'Baleadas', 46, 46, N'16 ordenes', CAST(15.0000 AS Decimal(10, 4)), 9, 0, 15, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (47, N'Coca Cola', 47, 47, N'10 paquetes', CAST(150.0000 AS Decimal(10, 4)), 7, 0, 30, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (48, N'Cerveza Hondureña', 48, 48, N'10 cajas', CAST(100.0000 AS Decimal(10, 4)), 6, 0, 20, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (49, N'Pasta Italiana', 49, 49, N'10 paquetes', CAST(80.0000 AS Decimal(10, 4)), 16, 0, 15, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (50, N'Kaviar', 50, 50, N'15 botes de 150 g', CAST(20.0000 AS Decimal(10, 4)), 61, 70, 25, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (51, N'Pasta de Curry', 51, 51, N'1 Bolsa', CAST(45.0000 AS Decimal(10, 4)), 61, 30, 25, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (52, N'Salsa Limon', 52, 52, N'10 botes ', CAST(80.0000 AS Decimal(10, 4)), 61, 70, 25, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (53, N'Salsa Picante', 53, 53, N'5 botes de', CAST(50.0000 AS Decimal(10, 4)), 62, 70, 15, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (54, N'Wasabi', 54, 54, N'2 botes', CAST(10.0000 AS Decimal(10, 4)), 64, 70, 45, 1)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (55, N'Coca Cola', 55, 55, N'8 paquetes ', CAST(150.0000 AS Decimal(10, 4)), 65, 70, 55, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (56, N'Salsa Chipotle', 56, 56, N'8 botes ', CAST(50.0000 AS Decimal(10, 4)), 67, 70, 65, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (57, N'Vino', 57, 57, N'11 botellas ', CAST(500.0000 AS Decimal(10, 4)), 69, 70, 75, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (58, N'Café', 58, 58, N'9 latas de 500 g', CAST(35.0000 AS Decimal(10, 4)), 62, 85, 85, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (59, N'Mole Verde', 59, 59, N'11 botes ', CAST(80.0000 AS Decimal(10, 4)), 64, 70, 95, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (60, N'Chile ancho', 60, 60, N'4 bolsas', CAST(70.0000 AS Decimal(10, 4)), 66, 70, 15, 1)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (61, N'Chile seco', 61, 61, N'5 bolsas', CAST(60.0000 AS Decimal(10, 4)), 51, 85, 25, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (62, N'Chile serrano', 62, 62, N'3 cajas', CAST(40.0000 AS Decimal(10, 4)), 41, 60, 55, 1)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (63, N'Kaviar', 63, 63, N'15 botes ', CAST(50.0000 AS Decimal(10, 4)), 71, 70, 45, 1)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (64, N'Mozzarella', 64, 64, N'15 botes ', CAST(20.0000 AS Decimal(10, 4)), 81, 85, 25, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (65, N'jarabe de agave', 65, 65, N'15 botes', CAST(95.0000 AS Decimal(10, 4)), 61, 65, 65, 1)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (66, N'Arina de Maiz', 66, 66, N'2 kg', CAST(80.0000 AS Decimal(10, 4)), 11, 70, 25, 1)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (67, N'Salsa valentina', 67, 67, N'2 botes', CAST(50.0000 AS Decimal(10, 4)), 59, 70, 25, 1)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (68, N'Whisky Escoces', 68, 68, N'13 botellas de 400ml', CAST(450.0000 AS Decimal(10, 4)), 57, 85, 45, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (69, N'Huevos', 69, 69, N'12 cajas ', CAST(100.0000 AS Decimal(10, 4)), 51, 65, 55, 1)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (70, N'Salsa Chipotle', 70, 70, N'5 botes ', CAST(50.0000 AS Decimal(10, 4)), 81, 60, 15, 1)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (71, N'Cerveza Sasquatch', 71, 71, N'5 cajas ', CAST(80.0000 AS Decimal(10, 4)), 58, 75, 5, 1)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (72, N'Pasta de Curry', 72, 72, N'15 botes ', CAST(80.0000 AS Decimal(10, 4)), 55, 80, 5, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (73, N'Panes largos escoceses', 73, 73, N'5 cajas', CAST(135.0000 AS Decimal(10, 4)), 52, 40, 51, 1)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (74, N'Galletas De Chocolate', 74, 74, N'8 paquetes ', CAST(25.0000 AS Decimal(10, 4)), 22, 100, 25, 1)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (75, N'Vino', 75, 75, N'12 botellas ', CAST(500.0000 AS Decimal(10, 4)), 23, 70, 15, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (76, N'Salsa de arándanos', 76, 76, N'2 bolsas', CAST(7.0000 AS Decimal(10, 4)), 41, 80, 85, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (77, N'Kaviar', 77, 77, N'4 botes de 160 g', CAST(60.0000 AS Decimal(10, 4)), 51, 50, 85, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (78, N'Vodka', 78, 78, N'6 cajas de 300ml ', CAST(90.0000 AS Decimal(10, 4)), 71, 40, 45, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (79, N'Paella Española', 79, 79, N'6 cajas', CAST(80.0000 AS Decimal(10, 4)), 86, 60, 55, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (80, N'Café', 80, 80, N'6 latas de 500 g', CAST(35.0000 AS Decimal(10, 4)), 6, 50, 25, 1)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (81, N'Queso Manchego La Pastora', 81, 81, N'8 libras', CAST(55.0000 AS Decimal(10, 4)), 71, 60, 25, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (82, N'Kaviar', 82, 82, N'6 botes ', CAST(70.0000 AS Decimal(10, 4)), 71, 50, 15, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (83, N'Empanadas', 83, 83, N'15 botes ', CAST(62.0000 AS Decimal(10, 4)), 81, 70, 15, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (84, N'Jarabe de anís', 84, 84, N'15 botes', CAST(18.0000 AS Decimal(10, 4)), 91, 60, 25, 1)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (85, N'Galletas caramelo', 85, 85, N'7 cajas', CAST(15.0000 AS Decimal(10, 4)), 41, 70, 24, 1)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (86, N'Mozzarella', 86, 86, N'15 botes ', CAST(250.0000 AS Decimal(10, 4)), 21, 60, 27, 1)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (87, N'Cerveza Hondureña', 87, 87, N'6 cajas', CAST(100.0000 AS Decimal(10, 4)), 11, 60, 26, 1)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (88, N'Mozzarella', 88, 88, N'12 paquetes', CAST(28.0000 AS Decimal(10, 4)), 52, 50, 215, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (89, N'Tacos', 89, 89, N'6 ordenes ', CAST(18.0000 AS Decimal(10, 4)), 71, 55, 21, 1)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (90, N'Chile ancho', 90, 90, N'5 bolsas', CAST(70.0000 AS Decimal(10, 4)), 31, 50, 1, 1)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (91, N'Chile serrano', 91, 91, N'3 cajas', CAST(40.0000 AS Decimal(10, 4)), 41, 50, 215, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (92, N'Kaviar', 92, 92, N'8 botes de 140 g', CAST(40.0000 AS Decimal(10, 4)), 21, 60, 21, 1)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (93, N'Vodka', 93, 93, N'7 cajas de 300ml', CAST(90.0000 AS Decimal(10, 4)), 61, 80, 21, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (94, N'Limones', 94, 94, N'7 cajas', CAST(85.0000 AS Decimal(10, 4)), 51, 75, 1, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (95, N'Salsa Limon', 95, 95, N'15 botes ', CAST(80.0000 AS Decimal(10, 4)), 81, 75, 15, 1)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (96, N'Salsa valentina', 96, 96, N'8 botes', CAST(50.0000 AS Decimal(10, 4)), 21, 76, 15, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (97, N'Ravioli', 97, 97, N'5 cajas ', CAST(19.0000 AS Decimal(10, 4)), 21, 78, 15, 1)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (98, N'Cerveza Sasquatch', 98, 98, N'15 cajas ', CAST(80.0000 AS Decimal(10, 4)), 41, 80, 25, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (99, N'Vino', 99, 99, N'10 botellas ', CAST(500.0000 AS Decimal(10, 4)), 11, 70, 25, 1)
GO
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (100, N'Panes largos escoceses', 100, 100, N'2 cajas', CAST(135.0000 AS Decimal(10, 4)), 11, 60, 15, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (101, N'Tacos', 101, 101, N'13 ordenes ', CAST(18.0000 AS Decimal(10, 4)), 31, 60, 15, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (102, N'Salsa de arándanos', 102, 102, N'5 bolsas', CAST(7.0000 AS Decimal(10, 4)), 81, 75, 25, 1)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (103, N'Mole Verde', 103, 103, N'6 botes', CAST(80.0000 AS Decimal(10, 4)), 71, 50, 23, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (104, N'Pasta de Curry', 104, 104, N'5 bolsas', CAST(45.0000 AS Decimal(10, 4)), 41, 50, 2, 1)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (105, N'Galletas De Chocolate', 105, 105, N'3 cajas', CAST(25.0000 AS Decimal(10, 4)), 41, 50, 35, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (106, N'Cerveza Hondureña', 106, 106, N'16 cajas', CAST(100.0000 AS Decimal(10, 4)), 51, 50, 35, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (107, N'Wasabi', 107, 107, N'15 botes de 150 g', CAST(50.0000 AS Decimal(10, 4)), 51, 50, 35, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (108, N'jarabe de agave', 108, 108, N'8 botes', CAST(95.0000 AS Decimal(10, 4)), 61, 70, 35, 1)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (109, N'Queso Manchego La Pastora', 109, 109, N'6 libras', CAST(55.0000 AS Decimal(10, 4)), 61, 60, 35, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (110, N'Kaviar', 110, 110, N'8 botes de 150 g', CAST(50.0000 AS Decimal(10, 4)), 71, 60, 35, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (111, N'Kaviar', 111, 111, N'6 botes de 160 g', CAST(60.0000 AS Decimal(10, 4)), 81, 60, 25, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (112, N'Empanadas', 112, 112, N'15 botes de 150 g', CAST(62.0000 AS Decimal(10, 4)), 81, 60, 55, 1)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (113, N'Galletas caramelo', 113, 113, N'6 cajas', CAST(15.0000 AS Decimal(10, 4)), 81, 50, 55, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (114, N'Tacos', 114, 114, N'15 botes de 150 g', CAST(18.0000 AS Decimal(10, 4)), 11, 50, 45, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (115, N'Chile seco', 115, 115, N'11 bolsas', CAST(60.0000 AS Decimal(10, 4)), 21, 20, 45, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (116, N'Arina de Maiz', 116, 116, N'5 kg', CAST(80.0000 AS Decimal(10, 4)), 31, 20, 45, 1)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (117, N'Paella Española', 117, 117, N'2 cajas', CAST(80.0000 AS Decimal(10, 4)), 41, 50, 45, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (118, N'Camarones', 118, 118, N'3 libras', CAST(95.0000 AS Decimal(10, 4)), 51, 40, 45, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (119, N'Huevos', 119, 119, N'5 cajas', CAST(100.0000 AS Decimal(10, 4)), 61, 40, 45, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (120, N'Chile ancho', 120, 120, N'5 bolsas', CAST(70.0000 AS Decimal(10, 4)), 71, 90, 95, 1)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (121, N'Jarabe de anís', 121, 121, N'3 botes', CAST(18.0000 AS Decimal(10, 4)), 81, 90, 95, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (122, N'Mozzarella', 122, 122, N'6 paquetes', CAST(28.0000 AS Decimal(10, 4)), 91, 90, 95, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (123, N'Kaviar', 123, 123, N'15 botes de 150 g', CAST(80.0000 AS Decimal(10, 4)), 90, 90, 95, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (124, N'Café', 124, 124, N'2 latas de 500 g', CAST(35.0000 AS Decimal(10, 4)), 41, 90, 95, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (125, N'Mozzarella', 125, 125, N'15 botes de 150 g', CAST(70.0000 AS Decimal(10, 4)), 21, 90, 65, 1)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (126, N'Chile serrano', 126, 126, N'9 cajas', CAST(40.0000 AS Decimal(10, 4)), 21, 90, 75, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (127, N'Whisky Escoces', 127, 127, N'15 botellas de 400ml', CAST(450.0000 AS Decimal(10, 4)), 41, 70, 85, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (128, N'Panes largos escoceses', 128, 128, N'4 cajas', CAST(135.0000 AS Decimal(10, 4)), 51, 70, 85, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (129, N'Kaviar', 129, 129, N'15 botes de 150 g', CAST(80.0000 AS Decimal(10, 4)), 41, 60, 55, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (130, N'Cerveza Hondureña', 130, 130, N'4 cajas', CAST(100.0000 AS Decimal(10, 4)), 41, 60, 55, 1)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (131, N'Kaviar', 131, 131, N'10 botes de 150 g', CAST(50.0000 AS Decimal(10, 4)), 41, 70, 65, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (132, N'Kaviar', 132, 132, N'11 botes de 150 g', CAST(50.0000 AS Decimal(10, 4)), 41, 30, 5, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (133, N'Salsa Chipotle', 133, 133, N'8 botes ', CAST(50.0000 AS Decimal(10, 4)), 61, 30, 42, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (134, N'Vodka', 134, 134, N'5 cajas de 300ml', CAST(90.0000 AS Decimal(10, 4)), 41, 30, 15, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (135, N'Paella Española', 135, 135, N'6 cajas', CAST(80.0000 AS Decimal(10, 4)), 41, 73, 35, 1)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (136, N'Limones', 136, 136, N'3 cajas', CAST(85.0000 AS Decimal(10, 4)), 21, 30, 55, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (137, N'Yuca', 137, 137, N'5 libras', CAST(30.0000 AS Decimal(10, 4)), 21, 30, 15, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (138, N'Kaviar', 138, 138, N'15 botes de 140 g', CAST(40.0000 AS Decimal(10, 4)), 21, 30, 55, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (139, N'Cerveza Sasquatch', 139, 139, N'9 cajas', CAST(80.0000 AS Decimal(10, 4)), 21, 75, 65, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (140, N'Salsa valentina', 140, 140, N'12 botes', CAST(50.0000 AS Decimal(10, 4)), 21, 35, 15, 1)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (141, N'Salsa de arándanos', 141, 141, N'6 bolsas', CAST(7.0000 AS Decimal(10, 4)), 81, 70, 45, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (142, N'Filete de Tilapia', 142, 142, N'6 libras', CAST(60.0000 AS Decimal(10, 4)), 81, 20, 55, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (143, N'Camarones', 143, 143, N'10 libras', CAST(95.0000 AS Decimal(10, 4)), 81, 7, 21, 1)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (144, N'Aceite de palma', 144, 144, N'10 botes', CAST(70.0000 AS Decimal(10, 4)), 81, 50, 12, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (145, N'Azucar', 145, 145, N'2 bolsas', CAST(50.0000 AS Decimal(10, 4)), 51, 15, 24, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (146, N'Pepinillos', 146, 146, N'9 botes', CAST(35.0000 AS Decimal(10, 4)), 45, 85, 26, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (147, N'Filete de Tilapia', 147, 147, N'8 libras', CAST(60.0000 AS Decimal(10, 4)), 62, 20, 28, 1)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (148, N'Camote', 148, 148, N'20 libras', CAST(40.0000 AS Decimal(10, 4)), 64, 25, 29, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (149, N'Aceite de palma', 149, 149, N'12 botes', CAST(70.0000 AS Decimal(10, 4)), 65, 26, 22, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (150, N'Empanadas', 150, 150, N'15 botes de 150 g', CAST(62.0000 AS Decimal(10, 4)), 66, 20, 21, 1)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (151, N'Pasta de Curry', 151, 151, N'1 Bolsa ', CAST(45.0000 AS Decimal(10, 4)), 61, 70, 26, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (152, N'Filete de Tilapia', 152, 152, N'9 libras', CAST(60.0000 AS Decimal(10, 4)), 62, 70, 45, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (153, N'Camarones', 153, 153, N'11 libras', CAST(95.0000 AS Decimal(10, 4)), 64, 20, 45, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (154, N'Camote', 154, 154, N'3 libras', CAST(40.0000 AS Decimal(10, 4)), 65, 60, 25, 1)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (155, N'Arina de Maiz', 155, 155, N'3 kg', CAST(80.0000 AS Decimal(10, 4)), 67, 60, 15, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (156, N'Café', 156, 156, N'8 latas de 500 g', CAST(35.0000 AS Decimal(10, 4)), 68, 20, 55, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (157, N'Azucar', 157, 157, N'5 bolsas', CAST(50.0000 AS Decimal(10, 4)), 69, 60, 35, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (158, N'Camote', 158, 158, N'4 libras', CAST(40.0000 AS Decimal(10, 4)), 69, 50, 45, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (159, N'Kaviar', 159, 159, N'15 botes de 140 g', CAST(40.0000 AS Decimal(10, 4)), 64, 50, 24, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (160, N'Salsa Limo', 160, 160, N'15 botes de 150 g', CAST(20.0000 AS Decimal(10, 4)), 65, 50, 23, 1)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (161, N'Aceite de palma', 161, 161, N'8 botes', CAST(70.0000 AS Decimal(10, 4)), 61, 50, 25, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (162, N'Pepinillos', 162, 162, N'7 botes', CAST(35.0000 AS Decimal(10, 4)), 65, 40, 25, 1)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (163, N'Jalapeño', 163, 163, N'3 botes', CAST(20.0000 AS Decimal(10, 4)), 64, 75, 35, 1)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (164, N'Azucar', 164, 164, N'5 bolsas', CAST(50.0000 AS Decimal(10, 4)), 6, 75, 35, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (165, N'Jalapeño', 165, 165, N'3 botes', CAST(20.0000 AS Decimal(10, 4)), 63, 65, 45, 1)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (166, N'Pepinillos', 166, 166, N'6 botes', CAST(35.0000 AS Decimal(10, 4)), 67, 45, 25, 1)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (167, N'Paella Española', 167, 167, N'10 cajas', CAST(80.0000 AS Decimal(10, 4)), 64, 50, 25, 1)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (168, N'jarabe de agave', 168, 168, N'11 botes', CAST(95.0000 AS Decimal(10, 4)), 65, 60, 15, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (169, N'Mole Verde', 169, 169, N'8', CAST(80.0000 AS Decimal(10, 4)), 66, 60, 65, 1)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (170, N'Mozzarella', 170, 170, N'15 botes de 150 g', CAST(20.0000 AS Decimal(10, 4)), 62, 50, 15, 1)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (171, N'Galletas De Chocolate', 171, 171, N'3 paquetes', CAST(25.0000 AS Decimal(10, 4)), 64, 46, 45, 1)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (172, N'Jalapeño', 172, 172, N'11 botes ', CAST(20.0000 AS Decimal(10, 4)), 64, 78, 45, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (173, N'Galletas caramelo', 173, 173, N'4 cajas', CAST(15.0000 AS Decimal(10, 4)), 61, 88, 55, 1)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (174, N'Yuca', 174, 174, N'3 libras', CAST(30.0000 AS Decimal(10, 4)), 612, 94, 26, 1)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (175, N'Chile seco', 175, 175, N'3 bolsas', CAST(60.0000 AS Decimal(10, 4)), 62, 20, 18, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (176, N'Chile serrano', 176, 176, N'7 cajas', CAST(40.0000 AS Decimal(10, 4)), 61, 60, 17, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (177, N'jarabe de agave', 177, 177, N'11 botes', CAST(95.0000 AS Decimal(10, 4)), 61, 30, 18, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (178, N'Mole Verde', 178, 178, N'6 botes', CAST(80.0000 AS Decimal(10, 4)), 71, 30, 19, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (179, N'Chile seco', 179, 179, N'5 bolsas', CAST(60.0000 AS Decimal(10, 4)), 81, 75, 17, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (180, N'Camote', 180, 180, N'4 libras', CAST(40.0000 AS Decimal(10, 4)), 81, 65, 20, 1)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (181, N'Pepinillos', 181, 181, N'7 botes', CAST(35.0000 AS Decimal(10, 4)), 71, 40, 26, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (182, N'Azucar', 182, 182, N'6 bolsas', CAST(50.0000 AS Decimal(10, 4)), 81, 50, 24, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (183, N'Tacos', 183, 183, N'13 ordenes', CAST(18.0000 AS Decimal(10, 4)), 85, 60, 23, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (184, N'Camarones', 184, 184, N'6 libras', CAST(95.0000 AS Decimal(10, 4)), 54, 70, 23, 1)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (185, N'Huevos', 185, 185, N'6 cajas', CAST(100.0000 AS Decimal(10, 4)), 54, 80, 24, 1)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (186, N'Ravioli', 186, 186, N'6 cajas', CAST(19.0000 AS Decimal(10, 4)), 55, 90, 35, 1)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (187, N'Whisky Escoces', 187, 187, N'15 botellas de 400ml', CAST(450.0000 AS Decimal(10, 4)), 55, 20, 15, 1)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (188, N'Arina de Maiz', 188, 188, N'4 kg', CAST(80.0000 AS Decimal(10, 4)), 55, 10, 45, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (189, N'jarabe de agave', 189, 189, N'14 botes', CAST(95.0000 AS Decimal(10, 4)), 54, 50, 35, 1)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (190, N'Chile seco', 190, 190, N'6 bolsas', CAST(60.0000 AS Decimal(10, 4)), 62, 40, 60, 1)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (191, N'Chile ancho', 191, 191, N'6 bolsas', CAST(70.0000 AS Decimal(10, 4)), 64, 60, 14, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (192, N'Pasta de Curry', 192, 192, N'5 bolsas', CAST(45.0000 AS Decimal(10, 4)), 41, 50, 13, 1)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (193, N'Vodka', 193, 193, N'15 botes de 150 g', CAST(20.0000 AS Decimal(10, 4)), 14, 70, 14, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (194, N'Spaguetti chitarra', 194, 194, N'6 cajas', CAST(30.0000 AS Decimal(10, 4)), 4, 80, 34, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (195, N'Spaguetti Grossi ', 195, 195, N'6 cajas', CAST(30.0000 AS Decimal(10, 4)), 14, 90, 55, 1)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (196, N'Spaguetti', 196, 196, N'5 cajas', CAST(28.0000 AS Decimal(10, 4)), 13, 60, 30, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (197, N'Tomate', 197, 197, N'5 botes', CAST(20.0000 AS Decimal(10, 4)), 13, 30, 34, 1)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (198, N'Kaviar', 198, 198, N'15 botes de 150 g', CAST(20.0000 AS Decimal(10, 4)), 13, 40, 31, 0)
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (199, N'Vino', 199, 199, N'8 botellas', CAST(500.0000 AS Decimal(10, 4)), 17, 50, 31, 1)
GO
INSERT [dbo].[G1Productos] ([ProductoID], [NombreProducto], [ProveedorID], [CategoriaID], [CantidadporUnidad], [PrecioUnitario], [UnidadesenStock], [UnidadesenOrden], [NiveldeReordenamiento], [Descontinuado]) VALUES (200, N'Salsa Limon', 200, 200, N'15 botes', CAST(80.0000 AS Decimal(10, 4)), 54, 20, 30, 0)
SET IDENTITY_INSERT [dbo].[G1Productos] OFF
GO
SET IDENTITY_INSERT [dbo].[G1Proveedores] ON 
TRUNCATE TABLE G1Proveedores
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (1, N'IKEA', N'Ismail Revuelta', N'Jefe', N'Calle Gámez, 95, 27º D', N'El Benavides', N'Bilzen', N'8852', N'España', N'34 947 77 9105', N'851985200', N'www.IKEA.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (2, N'CANON', N'Montserrat Peinado', N'Administrador', N'Cl. Valencia, 5. Tavernes Blanques. ', N'La Acebeda', N'Valencia', N'46016', N'España', N'963883333', N'793883173', N'www.CANON.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (3, N'LEGO', N'Toni Ferre', N'Jefe de planta', N'Cl. Méndez Álvaro, 44. ', N'Ajalvir', N'Madrid', N'28045', N'España', N'981181400', N'838105777', N'www.LEGO.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (4, N'SONY', N'Marcela Corrales', N'Supervisora', N'Ps. de la Castellana, 259. A Torre Cepsa. ', N'Valencia', N'Madrid', N'28046', N'España', N'913376000', N'515279948', N'www.SONY.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (5, N'HAAGEN DASZ', N'Isabel Monzon', N'Director general ', N'Ps. de la Castellana, 259. A Torre Cepsa. ', N'Sevilla', N'Madrid', N'28046', N'España', N'913376325', N'787198457', N'www.HAAGEN DASZ.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (6, N'WD-40', N'Josefina Mosquera', N'Gerente general', N'Cl. Méndez Álvaro, 44. ', N'Zaragoza', N'Madrid', N'28045', N'España', N'913148100', N'322184872', N'www.WD-40.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (7, N'YAHOO', N'Moises Marco', N'Gerente de Servicios Administr', N'Cl. Ribera del Loira, 60. ', N'Málaga', N'Madrid', N'28042', N'España', N'912131000', N'855739632', N'www.YAHOO.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (8, N'PEPSI', N'Ali Flores', N'Gerente de Marketing', N'Cl. Hermosilla, 112. ', N'Murcia', N'Madrid', N'28009', N'España', N'913092372', N'332538751', N'www.PEPSI.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (9, N'Coca Cola', N'Luis Francisco Velez', N' Gerente de Recursos Humanos', N'Av. Diputación, s/n. Edf Inditex. Arteixo. ', N'Palma de Mallo', N'La Coruña', N'15142', N'España', N'981185400', N'525970492', N'www.Coca Cola.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (10, N'Maseca', N' Manuel Esteve', N'Gerente de TI ', N'Aut. A2, s/n. Km 585. Martorell. ', N'Las Palmas de G', N'Barcelona', N'8760', N'España', N'937085000', N'724242115', N'www.Maseca.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (11, N'Iapple', N'Iris Lobo', N'Gerente de Operaciones ', N'Cl. Méndez Álvaro, 44. ', N'Bilbao', N'Madrid', N'28045', N'España', N'917533329', N'876709971', N'www.Iapple.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (12, N'InstaClothes.', N'Fabian López', N'Gerente de Comunicaciones', N'Cl. Caléndula, 13. Edf Minipark 4. Alcobendas. ', N'Alicante', N'Madrid', N'28109', N'España', N'917145106', N'699768259', N'www.InstaClothes..com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (13, N'Lighthouse Clothes.', N'Lourdes Pozo', N'CEO', N'Cl. Capitán Haya, 53. ', N'Córdoba', N'Madrid', N'28020', N'España', N'902112313', N'838289835', N'www.Lighthouse Clothes..com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (14, N'Panty Village ', N'Guillermina Sobrino', N'Director Ejecutivo', N'Cl. Gran Vía, 28. ', N'Valladolid', N'Madrid', N'28013', N'España', N'900111004', N'700438192', N'www.Panty Village .com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (15, N'Exquisite Panty', N'Eugenio Moral', N' Responsable operativo', N'Cl. Campezo, 16. Plg Ind Las Mercedes. ', N'Vigo', N'Madrid', N'28022', N'España', N'902158484', N'668324907', N'www.Exquisite Panty.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (16, N'Camisetas Jump', N'Emiliana Jimenez', N'Director Comercial', N'Pz. de Euskadi, 5. Bilbao. ', N'Gijón', N'Vizcaya', N'48011', N'España', N'944151411', N'811493773', N'www.Camisetas Jump.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (17, N'Camisetas OnTarget', N'Amalia Acosta', N'Director de Marketing', N'Av. Madrid, 72. ', N'Hospitalet de L', N'Valladolid', N'47008', N'España', N'954505000', N'502322087', N'www.Camisetas OnTarget.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (18, N'Impresionar Camisetas', N'Aitana Ayuso', N'Recepcioista', N'Pz. de Euskadi, 5. Bilbao. ', N'Vitoria', N'Vizcaya', N'48011', N'España', N'915776500', N'499920537', N'www.Impresionar Camisetas.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (19, N'Cinnamom Overdressed. ', N'Aurora Gracia', N'Director Financiero', N'Cl. San Martín, 5. Edf Muñatones. Muskiz. ', N'La Coruña', N'Vizcaya', N'48550', N'España', N'946357000', N'626681916', N'www.Cinnamom Overdressed. .com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (20, N'Gafas Nueva Vison', N'Itziar Coca', N'Auditora ', N'Ps. Recoletos, 37. Esc 6. ', N'Elche', N'Madrid', N'28004', N'España', N'944903245', N'512485076', N'www.Gafas Nueva Vison.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (21, N'Bolsos Tándem', N'Jacobo Gascon', N' DIRECCIÓN DE NEGOCIO', N'Av. San Luis, 77. ', N'Granada', N'Madrid', N'28033', N'España', N'934025782', N'602728767', N'www.Bolsos Tándem.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (22, N'Karma HD Nets', N'Barbara Ballesteros', N'Ejecutivo', N'Cl. de Barajas, 24. Pq Emp Omega. Alcobendas. ', N'Tarrasa', N'Madrid', N'28108', N'España', N'902107001', N'815868649', N'www.Karma HD Nets.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (23, N'AllAccess Tarjetas Gráficas', N'Jairo López', N'Gerente', N'Cl. Anabel Segura, 16. Alcobendas.', N'Badalona', N'Madrid', N'28108', N'España', N'917146700', N'349131045', N'www.AllAccess Tarjetas Gráficas.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (24, N'Ordenadores HOP', N'Pedro Feijoo', N' Auxiliar de taller', N'Av. San Luis, 77. ', N'Santander', N'Madrid', N'28033', N'España', N'915676000', N'808935275', N'www.Ordenadores HOP.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (25, N'Namaste Hardware', N'Olga Latorre', N'Ayudante de jefe de obra', N'Av. Bruselas, 30. Alcobendas. ', N'Alcorcón', N'Madrid', N'28108', N'España', N'914846269', N'883564919', N'www.Namaste Hardware.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (26, N'Hardware Signals', N'Leoncio Sanz', N'Director de almacén', N'Av. N-232, s/n. Km 29 Plg Entrerrios. Figueruelas. ', N'San Cristóbal d', N'Zaragoza', N'50639', N'España', N'916621660', N'536493827', N'www.Hardware Signals.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (27, N'Visual Monitores', N'Gertrudis Cerdán', N'Jefe de planta', N'Av. Citroën, 3-5. Zona Franca. Vigo. ', N'Logroño', N'Pontevedra', N'36210', N'España', N'913472055', N'630884728', N'www.Visual Monitores.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (28, N'Periféricos Bajo Demanda', N'Jerónimo Manzanares ', N'Jefe del departamento de compr', N'Ps. Club Deportivo, 1. Edf 8 Pq E. Pozuelo de Alar', N'Badajoz', N'Madrid', N'28223', N'España', N'912521200', N'770540581', N'www.Periféricos Bajo Demanda.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (29, N'Informática VIP', N'Aurelio Juan', N'Director del área de compras', N'Cl. Gran Vía, 28. ', N'Marbella', N'Madrid', N'28013', N'España', N'914828523', N'626013645', N'www.Informática VIP.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (30, N'Informática Tutor ', N'Luis Alberto', N'Director general', N'Ps. de la Castellana, 259. A Torre Cepsa. ', N'Salamanca', N'Madrid', N'28046', N'España', N'913376898', N'371589954', N'www.Informática Tutor .com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (31, N'Eco Informática', N'Luis Emilio', N'Técnico de marketing', N'Cl. Martínez Villergas, 49.', N'Huelva', N'Madrid', N'28027', N'España', N'913984273', N'748530565', N'www.Eco Informática.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (32, N'TopRank Watches', N'Luis Fernando', N'Jefe de almacén', N'Av. Borbolla, 5. ', N'Lérida', N'Sevilla', N'41004', N'España', N'912131000', N'542485521', N'www.TopRank Watches.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (33, N'GoldRush Watches', N'Oscar Infante', N'Gerente', N'Av. San Luis, 77. ', N'Dos Hermanas', N'Madrid', N'28033', N'España', N'936824799', N'355534107', N'www.GoldRush Watches.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (34, N'Joyería Icono', N'Manuel Antonio', N'Director de taller', N'Cl. Salvador de Madariaga, 1. ', N'Tarragona', N'Madrid', N'28027', N'España', N'915827785', N'816047625', N'www.Joyería Icono.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (35, N'Reino Joyería', N'Marco Antonio', N'Técnico administrativo', N'Rda. de la Comunicación, s/n. ', N'Torrejón de Ard', N'Madrid', N'28050', N'España', N'918074354', N'469860943', N'www.Reino Joyería.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (36, N'Joyería Estrella de Oro', N'Carlos Holgado', N'Técnico de almacén', N'Cl. Jacinto Benavente, 2. A. Las Rozas de Ma', N'Parla', N'Madrid', N'28232', N'España', N'913985400', N'552343525', N'www.Joyería Estrella de Oro.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (37, N'Bisutería Perla', N'Brahim Giron', N'Secretario de dirección', N'Av. América, 115. ', N'Mataró', N'Madrid', N'28002', N'España', N'918253333', N'383526587', N'www.Bisutería Perla.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (38, N'Comparar Bisutería', N'Maitane Bermejo', N'Jefe de planta', N'Cl. Peonías, 12. ', N'Algeciras', N'Madrid', N'28042', N'España', N'913212622', N'326285019', N'www.Comparar Bisutería.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (39, N'Relojes Zafiro', N'Constantino Pérez', N'Agente de Seguros', N'Cl. de la Selva, 22. Bussines Park Porta de Barcelona', N'León', N'Barcelona', N'8820', N'España', N'932617200', N'564022486', N'www.Relojes Zafiro.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (40, N'Pulseras Kaboom', N'Maximiliano', N'Agente de Bienes Raíces', N'Cl. Gran Vía Don Diego López de Haro, 19-21. 2. Bilbao. ', N'Santa Coloma de', N'Vizcaya', N'48001', N'España', N'937733800', N'644690678', N'www.Pulseras Kaboom.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (41, N'Pulseras Élite', N'Adela Velazquez', N'Gerente de TI', N'Av. San Luis, 77. ', N'Alcobendas', N'Madrid', N'28033', N'España', N'900760760', N'688483009', N'www.Pulseras Élite.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (42, N'UpFront Book Store', N'Lia Calleja', N'Gerente de la Firma', N'Cl. Grandas, s/n. Gozón. ', N'Cádiz', N'Asturias', N'33440', N'España', N'985126000', N'890493170', N'www.UpFront Book Store.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (43, N'Librería Scoop', N'Miguel Ángel', N'Gerente de Departamento Legal', N'Cl. Eduardo Barreiros, 110. ', N'Talavera de la', N'Madrid', N'28041', N'España', N'915851100', N'859767764', N'www.Librería Scoop.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (44, N'Vértigo Book Store', N'Jennifer Baker', N'Administrador de la Agencia', N'Cl. Beat Oriol, s/n. Plg Ind La Granja. Montcada I Reixac. ', N'Pontevedra', N'Barcelona', N'8110', N'España', N'902505950', N'664731666', N'www.Vértigo Book Store.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (45, N'Papelería Anfitrión ', N'Michael Aguilar', N'Gerente Financiero', N'Cl. Santiago de Com', N'Vélez-Málaga', N'Madrid', N'28029', N'España', N'917306666', N'465199074', N'www.Papelería Anfitrión .com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (46, N'Librería Nación', N'Jean Powell', N'Contador', N'Cl. Méndez Álvaro, 44. ', N'Torrevieja', N'Madrid', N'28045', N'España', N'917538103', N'575432806', N'www.Librería Nación.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (47, N'Libros de Magia para Niños', N'Maria Ines', N'Gerente de Recursos Humanos', N'Ps. de la Castellana, 115. 6 Izd. ', N'Fuengirola', N'Madrid', N'28046', N'España', N'915972621', N'467030005', N'www.Libros de Magia para Niños.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (48, N'Narnia', N'Raquel Elizabet', N'Supervisor de planta', N'Cl. Landaben, s/n. Pamplona/Iruña. 3', N'Arona', N'Navarra', N'1012', N'España', N'948424128', N'844435689', N'www.Narnia.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (49, N'Ínsula Barataria', N'María Rosario', N' Gerente General', N'Ps. de la Castellana, 259. A Torre Cepsa. 2', N'Coslada', N'Madrid', N'8046', N'España', N'956671000', N'453618146', N'www.Ínsula Barataria.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (50, N'La Patria de Papel', N'Alberto Oscar', N'Supervisora de Sección', N'Ctra. M-607, s/n. Km 11.800. ', N'Orihuela', N'Madrid', N'28049', N'España', N'916131416', N'542685916', N'www.La Patria de Papel.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (51, N'EbooksSin limites', N'Doris Vivian', N'Administrador de Sucursal', N'Pz. Weyler, 3. Palma de Mallo', N'Rubí', N'Baleares', N'7001', N'España', N'934094017', N'387134846', N'www.EbooksSin limites.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (52, N'Krunchy-Krunchy', N'Winston Franklin', N'Supervisor Operativo', N'Av. Aragón, 404. ', N'Valencia', N'Madrid', N'28022', N'España', N'915857000', N'764974282', N'www.Krunchy-Krunchy.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (53, N'Pethungry', N'Pablo Daniel', N'Director Genera', N'Carrera 56a No. 51 - 81', N'Antioquia', N'Aldemar ', N'561245', N'Colombia', N'914068200', N'317652165', N'www.Pethungry.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (54, N'LifeStyle Dogs', N'Mercedes Maria', N'Gerente de Mercadeo', N'Carrera 22 No. 17-31', N'Arauca', N'Medellín', N'456321', N'Colombia', N'913985400', N'357302165', N'www.LifeStyle Dogs.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (55, N'Weekly Dog', N'Jorge Maria', N'Supervisor de Ventas', N'Carrera 54 No. 68 - 80 Barrio El Prado', N'Atlantico', N'Arauca', N'859674', N'Colombia', N'914105131', N'348956518', N'www.Weekly Dog.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (56, N'Pet Hipermercado', N'Alejandra Rosana', N'Administrador', N'Calle 59 No. 27 - 35 Barrio Galán', N'Barrancabermeja', N'Barranquilla', N'789645', N'Colombia', N'932908080', N'417871372', N'www.Pet Hipermercado.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (57, N'Cats Marketplace', N'Mirta Graciela', N'Diseñador gráfico ', N'Carrera 10a No. 20 - 40  Edificio El Clarín Piso 3', N'Bolivar', N'Barrancabermeja', N'128596', N'Colombia', N'912131000', N'415263528', N'www.Cats Marketplace.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (58, N'Tienda de Perros Nextday', N'Juan Martin', N'Representante de servicio', N'Carrera 8  No. 20 - 59', N'Boyaca', N'Cartagena', N'345612', N'Colombia', N'902111385', N'872381673', N'www.Tienda de Perros Nextday.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (59, N'Pet Estudio', N'Jose Pedro', N'Soporte administrativo ', N'Calle 20 No. 22 - 27 Piso 3 Edificio Cumanday', N'Caldas', N'Tunja', N'856124', N'Colombia', N'913741565', N'374833222', N'www.Pet Estudio.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (60, N'ToysForDogs', N'Hugo Jose', N'CEO', N'Carrera 8a No. 7 - 88 /94  Barrio  La Estrella', N'Caqueta', N'Manizales', N'458632', N'Colombia', N'902509600', N'851727882', N'www.ToysForDogs.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (61, N'Dog Food Culture', N'Jose Bartolome', N'Jefe', N'Carrera  5 No. 3 -74  Centro', N'Cauca', N'Florencia', N'356875', N'Colombia', N'958807922', N'427971190', N'www.Dog Food Culture.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (62, N'Siempre Fitness', N'Nelson Eduardo', N'Administrador', N'Calle 15 No. 9 - 56 Centro', N'Cesar', N'Popayan', N'859146', N'Colombia', N'961974112', N'488455947', N'www.Siempre Fitness.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (63, N'Actividad Fisica', N'Juan Carlos', N'Jefe de planta', N'Calle 25 No. 4 - 38 Piso 2  Barrio Pandeyuca', N'Choco', N'Valledupar', N'738594', N'Colombia', N'913298141', N'326182935', N'www.Actividad Fisica.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (64, N'Inno Deportes. ', N'Martha Vanda', N'Supervisora', N'Calle 28 No. 8 - 69 Centro', N'Cordoba', N'Quibdo', N'961325', N'Colombia', N'913551000', N'372176291', N'www.Inno Deportes. .com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (65, N'Millennials Bikes', N'Mabel', N'Director general ', N'Carrera 7a No. 32 - 63 Piso 2', N'Cundinamarca', N'Monteria', N'968745', N'Colombia', N'915066727', N'585872055', N'www.Millennials Bikes.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (66, N'NewLife Fitness', N'Efrain Andres', N'Gerente general', N'Calle 7 No. 5 - 25  Edificio Segunda', N'Guajira', N'Bogotá', N'532615', N'Colombia', N'915776500', N'536406968', N'www.NewLife Fitness.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (67, N'InOut Fitness', N'Victor Esteban', N'Gerente de Servicios Administr', N'Carrera 9  No. 7 - 34', N'Huila', N'Riohacha', N'634251', N'Colombia', N'971178103', N'884393678', N'www.InOut Fitness.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (68, N'Deportes Flecha', N'Omar Atilio', N'Gerente de Marketing', N'Calle 20 No. 3 - 22', N'Magdalena', N'Neiva', N'531289', N'Colombia', N'933787630', N'871733842', N'www.Deportes Flecha.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (69, N'GreenLife Bikes', N'Marcela María', N' Gerente de Recursos Humanos', N'Calle 33b  No. 38 - 42  Barrio Barzal', N'Meta', N'Santa Marta', N'453215', N'Colombia', N'944151411', N'792798371', N'www.GreenLife Bikes.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (70, N'Skate Paradise', N'Stella Serrana', N'Gerente de TI ', N'Calle 16 No. 23 - 57 Piso 4  Edificio Autoservicio ', N'Nariño', N'Villavicencio', N'453875', N'Colombia', N'922238700', N'872459090', N'www.Skate Paradise.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (71, N'Surf Matcher', N'Patricia Monica', N'Gerente de Operaciones ', N'Calle 12 No. 4 - 19  Edificio Panamericano Of. 406', N'Norte Santand.', N'Pasto', N'854315', N'Colombia', N'913350518', N'828994036', N'www.Surf Matcher.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (72, N'Coches Magento', N'Walter Danilo', N'Gerente de Comunicaciones', N'Cl. Ribera del Loira, 60. ', N'Bilbao', N'Madrid', N'28042', N'España', N'912131000', N'510236665', N'www.Coches Magento.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (73, N'Visioncar', N'Claudio Martin', N'CEO', N'CALLE 23 No. 12-11', N'Quindio', N'Armenia', N'387215', N'Colombia', N'913349400', N'630774155', N'www.Visioncar.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (74, N'Urban Cars', N'Victor Hugo', N'Director Ejecutivo', N'Calle 19 No. 8 - 34  of. 502', N'Risaralda', N'Pereira', N'123883', N'Colombia', N'913376801', N'331223325', N'www.Urban Cars.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (75, N'Recambios Carrera', N'Jose Eduardo', N' Responsable operativo', N'Avda Francisco Newball No. 4A-20 - ', N'San Andres', N'San Andres', N'138715', N'Colombia', N'934025100', N'473610420', N'www.Recambios Carrera.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (76, N'Automóviles A Todo Gas', N'Jorge Obdulio', N'Director Comercial', N'Calle 31 No. 13 - 71 of. 301 Edif. Rey', N'Santander', N'Bucaramanga', N'568512', N'Colombia', N'934805100', N'621250669', N'www.Automóviles A Todo Gas.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (77, N'Top Racing Cars', N'Roger Adkins', N'Director de Marketing', N'Carrera 20 No. 25 - 53  Primer piso centro', N'Sucre', N'Sincelejo', N'861245', N'Colombia', N'912588865', N'844720976', N'www.Top Racing Cars.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (78, N'Recambios Last Minute', N'David Mora', N'Recepcioista', N'Carrera 3  con Calle 28 Esquina Barrio Claret', N'Tolima', N'Ibague', N'453125', N'Colombia', N'934025100', N'382101644', N'www.Recambios Last Minute.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (79, N'Repuestos Genius', N'Jeffrey Murphy', N'Director Financiero', N'Calle 111 No. 100 - 11  Barrio el Estadio', N'Uraba -Apartado', N'Apartado', N'865215', N'Colombia', N'981185400', N'813969888', N'www.Repuestos Genius.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (80, N'Piezas de Coche Al Detalle ', N'Amal Salcedo', N'Auditora ', N'CARRERA 42 No.5C-48 Barrio Tequendama', N'Valle Del Cauca', N'Cali', N'185634', N'Colombia', N'917496000', N'665948204', N'www.Piezas de Coche Al Detalle .com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (81, N'Todo Terrenos a Go-Go', N'Caridad Gómez', N' DIRECCIÓN DE NEGOCIO', N'Carrera 23  No. 10A - 10', N'Orinoquia -Amaz', N'Yopal', N'196854', N'Colombia', N'917367000', N'411789503', N'www.Todo Terrenos a Go-Go.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (82, N'House Solutions', N'Maria Revilla', N'Ejecutivo', N'Psj. del Conde de los Gaitanes, 177. Alcobendas. ', N'Valencia', N'Madrid', N'28109', N'España', N'916508500', N'749407391', N'www.House Solutions.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (83, N'Provencal House', N'Francisco Bonilla', N'Gerente', N'Cl. Traspalau, 8. Guissona. ', N'Sevilla', N'Lérida', N'25210', N'España', N'973550100', N'790468378', N'www.Provencal House.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (84, N'Pisos & Chalets', N'Óscar Barros', N' Auxiliar de taller', N'Cl. Son Fangos, 100. Cplj Mirall Balear', N'Zaragoza', N'Baleares', N'7007', N'España', N'971178800', N'574665312', N'www.Pisos & Chalets.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (85, N'Home Gallery', N'Adriana Gonzalo', N'Ayudante de jefe de obra', N'Cl. Vía Dublín, 7. ', N'Málaga', N'Madrid', N'28042', N'España', N'902197197', N'401303850', N'www.Home Gallery.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (86, N'Decoración de Jardín', N'Xavi Duque', N'Director de almacén', N'Cl. Trigo, 39. Plg Ind Polvoranca. Leganés. ', N'Murcia', N'Madrid', N'28914', N'España', N'914819801', N'359673363', N'www.Decoración de Jardín.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (87, N'Brico DIY', N'Alexia Mayo', N'Jefe de planta', N'Av. de la Industria, 30. Edf Lilly. Alcobendas. ', N'Palma de Mallor', N'Madrid', N'28108', N'España', N'916635000', N'651478727', N'www.Brico DIY.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (88, N'La Casa de Campo Online', N'Salud Granados', N'Jefe del departamento de compr', N'Bro. San Agustín, s/n. Donostia', N'Las Palmas de G', N'Guipúzcoa', N'20017', N'España', N'946211248', N'381621224', N'www.La Casa de Campo Online.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (89, N'Debla', N'Nadia Perdomo', N'Director del área de compras', N'Av. John Lennon, s/n. Getafe. ', N'Bilbao', N'Madrid', N'28906', N'España', N'915857431', N'510513359', N'www.Debla.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (90, N'Thai Furnitures', N'Gregorio Reyes', N'Director general', N'Av. de Europa, 18. Pq Emp La Moraleja. Alcobendas. ', N'Alicante', N'Madrid', N'28108', N'España', N'916632851', N'469097963', N'www.Thai Furnitures.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (91, N'Tododecoradores', N'Amaia Osuna', N'Técnico de marketing', N'Ctra. Barajas, 32. Pq Emp Omega. Alcobendas. ', N'Córdoba', N'Madrid', N'28100', N'España', N'917143600', N'505132372', N'www.Tododecoradores.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (92, N'Selactesa', N'Victor Homero', N'Jefe de almacén', N'Cl. Mercaders, 9-11. Plg Ind Riera de Caldes. ', N'Valladolid', N'Barcelona', N'8184', N'España', N'968602222', N'859023375', N'www.Selactesa.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (93, N'Biomass', N'Maria Rosina', N'Gerente', N'Cl. Salvador de Madariaga, s/n. Pq Comercial. ', N'Vigo', N'Barcelona', N'8184', N'España', N'916573768', N'455353242', N'www.Biomass.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (94, N'Tuboplast Hispania', N'Andreina Maria', N'Director de taller', N'Pz. de Euskadi, 5. Bilbao. ', N'Gijón', N'Vizcaya', N'48011', N'España', N'944151411', N'641623566', N'www.Tuboplast Hispania.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (95, N'Agroquimes', N'Acido Arcangel', N'Técnico administrativo', N'Cl. Zurbarán, 28. ', N'Hospitalet de L', N'Madrid', N'28010', N'España', N'917810682', N'446707942', N'www.Agroquimes.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (96, N'Saica Natur Norte', N'Cristina Elvira', N'Técnico de almacén', N'Rda. Canal Imperial de Aragón, 18-20. ', N'Vitoria', N'Zaragoza', N'50197', N'España', N'976578000', N'751398874', N'www.Saica Natur Norte.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (97, N'Tecopsa', N'Maria Del Carmen', N'Secretario de dirección', N'Av. Aragón, 404. ', N'La Coruña', N'Madrid', N'28022', N'España', N'915857223', N'798673127', N'www.Tecopsa.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (98, N'Ecomas Supermercados', N'Edgardo Eloy', N'Jefe de planta', N'Av. Bruselas, 22. Arroyo de la Vegas', N'Elche', N'Madrid', N'28022', N'España', N'911513300', N'381627494', N'www.Ecomas Supermercados.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (99, N'Bingo Macoes', N'Bernardo Gaston', N'Agente de Seguros', N'Pz. Gesta de Oviedo, 2. Oviedo. ', N'Granada', N'Asturias', N'33007', N'España', N'902830100', N'544040895', N'www.Bingo Macoes.com')
GO
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (100, N'Fairmont Rey Juan Carlos I', N'Arturo Leonardo', N'Agente de Bienes Raíces', N'Cl. Rio Bullaque, 2. ', N'Tarrasa', N' Madrid', N'28034', N'España', N'914279047', N'356941061', N'www.Fairmont Rey Juan Carlos I.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (101, N'Alston', N'Gustavo Gilberto', N'Gerente de TI', N'Ctra. Arganda-Velilla San Antonio, s/n', N'Badalona', N'Madrid', N'28891', N'España', N'916602107', N'346439151', N'www.Alston.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (102, N'Nautical', N'Iñaki Tortosa', N'Gerente de la Firma', N'Av. Acerinox Europa, s/n. Plg Ind De. Los Barrios. ', N'Oviedo', N'Cádiz', N'11370', N'España', N'913985180', N'407066087', N'www.Nautical.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (103, N'Clavo Food Factory', N'Marcelo Fabian', N'Gerente de Departamento Legal', N'Pz. Euskadi, 5. Bilbao. ', N'Cartagena', N'Vizcaya', N'48009', N'España', N'944151411', N'852791706', N'www.Clavo Food Factory.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (104, N'Apoyo y Logística Industrial Canarias', N'Gustavo Alberto', N'Administrador de la Agencia', N'Cl. Jose Miguel Iturrioz, 26. Beasain. ', N'Sabadell', N'Guipúzcoa', N'20200', N'España', N'943880100', N'385495903', N'www.Apoyo y Logística Industrial Canarias.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (105, N'Curium Pharma', N'Luis Eduardo', N'Gerente Financiero', N'Cl. Gran Vía, 32. 5ª Plta. ', N'Jerez de la Fro', N'Madrid', N'28013', N'España', N'910508600', N'582521633', N'www.Curium Pharma.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (106, N'Liberbank It', N'Andrés Felipe', N'Contador', N'Ctra. Toledo, s/n. Km 9.200. ', N'Móstoles', N'Madrid', N'28021', N'España', N'914364550', N'678797500', N'www.Liberbank It.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (107, N'Cct', N'Peter Gimeno', N'Gerente de Recursos Humanos', N'Av. Matapiñonera, 9. San Sebastián d', N'Santa Cruz de', N'Madrid', N'28703', N'España', N'914925000', N'350016627', N'www.Cct.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (108, N'Coopbox', N'Jesus Trillo', N'Supervisor de planta', N'Av. San Luis, 77.', N'Pamplona', N'Madrid', N'28033', N'España', N'934025125', N'717096904', N'www.Coopbox.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (109, N'Uponor Hispania', N'Juan Miguel', N' Gerente General', N'Av. Diputación, s/n. Edf Inditex. Arteixo. ', N'Almería', N'La Coruña', N'15142', N'España', N'981185400', N'540875366', N'www.Uponor Hispania.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (110, N'Industrias Dolz.', N'Elbio Abel', N'Administrador de Sucursal', N'Ps. de la Castellana, 95. ', N'Fuenlabrada', N'Madrid', N'28046', N'España', N'615947170', N'833036602', N'www.Industrias Dolz..com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (111, N'Accent Social', N'Elena Lucia', N'Supervisor Operativo', N'Av. Can Fatjo dels Aurons, 9. Sant Cugat del Valles. ', N'San Sebastián', N'Barcelona', N'8174', N'España', N'937733932', N'834267283', N'www.Accent Social.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (112, N'Daumar', N'Jimena Maria', N'Director Genera', N'Cl. Can Rabia, 3-5.', N'Leganés', N'Barcelona', N'8017', N'España', N'977256811', N'824965525', N'www.Daumar.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (113, N'F Muñoz Guillem y Asociados', N'Carlos Alberto', N'Gerente de Mercadeo', N'Cl. Méndez Álvaro, 44. ', N'Getafe', N'Madrid', N'28045', N'España', N'917368000', N'647803681', N'www.F Muñoz Guillem y Asociados.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (114, N'Hersamotor', N'Carlos Eduardo', N'Supervisor de Ventas', N'Cl. Tomás Redondo, 1. ', N'Burgos', N'Madrid', N'28033', N'España', N'915776500', N'745560977', N'www.Hersamotor.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (115, N'Hoya Lens Iberia', N'Carlos Roberto', N'Administrador', N'Cl. Albareda, 38. Plg Woermann. ', N'Albacete', N'Las Palmas', N'35008', N'España', N'928309912', N'447994057', N'www.Hoya Lens Iberia.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (116, N'Saargummi Iberica', N'Macarena Ojeda', N'Diseñador gráfico ', N'Ps. de la Castellana, 95. ', N'Castellón de la', N'Madrid', N'28046', N'España', N'917251004', N'716339361', N'www.Saargummi Iberica.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (118, N'Tinus', N'Naima Castillo', N'Representante de servicio', N'Av. Fábrica, s/n. ', N'Santander', N'Córdoba', N'14005', N'España', N'957499300', N'852628497', N'www.Tinus.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (119, N'Moner Cocoa', N'Irina Bravo', N'Soporte administrativo ', N'Av. Diputación, s/n. Edf Inditex. Arteixo. ', N'Alcorcón', N'La Coruña', N'15142', N'España', N'966657500', N'721002146', N'www.Moner Cocoa.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (120, N'Gacosur', N'Anastasio Pedraza', N'CEO', N'Plg. Ind. Sector 4, s/n. Villanueva de Gallego. ', N'San Cristóbal d', N'Zaragoza', N'50830', N'España', N'937397200', N'357195433', N'www.Gacosur.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (121, N'Happy Punt', N'Elias Camacho', N'Jefe', N'Cl. Jose Abascal, 56. 5ª Plta. ', N'Logroño', N'Madrid', N'28003', N'España', N'917407800', N'414359390', N'www.Happy Punt.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (122, N'Roca', N'Luz-Maria Bartolome', N'Administrador', N'Cl. Balmes, 36. ', N'Badajoz', N'Barcelona', N'8007', N'España', N'913595400', N'548130204', N'www.Roca.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (123, N'Strugal', N'Leire Salas', N'Jefe de planta', N'Av. Baix Llobregat, 3-5. Sant Joan Despí. ', N'Marbella', N'Barcelona', N'8970', N'España', N'932284000', N'755699049', N'www.Strugal.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (124, N'Italpannelli Iberica', N'Mohamed Zapata', N'Supervisora', N'Pz. Gesta, 2. Oviedo. ', N'Salamanca', N'Asturias', N'33007', N'España', N'902830100', N'437004969', N'www.Italpannelli Iberica.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (125, N'Teczone', N'Roser Ribas', N'Director general ', N'Ps. Imperial, 40. ', N'Huelva', N'Madrid', N'28005', N'España', N'913219686', N'326389065', N'www.Teczone.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (126, N'Virospack', N'Igor Parrilla', N'Gerente general', N'Ctra. de Castilla, 802-820. Naron. ', N'Lérida', N'La Coruña', N'15570', N'España', N'981399000', N'525658506', N'www.Virospack.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (127, N'Miarco', N'Marcelina Cortes', N'Gerente de Servicios Administr', N'Pz. Europa, 46-48. Hospitalet de L', N'Dos Hermanas', N'Barcelona', N'8906', N'España', N'934007000', N'670688037', N'www.Miarco.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (128, N'Plimon', N'Pilar Armas', N'Gerente de Marketing', N'Pq. Emp Zuatzu, s/n. Edf Ulia Plta 1. Donostia-San Sebastián', N'Tarragona', N'Guipúzcoa', N'20018', N'España', N'943316766', N'629043317', N'www.Plimon.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (129, N'Tamitrip', N'Victorina Porras', N' Gerente de Recursos Humanos', N'Cl. Vía de los Poblados, 1. Edf D Pq Emp Alvento. ', N'Torrejón de Ard', N'Madrid', N'28033', N'España', N'912079797', N'398904738', N'www.Tamitrip.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (130, N'Grupo Axa', N'Fuensanta Vico', N'Gerente de TI ', N'Ctra. Santomera-Abanilla, s/n. Km 158. Santomera. ', N'Parla', N'Murcia', N'30140', N'España', N'968277500', N'708604387', N'www.Grupo Axa.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (131, N'Imprex', N'Thiago Salazar', N'Gerente de Operaciones ', N'Ctra. Santomera-Abanilla, s/n. Km 158. Santomera. ', N'Mataró', N'Murcia', N'30140', N'España', N'968277512', N'792476813', N'www.Imprex.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (132, N'Comercial Agrícola Castellana', N'Bruno Santos', N'Gerente de Comunicaciones', N'Av. Diagonal, 177-183. Plta 12 Edf Imagina. ', N'Algeciras', N'Barcelona', N'8018', N'España', N'915127800', N'508338336', N'www.Comercial Agrícola Castellana.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (133, N'Kobe Motor', N'Rayan Arribas', N'CEO', N'Ctra. C-17, s/n. Km 73. Les Masies de Voltrega. ', N'León', N'Barcelona', N'8018', N'España', N'938502526', N'527175558', N'www.Kobe Motor.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (134, N'Santiveri', N'Beñat Espejo', N'Director Ejecutivo', N'Cl. Ribera del Loira, 60. ', N'Santa Coloma de', N'Madrid', N'28042', N'España', N'912139464', N'588278322', N'www.Santiveri.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (135, N'Pionner', N'Melanie Cubero', N' Responsable operativo', N'Cmo. Son Fangos, 100. Complejo Mirall Balear 5. Palma de Ma', N'Alcobendas', N'Baleares', N'7600', N'España', N'971468623', N'497876430', N'www.Pionner.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (136, N'Techedge España', N'Natalie Schultz', N'Director Comercial', N'Av. América, 115. ', N'Cádiz', N'Madrid', N'28002', N'España', N'912025100', N'457833883', N'www.Techedge España.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (137, N'Velilla Confección', N'Angela Perez', N'Director de Marketing', N'Av. Vega, 1. Alcobendas. ', N'Jaén', N'Madrid', N'28108', N'España', N'902931935', N'817533772', N'www.Velilla Confección.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (138, N'Almazara Adamuz', N'Eric Avila', N'Recepcioista', N'Av. Diputación, s/n. Arteixo. ', N'Reus', N'La Coruña', N'15142', N'España', N'981185344', N'862708788', N'www.Almazara Adamuz.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (139, N'Onifoods', N'Darryl Williams', N'Director Financiero', N'Cl. del Camino de Santiago, 40. ', N'Orense', N'Madrid', N'28050', N'España', N'934964900', N'568505523', N'www.Onifoods.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (140, N'Ascenza Productos Para Agricultura', N'Terri Rodriguez', N'Auditora ', N'Cl. Titán, 15. ', N'Telde', N'Madrid', N'28045', N'España', N'911680890', N'824770910', N'www.Ascenza Productos Para Agricultura.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (141, N'Cumaca Motor', N'Pablo Alejandro', N' DIRECCIÓN DE NEGOCIO', N'Cl. Selva, 12. Pq Neg Mas Blau Edf Avant Plta Baja.', N'Gerona', N'Barcelona', N'8820', N'España', N'937774759', N'843692206', N'www.Cumaca Motor.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (142, N'Celulosa de Levante', N'Maria Stella', N'Ejecutivo', N'Av. Antonio Fuertes, 1. Alhama de Murcia. ', N'Baracaldo', N'Murcia', N'30840', N'España', N'968636800', N'745444639', N'www.Celulosa de Levante.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (143, N'Auto 88', N'Ana Gabriela', N'Gerente', N'Av. Madrid, 15. Alcalá de Henar', N'Roquetas de Mar', N'Madrid', N'28802', N'España', N'918853247', N'359252134', N'www.Auto 88.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (144, N'Cojali', N'Javier Alonso', N' Auxiliar de taller', N'Cl. Méndez Álvaro, 44. ', N'Santiago de Com', N'Madrid', N'28045', N'España', N'917538100', N'793371893', N'www.Cojali.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (145, N'Cementos De Granadilla', N'Juan Carlos', N'Ayudante de jefe de obra', N'Cl. Linares, 15. Martos. ', N'Lugo', N'Jaén', N'23600', N'España', N'953569100', N'421790209', N'www.Cementos De Granadilla.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (146, N'Innocean Worldwide Spain', N'Alberto Saul', N'Director de almacén', N'Cl. Santa Maria Magdalena, 14. Plta 4ª. ', N'Lorca', N'Madrid', N'28016', N'España', N'917027200', N'818500828', N'www.Innocean Worldwide Spain.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (147, N'Calvo y Salcines', N'Cristina Rosario', N'Jefe de planta', N'Av. Diputación, s/n. Edf Inditex. Arteixo. ', N'Cáceres', N'La Coruña', N'15142', N'España', N'981185400', N'397677483', N'www.Calvo y Salcines.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (148, N'Rossellimac', N'Homero Anibal', N'Jefe del departamento de compr', N'Cl. Isabel Colbrand, 22. ', N'San Fernando', N'Madrid', N'28050', N'España', N'627141136', N'618054075', N'www.Rossellimac.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (149, N'Saneamientos Pereda', N'Luis Eduardo', N'Director del área de compras', N'Cl. Carrer de la Ferralla, 12. Plg Ind San Vicente. Castellb', N'Las Rozas de Ma', N'Barcelona', N'8755', N'España', N'937730400', N'588086713', N'www.Saneamientos Pereda.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (150, N'Euro Spain Consulting', N'Dora Lylian', N'Director general', N'Av. Diputación, s/n. Edf Inditex. Arteixo. ', N'San Cugat del V', N'La Coruña', N'15142', N'España', N'981334900', N'752859928', N'www.Euro Spain Consulting.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (151, N'Envases Dura', N'Ricardo Maria', N'Técnico de marketing', N'Cl. San Juan de la Peña, 144. ', N'Rivas-Vaciamadr', N'Zaragoza', N'50015', N'España', N'976103101', N'475230583', N'www.Envases Dura.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (152, N'Pruna Motor', N'Juan Andres', N'Jefe de almacén', N'Cl. Velázquez, 132. ', N'San Sebastián d', N'Madrid', N'28006', N'España', N'913358400', N'612367455', N'www.Pruna Motor.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (153, N'Galletas Arluy', N'Guillermo Francisco', N'Gerente', N'Av. Diputación, s/n. Plg Ind de Sabon. Arteixo. ', N'Cornellá de Llo', N'La Coruña', N'15142', N'España', N'981185400', N'496233393', N'www.Galletas Arluy.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (154, N'Gre', N'Pedro Humberto', N'Director de taller', N'Av. del Camino de Santiago, 50. ', N'El Puerto de Sa', N'Madrid', N'28050', N'España', N'917100507', N'759803596', N'www.Gre.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (155, N'Recticel', N'Ricardo Adolfo', N'Técnico administrativo', N'Ps. Olmos, 19. ', N'Pozuelo de Alar', N'Madrid', N'28005', N'España', N'917099200', N'503442447', N'www.Recticel.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (156, N'Wedding Planner', N'Juan Angel', N'Técnico de almacén', N'Av. Bruselas, 35. Alcobendas. ', N'Guadalajara', N'Madrid', N'28108', N'España', N'914805000', N'746973037', N'www.Wedding Planner.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (157, N'Iberica de Patatas Selectas', N'Adriana Fatima', N'Secretario de dirección', N'Ctra. C-17, 17. Km 73.500 Colonia Lacambra.', N'Mijas', N' Barcelona', N'8508', N'España', N'938594283', N'815490893', N'www.Iberica de Patatas Selectas.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (158, N'Bidelan', N'Lilián Cristina', N'Jefe de planta', N'Cl. Germans Miquel, s/n. Plg Ind Empordà Internacional. Vila', N'Chiclana de la', N'Gerona', N'17469', N'España', N'972527000', N'418703413', N'www.Bidelan.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (159, N'Clarios Plastics Spain', N'Nelson Vladimir', N'Agente de Seguros', N'Cl. C, 42. Plg Ind Talluntxe. Noain (Valle de Elorz). ', N'Melilla', N' Navarra', N'31110', N'España', N'948368101', N'627394744', N'www.Clarios Plastics Spain.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (160, N'Jamones Ancin', N'Rodolfo Antonio', N'Agente de Bienes Raíces', N'Psj. del Conde de los Gaitanes, 177. Alcobendas. ', N'Toledo', N'Madrid', N'28109', N'España', N'917459100', N'341075424', N'www.Jamones Ancin.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (161, N'Premira Energía', N'Elina Sylvia', N'Gerente de TI', N'Cl. Traspalau, 8. Guissona. ', N'Torrente', N'Lérida', N'25210', N'España', N'900230230', N'729875115', N'www.Premira Energía.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (162, N'Baker Mckenzie', N'Iban Prado', N'Gerente de la Firma', N'Cl. Son Fangos, 100. Cplj Mirall Balear', N'El Ejido', N'Baleares', N'7007', N'España', N'917149200', N'407745156', N'www.Baker Mckenzie.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (163, N'Amadeus Soluciones Tecnologicas', N'Sergi Juan', N'Gerente de Departamento Legal', N'Cl. Vía Dublín, 7. ', N'San Baudilio de', N'Madrid', N'28042', N'España', N'933064200', N'838175817', N'www.Amadeus Soluciones Tecnologicas.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (164, N'Empresa Municipal de Transportes de Vale', N'Dardo Eduardo', N'Administrador de la Agencia', N'Cl. Trigo, 39. Plg Ind Polvoranca. Leganés. ', N'Ceuta', N'Madrid', N'28914', N'España', N'912898435', N'355796213', N'www.Empresa Municipal de TranspoValencia.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (165, N'Bada Hispanaplast', N'Mihaela Cañadas', N'Gerente Financiero', N'Av. de la Industria, 30. Edf Lilly. Alcobendas. ', N'Talavera de la', N'Madrid', N'28108', N'España', N'928587255', N'523254527', N'www.Bada Hispanaplast.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (166, N'Gp Acero', N'Jose Gustavo', N'Contador', N'Bro. San Agustín, s/n. Donostia', N'Pontevedra', N'Guipúzcoa', N'20017', N'España', N'934337332', N'871859190', N'www.Gp Acero.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (167, N'Olives And Pickles', N'Matilde Rey', N'Gerente de Recursos Humanos', N'Av. John Lennon, s/n. Getafe. ', N'Vélez-Málaga', N'Madrid', N'28906', N'España', N'915966000', N'461389646', N'www.Olives And Pickles.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (168, N'Sacyr Agua', N'Carlos Ramon', N'Supervisor de planta', N'Av. de Europa, 18. Pq Emp La Moraleja. Alcobendas. ', N'Torrevieja', N'Madrid', N'28108', N'España', N'952841451', N'594991077', N'www.Sacyr Agua.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (169, N'Gesa Carburantes', N'Juan Manuel', N' Gerente General', N'Ctra. Barajas, 32. Pq Emp Omega. Alcobendas. ', N'Fuengirola', N'Madrid', N'28100', N'España', N'912078707', N'365180212', N'www.Gesa Carburantes.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (170, N'Synectic, Tecnologias De La Informacion', N'Javier Rubi', N'Supervisora de Sección', N'Cl. Mercaders, 9-11. Plg Ind Riera de Caldes. ', N'Arona', N'Barcelona', N'8184', N'España', N'914906000', N'333409020', N'www.Synectic, Tecnologias De La Informacion.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (171, N'Gto Grupo Trans Onuba', N'Nora Beatriz', N'Administrador de Sucursal', N'Cl. Salvador de Madariaga, s/n. Pq Comercial. ', N'Coslada', N'Barcelona', N'8184', N'España', N'913796985', N'660352906', N'www.Gto Grupo Trans Onuba.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (172, N'Menadiona', N'Erika Casado', N'Supervisor Operativo', N'Pz. de Euskadi, 5. Bilbao. ', N'Orihuela', N'Vizcaya', N'48011', N'España', N'913008755', N'381251657', N'www.Menadiona.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (173, N'Guala Closures Iberica', N'Elber Fabian', N'Director Genera', N'Cl. Zurbarán, 28. ', N'Rubí', N'Madrid', N'28010', N'España', N'914809307', N'824337049', N'www.Guala Closures Iberica.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (174, N'Barcelo Trips & Travel', N'Dardo Javier', N'Gerente de Mercadeo', N'Rda. Canal Imperial de Aragón, 18-20. ', N'Manresa', N'Zaragoza', N'50197', N'España', N'981179301', N'311139740', N'www.Barcelo Trips & Travel.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (175, N'Vedette Española', N'Daniel Enrique', N'Supervisor de Ventas', N'Av. Aragón, 404. ', N'Valdemoro', N'Madrid', N'28022', N'España', N'913959000', N'350020722', N'www.Vedette Española.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (176, N'Sg Scientific Games', N'Joaquina Mateu', N'Administrador', N'Av. Bruselas, 22. Arroyo de la Vegas', N'Guecho', N'Madrid', N'28022', N'España', N'914842700', N'479945769', N'www.Sg Scientific Games.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (177, N'Seat Cupra', N'Antonia Exposito', N'Diseñador gráfico ', N'Pz. Gesta de Oviedo, 2. Oviedo. ', N'Palencia', N'Asturias', N'33007', N'España', N'948771000', N'446798963', N'www.Seat Cupra.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (178, N'Euroarce', N'Julio Cesar', N'Representante de servicio', N'Cl. Rio Bullaque, 2. ', N'Avilés', N' Madrid', N'28034', N'España', N'938816550', N'774918558', N'www.Euroarce.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (179, N'Portugalia Global Services', N'Miguel Ramon', N'Soporte administrativo ', N'Ctra. Arganda-Velilla San Antonio, s/n', N'Gandía', N'Madrid', N'28891', N'España', N'682234501', N'656209927', N'www.Portugalia Global Services.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (180, N'Ppg', N'Teresita', N'CEO', N'Av. Acerinox Europa, s/n. Plg Ind De. Los Barrios. ', N'La Coruña', N'Cádiz', N'11370', N'España', N'902116060', N'625072240', N'www.Ppg.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (181, N'Miservi de Supermercats', N'Magdalena Soriano', N'Jefe', N'Pz. Euskadi, 5. Bilbao. ', N'Elche', N'Vizcaya', N'48009', N'España', N'911778000', N'750883064', N'www.Miservi de Supermercats.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (182, N'Elkarkidetza E.p.s.v. de Empleo', N'Eduardo Mariano', N'Administrador', N'Cl. Jose Miguel Iturrioz, 26. Beasain. ', N'Granada', N'Guipúzcoa', N'20200', N'España', N'931730212', N'506770136', N'www.Elkarkidetza E.p.s.v. de Empleo.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (183, N'Beta Conkret', N'Ramon Heber', N'Jefe de planta', N'Cl. Gran Vía, 32. 5ª Plta. ', N'Tarrasa', N'Madrid', N'28013', N'España', N'902335555', N'813919579', N'www.Beta Conkret.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (184, N'Online Travel Evisa', N'Franci Jose', N'Supervisora', N'Ctra. Toledo, s/n. Km 9.200. ', N'Badalona', N'Madrid', N'28021', N'España', N'625605315', N'546715452', N'www.Online Travel Evisa.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (185, N'Renolit', N'Mirian San Martin', N'Director general ', N'Av. Matapiñonera, 9. San Sebastián d', N'Santander', N'Madrid', N'28703', N'España', N'934987950', N'541657569', N'www.Renolit.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (186, N'Conservas Cerqueira', N'Nelly Maria', N'Gerente general', N'Av. San Luis, 77.', N'Alcorcón', N'Madrid', N'28033', N'España', N'915670051', N'585886772', N'www.Conservas Cerqueira.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (187, N'Cortizo', N'José Pedro', N'Gerente de Servicios Administr', N'Av. Diputación, s/n. Edf Inditex. Arteixo. ', N'San Cristóbal d', N'La Coruña', N'15142', N'España', N'902506210', N'682913641', N'www.Cortizo.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (188, N'Dominion Networks', N'Julia Isabel', N'Gerente de Marketing', N'Av. Vega, 15. Alcobendas. ', N'Logroño', N'Madrid', N'28108', N'España', N'954720550', N'668392687', N'www.Dominion Networks.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (189, N'Tsk Electrónica y Electricidad', N'Candelaria Cardona', N' Gerente de Recursos Humanos', N'Ps. de la Castellana, 95. ', N'Badajoz', N'Madrid', N'28046', N'España', N'915731000', N'773612597', N'www.Tsk Electrónica y Electricidad.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (190, N'Automóviles Louzao Vigo', N'Naira Brito', N'Gerente de TI ', N'Av. Can Fatjo dels Aurons, 9. Sant Cugat del Valles. ', N'Marbella', N'Barcelona', N'8174', N'España', N'981185400', N'737828673', N'www.Automóviles Louzao Vigo.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (191, N'Pinturas Isaval', N'Milton Dante', N'Gerente de Operaciones ', N'Cl. Can Rabia, 3-5.', N'Salamanca', N'Barcelona', N'8017', N'España', N'913748143', N'386429371', N'www.Pinturas Isaval.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (192, N'Tendam Retail', N'Florencio Botella', N'Gerente de Comunicaciones', N'Cl. Méndez Álvaro, 44. ', N'Huelva', N'Madrid', N'28045', N'España', N'913875438', N'337607623', N'www.Tendam Retail.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (193, N'UFD Distribución Electricidad', N'Jorge Luis', N'CEO', N'Cl. Tomás Redondo, 1. ', N'Lérida', N'Madrid', N'28033', N'España', N'915676000', N'505251972', N'www.UFD Distribución Electricidad.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (194, N'Canal de Isabel II', N'Elisa Solana', N'Director Ejecutivo', N'Cl. Albareda, 38. Plg Woermann. ', N'Dos Hermanas', N'Las Palmas', N'35008', N'España', N'915451279', N'839264950', N'www.Canal de Isabel II.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (195, N'Gonvarri I Centro de Servicios', N'Melania Sempere', N' Responsable operativo', N'Ps. de la Castellana, 95. ', N'Tarragona', N'Madrid', N'28046', N'España', N'913791900', N'765997812', N'www.Gonvarri I Centro de Servicios.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (196, N'Norbega', N'Julio Cesar', N'Director Comercial', N'Av. Fábrica, s/n. ', N'Torrejón de Ard', N'Córdoba', N'14005', N'España', N'944577000', N'520122216', N'www.Norbega.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (197, N'J García Carrión', N'Ruben Humberto', N'Director de Marketing', N'Av. Diputación, s/n. Edf Inditex. Arteixo. ', N'Parla', N'La Coruña', N'15142', N'España', N'968297833', N'371863496', N'www.J García Carrión.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (198, N'Orange España Comunicaciones Fijas', N'Julio Cesar', N'Recepcioista', N'Ps. Olmos, 19. ', N'Mataró', N'Madrid', N'28005', N'España', N'912521200', N'865478614', N'www.Orange España Comunicaciones Fijas.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (199, N'Iberdrola Generación', N'Vilibaldo Jose', N'Director Financiero', N'Av. Bruselas, 35. Alcobendas. ', N'Algeciras', N'Madrid', N'28108', N'España', N'944151411', N'859359310', N'www.Iberdrola Generación.com')
INSERT [dbo].[G1Proveedores] ([ProveedoresID], [NombreCompañia], [NombreContacto], [TituloContacto], [Direccion], [Ciudad], [Region], [CodigoPostal], [Pais], [Telefono], [Fax], [PaginaPrincipal]) VALUES (200, N'Supermercados Sabeco', N'Bruno Santos', N'Auditora ', N'Ps. de la Castellana, 95. ', N'León', N'Madrid', N'28046', N'España', N'948368101', N'328325892', N'www.Supermercados Sabeco.com')
GO
SET IDENTITY_INSERT [dbo].[G1Proveedores] OFF
GO
TRUNCATE TABLE G1Region
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (1, N'Tegucigalpa')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (2, N'Berlin')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (3, N'Washington')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (4, N'Ottawa')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (5, N'Kyiv')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (6, N'Moscu')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (7, N'Sarajevo')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (8, N'San Jose')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (9, N'Panana')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (10, N'San Salvador')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (11, N'Belmopan')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (12, N'Managua')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (13, N'Ciudad Guatemala')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (14, N'Brasilia')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (15, N'Buenos Aires')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (16, N'Caracas')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (17, N'Bogota')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (18, N'Montevideo')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (19, N'Lima')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (20, N'Asuncion')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (21, N'Kingstown')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (22, N'Sucre')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (23, N'Santiago de Chile')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (24, N'Mexico D.F')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (25, N'Sucre')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (26, N'Parabarimo')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (27, N'Puerto España')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (28, N'Nasau')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (29, N'La Habana')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (30, N'Puerto Principe')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (31, N'Santo Domingo')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (32, N'Georgetown')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (33, N'Roma')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (34, N'Grecia')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (35, N'Budapest')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (36, N'Praga')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (37, N'Londres')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (38, N'Viena')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (39, N'Amsterdam')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (40, N'Paris')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (41, N'Madrid')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (42, N'Lisboa')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (43, N'Estocolmo')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (44, N'Bucarest')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (45, N'Bruselas')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (46, N'Minsk')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (47, N'Belgrado')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (48, N'Berna')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (49, N'Copenhague')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (50, N'Tirana')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (51, N'Helsinki')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (52, N'Bratislava')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (53, N'Dublin')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (54, N'Oslo')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (55, N'Andorra')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (56, N'Reikiavik')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (57, N'Luxemburgo')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (58, N'Pristina')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (59, N'Torshavn')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (60, N'Varsovia')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (61, N'Sofia')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (62, N'Zagreb')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (63, N'Chisinau')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (64, N'Vilnius')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (65, N'Skopje')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (66, N'Monaco')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (67, N'Esmuigua')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (68, N'Bodroyles')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (69, N'Zaspax')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (70, N'Radrana')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (71, N'Trarhiel')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (72, N'Theystein')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (73, N'Asha')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (74, N'Adrary')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (75, N'Brae Sharia')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (76, N'Snuyp Pryae')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (77, N'Kestaursia')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (78, N'Wheugua')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (79, N'Gespena')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (80, N'Thoaqua')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (81, N'Uskil')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (82, N'Swoyyae')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (83, N'Etrana')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (84, N'Shales')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (85, N'Kuclaland')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (86, N'Jachaidor')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (87, N'Aprar')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (88, N'Sucros')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (89, N'Swoesau')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (90, N'Griynia')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (91, N'Ubryae')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (92, N'Ufrar')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (93, N'Troe Bror')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (94, N'Friat Chesh')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (95, N'Budraevania')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (96, N'Zupreagro')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (97, N'Rastain')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (98, N'Xospijan')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (99, N'Claiye')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (100, N'Proequa')
GO
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (101, N'Otrium')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (102, N'Obrines')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (103, N'Brous Whos')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (104, N'Braul Men')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (105, N'Usceinga')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (106, N'Cachearhiel')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (107, N'caprus')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (108, N'Uspye')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (109, N'Strueca')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (110, N'Skoisau')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (111, N'Usmen')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (112, N'Oscein')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (113, N'Gleij Cra')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (114, N'Sceuc Snon')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (115, N'Bepliarhiel')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (116, N'Qupraylia')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (117, N'Yocryae')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (118, N'Ushya')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (119, N'Fliyla')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (120, N'Sneacia Eblon')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (121, N'Oblain')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (122, N'Scoit')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (123, N'Thington Fruc')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (124, N'Spana')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (125, N'Sesciuton')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (126, N'Pespeuca')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (127, N'Kublesh')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (128, N'Datron')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (129, N'Sweria')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (130, N'Swuara')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (131, N'Otror')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (132, N'Oglia')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (133, N'Theyk Chor')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (134, N'Snuev Drela')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (135, N'Efreiji')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (136, N'Efleusau')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (137, N'Yablana')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (138, N'Rushia')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (139, N'Flieso')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (140, N'Fleora')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (141, N'Usmurg')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (142, N'Esca')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (143, N'Shuij Shistan')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (144, N'Treyi Swary')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (145, N'Usnuoca')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (146, N'Iusmuoso')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (147, N'Hawhua')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (148, N'Bafrana')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (149, N'Shaugro')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (150, N'Whioton')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (151, N'Oscad')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (152, N'Usmor')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (153, N'Troew Flein')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (154, N'Clal Snaria')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (155, N'Qutraera')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (156, N'Ebruaze')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (157, N'Baflya')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (158, N'Jeglait')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (159, N'Brueria')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (160, N'Druytho')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (161, N'Uskon')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (162, N'Oswary')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (163, N'Flayw Swax')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (164, N'Skuys Bren')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (165, N'xostroebia')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (166, N'Nespoaye')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (167, N'IewHyae')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (168, N'Qecla')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (169, N'Friuya')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (170, N'Blieca')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (171, N'Acea')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (172, N'Acrea')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (173, N'Aplait')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (174, N'Bliys Wha')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (175, N'Shoiz Strya')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (176, N'Secronga')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (177, N'Vestailes')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (178, N'Redrurg')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (179, N'Owhua')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (180, N'Cretho')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (181, N'Sceusal')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (182, N'Ethal')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (183, N'Uthela')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (184, N'Scayq Spa')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (185, N'Praoy Flea')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (186, N'Muthuoland')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (187, N'Motheysia')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (188, N'Yogren')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (189, N'Boblya')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (190, N'Cruylia')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (191, N'SnailHiel')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (192, N'Ofrington')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (193, N'Uscana')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (194, N'clan Swela')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (195, N'Shuyf thia')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (196, N'Ucheowana')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (197, N'Deprairus')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (198, N'Escesh')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (199, N'Ascana')
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (200, N'Shaira')
GO
INSERT [dbo].[G1Region] ([RegionID], [DescripcionRegion]) VALUES (201, N'Swye')
GO
TRUNCATE TABLE G1Territorios
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'1', N'Chipre', 357)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'10', N'Andorra', 376)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'100', N'Islas Virgenes Britanicas', 1284)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'101', N'Aruba', 297)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'102', N'Islas Feroe', 298)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'103', N'Kosovo', 383)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'104', N'Malta', 356)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'105', N'Moldavia', 679)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'106', N'Portugal', 351)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'107', N'Finca Standigreece', 1)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'108', N'Tralme Slandsi', 8)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'109', N'Ai zambal', 6)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'11', N'Belgica', 32)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'110', N'Andten', 7)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'111', N'Burundu', 7)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'112', N'Ifgha Bermo', 2)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'113', N'Siaguamki', 15)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'114', N'Oti', 7)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'115', N'Ofjo Domar', 7)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'116', N'Uof', 5)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'117', N'Khstante Cameame', 10)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'118', N'Nitedu Ngoriru Kingdom', 12)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'119', N'Botswana', 12)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'12', N'Alemania', 49)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'120', N'Laylespain', 11)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'121', N'Dengeorblic', 2)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'123', N'Zimblic TodjFrench', 15)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'124', N'Turquia', 11)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'125', N'Corawaitria', 8)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'126', N'Jordania', 13)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'127', N'Ure', 15)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'128', N'Wheugua', 12)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'129', N'Swata Ryar', 8)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'13', N'Islandia', 354)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'130', N'Eastern Ferated Urocu', 7)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'131', N'Slandsking Ulare', 13)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'132', N'Tror', 11)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'133', N'Normalize', 8)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'134', N'Awi Ofleoneni', 12)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'135', N'United Ntitswari', 8)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'136', N'Aguisan', 13)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'137', N'Honbia Riapierre ', 8)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'138', N'SlandsMaar Haa', 7)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'139', N'Vagytiu', 10)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'14', N'Irlanda', 353)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'140', N'Tiaand Tears', 10)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'141', N'Boreuzilqua', 13)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'142', N'South Gascoce', 13)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'143', N'Boudia Zada', 8)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'144', N'Dena Crosoutria', 2)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'145', N'Kampucha', 10)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'146', N'Rwanfolkniue', 3)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'147', N'Riana Nalandgin', 12)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'148', N'Vialeta', 4)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'149', N'Rseyfrenchdor', 13)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'15', N'Luxemburgo', 352)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'150', N'Rkeybaco', 11)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'151', N'Lazue', 12)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'152', N'Aldonya', 10)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'153', N'Slandslisigerni', 3)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'154', N'Britishcusey', 15)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'155', N'Eclal', 14)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'156', N'Benin', 3)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'157', N'Qatar', 3)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'158', N'Eritrea', 13)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'159', N'Kenia', 10)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'16', N'Monaco', 377)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'160', N'Vietnam', 12)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'161', N'Niger', 15)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'162', N'Costo de marfil', 10)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'163', N'Fraeland Ashijan', 13)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'164', N'Cutrax', 14)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'165', N'Gespang', 11)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'166', N'Ruanda', 12)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'167', N'Tanzania', 1)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'168', N'Angola', 10)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'169', N'Yemen', 1)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'17', N'Noruega', 47)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'170', N'Jibuti', 4)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'171', N'Zambia', 5)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'172', N'Sudan', 10)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'173', N'Malasia', 10)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'174', N'Iran', 4)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'175', N'Timor Oriental', 4)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'176', N'Gambia', 3)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'177', N'Kestausia', 10)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'178', N'Libia', 3)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'179', N'Congo', 10)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'18', N'España', 34)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'180', N'Egipto', 5)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'181', N'Pakistan', 3)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'182', N'Guinea Ecuatorial', 3)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'183', N'Bangladesh', 5)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'184', N'Israel', 2)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'185', N'Bahrein', 14)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'186', N'Usceau', 13)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'187', N'Mongolia', 7)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'188', N'Camerun', 3)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'189', N'Mozambique', 12)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'19', N'Suiza', 41)
GO
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'190', N'Nigeria', 14)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'191', N'Somalia', 2)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'192', N'Singapur', 13)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'193', N'Sri Lanka', 1)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'194', N'Palestina', 4)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'195', N'Liberia', 2)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'196', N'Myanmar', 12)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'197', N'Siria', 12)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'198', N'Cabo Verde', 7)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'199', N'Indonesia', 5)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'2', N'Bosnia y Herzegovina', 387)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'20', N'San Marino', 378)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'200', N'Uganda', 11)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'21', N'Armenia', 374)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'22', N'Azerbaijan', 994)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'23', N'Gibraltar', 350)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'24', N'Vaticano', 379)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'25', N'Kirguizistan', 996)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'26', N'Moldavia', 373)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'27', N'Kuwait', 15)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'28', N'Rusia', 7)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'29', N'Montenegro', 382)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'3', N'Croacia', 385)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'30', N'Turkmenistan', 993)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'31', N'Ucrania', 380)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'32', N'Uzbekistan', 998)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'33', N'Gran Bretaña', 44)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'34', N'Albania', 355)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'35', N'Bulgaria', 359)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'36', N'Hungria', 36)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'37', N'Lituania', 370)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'38', N'Eslovenia', 386)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'39', N'Polonia', 48)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'4', N'Estonia', 372)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'40', N'Eslovaquia', 421)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'41', N'Serbia', 381)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'42', N'Tunez', 1)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'43', N'Austria', 43)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'44', N'Dinamarca', 45)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'45', N'Francia', 33)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'46', N'Grecia', 30)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'47', N'Italia', 39)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'48', N'Iran', 6)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'49', N'Crye Struc', 6)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'5', N'Letonia', 371)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'50', N'Holanda', 31)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'51', N'Noruega', 47)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'52', N'Suecia', 46)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'53', N'Estados Unidos', 1340)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'54', N'Mexico', 52)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'55', N'Canada', 1974)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'56', N'Japon', 9)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'57', N'Honduras', 504)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'58', N'Belice', 501)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'59', N'El Salvador', 503)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'6', N'Macedonia', 389)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'60', N'Nicaragua', 505)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'61', N'Guatemala', 502)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'62', N'Costa Rica', 506)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'63', N'Panama', 507)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'64', N'Colombia', 57)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'65', N'Brasil', 55)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'66', N'Peru', 51)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'67', N'Bolivia', 591)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'68', N'Paraguay', 595)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'69', N'Venezuela', 58)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'7', N'Rumania', 40)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'70', N'Surinam', 597)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'71', N'Uruguay', 598)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'72', N'Argentina', 54)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'73', N'Chile', 56)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'74', N'Guadalupe', 590)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'75', N'Antigua Y Barbuda', 1268)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'76', N'Bahamas', 1242)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'77', N'Dominica', 1767)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'78', N'Granada', 1473)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'79', N'Jamaica', 1876)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'8', N'Eslovenia', 386)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'80', N'Republica Dominicana', 1849)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'81', N'Trinidad y Tobago', 1868)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'82', N'Barbados', 1246)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'83', N'Cuba', 53)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'84', N'Haiti', 509)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'85', N'Martinica', 596)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'86', N'Ecuador', 593)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'87', N'Iraq', 6)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'88', N'Guyana Francesa', 594)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'89', N'Islas Caiman', 1345)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'9', N'Afganistan', 2)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'90', N'Anguila', 1264)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'91', N'San Vicente y las Granadinas', 1784)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'92', N'San Cristobal y Nieves', 1876)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'93', N'Curazao', 599)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'94', N'Bermudas', 1441)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'95', N'Islas Malvinas', 500)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'96', N'Santa Lucia', 1758)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'97', N'San Martin', 1721)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'98', N'Islas Turcas y Caicos', 1649)
INSERT [dbo].[G1Territorios] ([TerritorioID], [DescripcionTerritorio], [RegionID]) VALUES (N'99', N'Islas Caiman', 1345)
GO
TRUNCATE TABLE G1TerritoriosEmpleados
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (1, N'1')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (2, N'2')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (3, N'3')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (4, N'4')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (5, N'5')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (6, N'6')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (7, N'7')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (8, N'8')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (9, N'9')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (10, N'10')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (11, N'11')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (12, N'12')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (13, N'13')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (14, N'14')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (15, N'15')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (16, N'16')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (17, N'17')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (18, N'18')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (19, N'19')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (20, N'20')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (21, N'21')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (22, N'22')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (23, N'23')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (24, N'24')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (25, N'25')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (26, N'26')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (27, N'27')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (28, N'28')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (29, N'29')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (30, N'30')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (31, N'31')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (32, N'32')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (33, N'33')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (34, N'34')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (35, N'35')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (36, N'36')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (37, N'37')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (38, N'38')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (39, N'39')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (40, N'40')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (41, N'41')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (42, N'42')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (43, N'43')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (44, N'44')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (45, N'45')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (46, N'46')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (47, N'47')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (48, N'48')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (49, N'49')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (50, N'50')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (51, N'51')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (52, N'52')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (53, N'53')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (54, N'54')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (55, N'55')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (56, N'56')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (57, N'57')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (58, N'58')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (59, N'59')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (60, N'60')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (61, N'61')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (62, N'62')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (63, N'63')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (64, N'64')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (65, N'65')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (66, N'66')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (67, N'67')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (68, N'68')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (69, N'69')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (70, N'70')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (71, N'71')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (72, N'72')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (73, N'73')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (74, N'74')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (75, N'75')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (76, N'76')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (77, N'77')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (78, N'78')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (79, N'79')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (80, N'80')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (81, N'81')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (82, N'82')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (83, N'83')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (84, N'84')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (85, N'85')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (86, N'86')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (87, N'87')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (88, N'88')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (89, N'89')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (90, N'90')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (91, N'91')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (92, N'92')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (93, N'93')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (94, N'94')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (95, N'95')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (96, N'96')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (97, N'97')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (98, N'98')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (99, N'99')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (100, N'100')
GO
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (101, N'101')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (102, N'102')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (103, N'103')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (104, N'104')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (105, N'105')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (106, N'106')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (107, N'107')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (108, N'108')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (109, N'109')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (110, N'110')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (111, N'111')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (112, N'112')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (113, N'113')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (114, N'114')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (115, N'115')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (116, N'116')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (117, N'117')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (118, N'118')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (119, N'119')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (120, N'120')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (121, N'121')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (122, N'122')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (123, N'123')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (124, N'124')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (125, N'125')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (126, N'126')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (127, N'127')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (128, N'128')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (129, N'129')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (130, N'130')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (131, N'131')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (132, N'132')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (133, N'133')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (134, N'134')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (135, N'135')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (136, N'136')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (137, N'137')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (138, N'138')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (139, N'139')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (140, N'140')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (141, N'141')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (142, N'142')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (143, N'143')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (144, N'144')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (145, N'145')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (146, N'146')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (147, N'147')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (148, N'148')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (149, N'149')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (150, N'150')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (151, N'151')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (152, N'152')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (153, N'153')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (154, N'154')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (155, N'155')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (156, N'156')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (157, N'157')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (158, N'158')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (159, N'159')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (160, N'160')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (161, N'161')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (162, N'162')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (163, N'163')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (164, N'164')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (165, N'165')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (166, N'166')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (167, N'167')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (168, N'168')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (169, N'169')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (170, N'170')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (171, N'171')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (172, N'172')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (173, N'173')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (174, N'174')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (175, N'175')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (176, N'176')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (177, N'177')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (178, N'178')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (179, N'179')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (180, N'180')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (181, N'181')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (182, N'182')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (183, N'183')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (184, N'184')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (185, N'185')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (186, N'186')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (187, N'187')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (188, N'188')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (189, N'189')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (190, N'190')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (191, N'191')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (192, N'192')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (193, N'193')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (194, N'194')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (195, N'195')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (196, N'196')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (197, N'197')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (198, N'198')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (199, N'199')
INSERT [dbo].[G1TerritoriosEmpleados] ([EmpleadoID], [TerritorioID]) VALUES (200, N'200')
GO
SET IDENTITY_INSERT [dbo].[G1Transportistas] ON 
TRUNCATE TABLE G1Transportistas
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (1, N'Advisor Shipping', N'+(211) 99997767')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (2, N'Alliance Shipping', N'+(793) 99994841')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (3, N'Aspire Shipping', N'+(33) 99992612')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (4, N'Astonish Shipping', N'+(402) 99994301')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (5, N'Astound Shipping', N'+(864) 99998044')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (6, N'Auction Shipping', N'+(80) 99991563')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (7, N'Barter Shipping', N'+(951) 99994757')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (8, N'Belief Shipping', N'+(84) 99996155')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (9, N'Boss Shipping', N'+(888) 99995035')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (10, N'Bound Shipping', N'+(79) 99992330')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (11, N'Bright Shipping', N'+(706) 99997500')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (12, N'Cart Shipping', N'+(452) 99996964')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (13, N'Champion Shipping', N'+(928) 99998696')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (14, N'Crafty Shipping', N'+(612) 99994621')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (15, N'Dart Shipping', N'+(726) 99990877')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (16, N'Depot Shipping', N'+(209) 99991305')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (17, N'Dominate Shipping', N'+(607) 99997969')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (18, N'Drive Shipping', N'+(752) 99995221')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (19, N'Drop Shipping', N'+(172) 99999343')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (20, N'Elite Shipping', N'+(660) 99997803')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (21, N'Excel Shipping', N'+(812) 99990921')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (22, N'Federal Shipping', N'+(183) 99996342')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (23, N'Flawless Shipping', N'+(30) 99994140')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (24, N'Flip Shipping', N'+(415) 99995743')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (25, N'Foster Shipping', N'+(454) 99995827')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (26, N'Genuine Shipping', N'+(323) 99990256')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (27, N'Global Shipping', N'+(279) 99997262')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (28, N'Innovate Shipping', N'+(611) 99990637')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (29, N'Instant Shipping', N'+(540) 99995107')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (30, N'Key Shipping', N'+(647) 99997800')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (31, N'Market Shipping', N'+(39) 99995805')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (32, N'Outright Shipping', N'+(419) 99997343')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (33, N'Perspective Shipping', N'+(5) 99993532')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (34, N'Praise Shipping', N'+(686) 99993880')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (35, N'Premier Shipping', N'+(926) 99996002')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (36, N'Primary Shipping', N'+(400) 99990702')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (37, N'Primed Shipping', N'+(361) 99996508')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (38, N'Qualified Shipping', N'+(165) 99998971')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (39, N'Reliable Shipping', N'+(721) 99995861')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (40, N'Restore Shipping', N'+(310) 99999076')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (41, N'Sage Shipping', N'+(964) 99994574')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (42, N'Scoot Shipping', N'+(216) 99997900')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (43, N'Shippingadri', N'+(711) 99991757')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (44, N'Shippingara', N'+(220) 99994818')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (45, N'Shippingbes', N'+(578) 99992181')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (46, N'Shippingella', N'+(99) 99992787')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (47, N'Shippingfluent', N'+(831) 99996453')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (48, N'Shippingify', N'+(94) 99996211')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (49, N'Shippingium', N'+(955) 99997849')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (50, N'Shippingly', N'+(312) 99996873')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (51, N'Shippingry', N'+(487) 99995392')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (52, N'Shippingvio', N'+(74) 99999690')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (53, N'Shippingya', N'+(605) 99993740')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (54, N'Shippingzen', N'+(437) 99992528')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (55, N'Shippingzilla', N'+(877) 99999713')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (56, N'Snap Shipping', N'+(436) 99999411')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (57, N'Speedy Express', N'+(642) 99999561')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (58, N'Spot Shipping', N'+(958) 99997173')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (59, N'Strike Shipping', N'+(748) 99994668')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (60, N'United Package', N'+(419) 99994388')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (61, N'TOP shipping', N'+(627) 99999924')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (62, N'Turbo shipping', N'+(714) 99993326')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (63, N'Universal shipping', N'+(146) 99994999')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (64, N'unlimited shipping', N'+(688) 99999194')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (65, N'upgrade shipping', N'+(510) 99996673')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (66, N'valiant shipping', N'+(288) 99996187')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (67, N'Catracho shipping', N'+(335) 99998620')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (68, N'FedEx', N'+(504) 99856562')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (69, N'Legados Shipping', N'8(515)704-43-2528')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (70, N'Quieto Shipping', N'327(382)522-14-8233')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (71, N'Hierve Shipping', N'481(95)281-56-1898')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (72, N'Sombreaods Shipping', N'37(028)431-66-4413')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (73, N'Upgrade Shipping', N'32(84)095-18-4027')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (74, N'Detalle Shipping', N'870(0401)665-89-0121')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (75, N'Showroom Shipping', N'7(06)259-38-7175')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (76, N'Impresa Shipping', N'4(647)133-93-4055')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (77, N'Helecho Shipping', N'2(191)506-38-7139')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (78, N'Masters Shipping', N'95(63)061-30-2963')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (79, N'Nomadas Shipping', N'2(138)450-22-1627')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (80, N'Metas Shipping', N'78(11)827-85-6588')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (81, N'Analisis Shipping', N'391(65)689-85-1619')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (82, N'Clinicas Shipping', N'41(899)842-33-0160')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (83, N'Participaciones Shipping', N'87(5374)269-46-4871')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (84, N'Consejos Shipping', N'602(559)616-64-4330')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (85, N'Cartografias Shipping', N'150(199)476-64-3678')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (86, N'Staff Shipping', N'2(2988)230-63-7888')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (87, N'Drive Shipping', N'08(92)585-95-2785')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (88, N'Clasicos Shipping', N'04(816)135-82-4755')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (89, N'Postales Shipping', N'85(8063)267-02-2075')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (90, N'Armarios Shipping', N'821(5687)537-01-2893')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (91, N'Tunel  Shipping', N'33(9082)899-78-1977')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (92, N'Font Shipping', N'65(2853)729-07-2352')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (93, N'Agencia Shipping', N'34(2470)990-65-7139')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (94, N'Ficciones Shipping', N'8(95)862-19-7340')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (95, N'Discutiva Shipping', N'233(36)266-84-7138')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (96, N'Esquinas Shipping', N'685(61)810-25-1084')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (97, N'Artistas Shipping', N'88(7063)110-49-9175')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (98, N'Grupales Shipping', N'4(537)538-61-3901')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (99, N'Dorados Shipping', N'816(07)023-03-1566')
GO
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (100, N'Bio Shipping', N'2(9842)140-05-1033')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (101, N'Party Shipping', N'434(4614)296-91-8807')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (102, N'Modulares Shipping', N'34(845)656-92-1379')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (103, N'Lineares Shipping', N'411(411)201-37-5729')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (104, N'Servi Shipping', N'74(3052)750-73-4849')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (105, N'Cuerpo  Shipping', N'6(69)729-39-1258')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (106, N'Aprende Shipping', N'428(41)024-37-3866')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (107, N'Estivales Shipping', N'72(905)350-50-9351')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (108, N'Broadcasts Shipping', N'5(226)701-08-8626')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (109, N'Bodies Shipping', N'659(42)588-41-4629')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (110, N'Altos Shipping', N'5(00)010-90-7266')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (111, N'Sanidad Shipping', N'260(881)768-13-1166')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (112, N'Modelos Shipping', N'76(78)681-85-7774')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (113, N'Sagitario Shipping', N'426(942)668-73-5102')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (114, N'Sueño Shipping', N'70(4993)702-18-6452')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (115, N'Crece Shipping', N'95(61)345-44-7828')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (116, N'Capacidad Shipping', N'776(33)558-29-3523')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (117, N'Colosales Shipping', N'4(2437)727-65-6324')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (118, N'Complementarios Shipping', N'2(4339)596-12-9269')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (119, N'Dominio Shipping', N'02(00)860-40-3905')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (120, N'Retoños Shipping', N'59(4153)657-92-6428')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (121, N'Faciales Shipping', N'383(54)676-73-2222')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (122, N'Mascotas Shipping', N'471(47)395-82-3652')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (123, N'Nucleolos Shipping', N'884(522)545-87-2243')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (124, N'Graneros Shipping', N'80(29)022-77-5663')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (125, N'Maxima Shipping', N'2(3418)676-90-0249')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (126, N'Black Shipping', N'82(635)033-79-7816')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (127, N'Modular Shipping', N'6(9557)472-72-2104')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (128, N'Suma Shipping', N'77(68)053-83-5441')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (129, N'Anabolismo Shipping', N'4(8183)001-21-2769')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (130, N'Amaneceres Shipping', N'66(068)419-95-1297')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (131, N'Galas Shipping', N'1(306)196-36-2329')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (132, N'Puntoi Shipping', N'506(406)915-21-3239')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (133, N'Data Shipping', N'361(578)024-01-0074')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (134, N'Efectivo Shipping', N'80(8240)738-70-1316')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (135, N'shipping mega', N'(+112)40387531')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (136, N'simplify shipping', N'(+328)69859499')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (137, N'Payne shipping', N'(+981)7513587')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (138, N'Mixed Shipping', N'(+72)31025493')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (139, N'Shield Shipping', N'(+806)16386864')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (140, N'Shipping Traders', N'(+422)62425418')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (141, N'Shipping Magnet', N'(+370)57974476')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (142, N'Shipping Keyword', N'(+447)27724168')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (143, N'Mixed Shipping', N'(+662)46598689')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (144, N'street Shipping', N'(+108)39962327')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (145, N'Blueline shipping', N'(+840)59292622')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (146, N'Bloom shipping', N'(+743)44090444')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (147, N'Lucent shipping', N'(+252)3142271')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (148, N'Shipping creator', N'(+862)50138893')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (149, N'Asset shipping', N'(+324)68857676')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (150, N'Snap shipping', N'(+718)5343383')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (151, N'Shipping Catch', N'(+796)13123806')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (152, N'Luxy shipping', N'(+218)32109182')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (153, N'Forefront shipping', N'(+951)78579795')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (154, N'Animated shipping', N'(+528)7954763')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (155, N'Atlantis shipping', N'(+162)22961685')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (156, N'Shipping lion', N'(+135)48619229')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (157, N'Common shipping', N'(+831)70848759')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (158, N'Carefree shipping', N'(+69)16299670')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (159, N'Glide shipping', N'(+909)41448065')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (160, N'Grand shipping', N'(+289)64365225')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (161, N'Einstein shipping', N'(+75)71996299')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (162, N'Shipping shock', N'(+323)46822179')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (163, N'Shipping United', N'(+340)50889988')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (164, N'Shipping spotter', N'(+830)67512813')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (165, N'Shipping shock', N'(+620)71475825')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (166, N'Shipping united', N'(+958)16184828')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (167, N'protection shipping', N'(+998)46239018')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (168, N'Newline shipping', N'(+379)34167625')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (169, N'Bonita shipping', N'(+564)26652425')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (170, N'Shipping Anonymous', N'(+188)78560996')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (171, N'Shipping Professor', N'(+483)82779272')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (172, N'Shipping Better', N'(+479)34117069')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (173, N'Shipping Sage', N'(+880)51168287')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (174, N'Britannia shipping', N'(+843)26061279')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (175, N'Shipping System', N'(+139)66584716')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (176, N'Tower Shipping', N'(+102)8328796')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (177, N'Elastic Shipping', N'(+693)13322760')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (178, N'Tierra Shipping', N'(+895)5827177')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (179, N'Shipping forward', N'(+231)65827444')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (180, N'Cyrus Shipping', N'(+667)63006125')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (181, N'Reaction Shipping', N'(+42)81821413')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (182, N'Cipher Shipping', N'(+215)74570400')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (183, N'Shipping stone', N'(+670)30784213')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (184, N'Shipping paragon', N'(+338)69432976')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (185, N'Shipping Lucky', N'(+510)56410039')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (186, N'Shipping Crawler', N'(+112)83137904')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (187, N'Shipping cheap', N'(+858)11958744')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (188, N'Gallant Shipping', N'(+471)42951809')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (189, N'Planetearth Shipping', N'(+880)85979700')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (190, N'OnDemand Shipping', N'(+801)67802443')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (191, N'Shipping like', N'(+627)47975072')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (192, N'Shipping Com', N'(+635)57120677')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (193, N'TouchPoint Shipping', N'(+238)40050747')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (194, N'Shipping Parts', N'(+465)49876815')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (195, N'Sideline Shipping', N'(+332)64706958')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (196, N'BigBox shipping', N'(+864)11606872')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (197, N'Shipping Arena', N'(+957)82553192')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (198, N'NewWorld Shipping', N'(+885)8762483')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (199, N'Revere Shipping', N'(+698)13747655')
GO
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (200, N'Shipping file', N'(+549)61842467')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (201, N'Bio Shipping', N'(+592)33637613')
INSERT [dbo].[G1Transportistas] ([TransportistasID], [NombreCompañia], [Telefono]) VALUES (202, N'Hexagon Shipping', N'(+421)25800257')
SET IDENTITY_INSERT [dbo].[G1Transportistas] OFF
GO
ALTER TABLE [dbo].[G1DetallesOrdenes] ADD  DEFAULT ((0)) FOR [PrecioUnitario]
GO
ALTER TABLE [dbo].[G1DetallesOrdenes] ADD  DEFAULT ((1)) FOR [Cantidad]
GO
ALTER TABLE [dbo].[G1DetallesOrdenes] ADD  DEFAULT ((0)) FOR [Descuento]
GO
ALTER TABLE [dbo].[G1Orden] ADD  DEFAULT ((0)) FOR [Peso]
GO
ALTER TABLE [dbo].[G1Productos] ADD  DEFAULT ((0)) FOR [PrecioUnitario]
GO
ALTER TABLE [dbo].[G1Productos] ADD  DEFAULT ((0)) FOR [UnidadesenStock]
GO
ALTER TABLE [dbo].[G1Productos] ADD  DEFAULT ((0)) FOR [UnidadesenOrden]
GO
ALTER TABLE [dbo].[G1Productos] ADD  DEFAULT ((0)) FOR [NiveldeReordenamiento]
GO
ALTER TABLE [dbo].[G1Productos] ADD  DEFAULT ((0)) FOR [Descontinuado]
GO
ALTER TABLE [dbo].[G1ClientesClientesDemo]  WITH CHECK ADD  CONSTRAINT [FK_ClientesClientesDemo] FOREIGN KEY([ClienteTipoID])
REFERENCES [dbo].[G1DemograficasClientes] ([ClientesTipoID])
GO
ALTER TABLE [dbo].[G1ClientesClientesDemo] CHECK CONSTRAINT [FK_ClientesClientesDemo]
GO
ALTER TABLE [dbo].[G1ClientesClientesDemo]  WITH CHECK ADD  CONSTRAINT [FK_ClientesClientesDemo_Clientes] FOREIGN KEY([ClientesID])
REFERENCES [dbo].[G1Clientes] ([ClientesID])
GO
ALTER TABLE [dbo].[G1ClientesClientesDemo] CHECK CONSTRAINT [FK_ClientesClientesDemo_Clientes]
GO
ALTER TABLE [dbo].[G1DetallesOrdenes]  WITH NOCHECK ADD  CONSTRAINT [FK_DetallesOrdenes_Orden] FOREIGN KEY([OrdenID])
REFERENCES [dbo].[G1Orden] ([OrdenID])
GO
ALTER TABLE [dbo].[G1DetallesOrdenes] CHECK CONSTRAINT [FK_DetallesOrdenes_Orden]
GO
ALTER TABLE [dbo].[G1DetallesOrdenes]  WITH NOCHECK ADD  CONSTRAINT [FK_DetallesOrdenes_Productos] FOREIGN KEY([ProductoID])
REFERENCES [dbo].[G1Productos] ([ProductoID])
GO
ALTER TABLE [dbo].[G1DetallesOrdenes] CHECK CONSTRAINT [FK_DetallesOrdenes_Productos]
GO
ALTER TABLE [dbo].[G1Empleados]  WITH NOCHECK ADD  CONSTRAINT [FK_Empleados_Empleados] FOREIGN KEY([ReportarA])
REFERENCES [dbo].[G1Empleados] ([EmpleadoID])
GO
ALTER TABLE [dbo].[G1Empleados] CHECK CONSTRAINT [FK_Empleados_Empleados]
GO
ALTER TABLE [dbo].[G1Empleados]  WITH NOCHECK ADD  CONSTRAINT [FK_G1Empleados_G1Empleados] FOREIGN KEY([EmpleadoID])
REFERENCES [dbo].[G1Empleados] ([EmpleadoID])
GO
ALTER TABLE [dbo].[G1Empleados] CHECK CONSTRAINT [FK_G1Empleados_G1Empleados]
GO
ALTER TABLE [dbo].[G1Orden]  WITH NOCHECK ADD  CONSTRAINT [FK_Orden_Clientes] FOREIGN KEY([ClienteID])
REFERENCES [dbo].[G1Clientes] ([ClientesID])
GO
ALTER TABLE [dbo].[G1Orden] CHECK CONSTRAINT [FK_Orden_Clientes]
GO
ALTER TABLE [dbo].[G1Orden]  WITH NOCHECK ADD  CONSTRAINT [FK_Orden_Empleados] FOREIGN KEY([EmpleadoID])
REFERENCES [dbo].[G1Empleados] ([EmpleadoID])
GO
ALTER TABLE [dbo].[G1Orden] CHECK CONSTRAINT [FK_Orden_Empleados]
GO
ALTER TABLE [dbo].[G1Orden]  WITH NOCHECK ADD  CONSTRAINT [FK_Orden_Transportistas] FOREIGN KEY([EnvioVia])
REFERENCES [dbo].[G1Transportistas] ([TransportistasID])
GO
ALTER TABLE [dbo].[G1Orden] CHECK CONSTRAINT [FK_Orden_Transportistas]
GO
ALTER TABLE [dbo].[G1Productos]  WITH NOCHECK ADD  CONSTRAINT [FK_Productos_Categorias] FOREIGN KEY([CategoriaID])
REFERENCES [dbo].[G1Categorias] ([CategoriasID])
GO
ALTER TABLE [dbo].[G1Productos] CHECK CONSTRAINT [FK_Productos_Categorias]
GO
ALTER TABLE [dbo].[G1Productos]  WITH NOCHECK ADD  CONSTRAINT [FK_Productos_Proveedores] FOREIGN KEY([ProveedorID])
REFERENCES [dbo].[G1Proveedores] ([ProveedoresID])
GO
ALTER TABLE [dbo].[G1Productos] CHECK CONSTRAINT [FK_Productos_Proveedores]
GO
ALTER TABLE [dbo].[G1Territorios]  WITH NOCHECK ADD  CONSTRAINT [FK_Territorios_Region] FOREIGN KEY([RegionID])
REFERENCES [dbo].[G1Region] ([RegionID])
GO
ALTER TABLE [dbo].[G1Territorios] CHECK CONSTRAINT [FK_Territorios_Region]
GO
ALTER TABLE [dbo].[G1TerritoriosEmpleados]  WITH NOCHECK ADD  CONSTRAINT [FK_TerritoriosEmpleados_Empleados] FOREIGN KEY([EmpleadoID])
REFERENCES [dbo].[G1Empleados] ([EmpleadoID])
GO
ALTER TABLE [dbo].[G1TerritoriosEmpleados] CHECK CONSTRAINT [FK_TerritoriosEmpleados_Empleados]
GO
ALTER TABLE [dbo].[G1TerritoriosEmpleados]  WITH NOCHECK ADD  CONSTRAINT [FK_TerritoriosEmpleados_Territorios] FOREIGN KEY([TerritorioID])
REFERENCES [dbo].[G1Territorios] ([TerritorioID])
GO
ALTER TABLE [dbo].[G1TerritoriosEmpleados] CHECK CONSTRAINT [FK_TerritoriosEmpleados_Territorios]
GO
USE [master]
GO
ALTER DATABASE [G1Northwind] SET  READ_WRITE 
GO
