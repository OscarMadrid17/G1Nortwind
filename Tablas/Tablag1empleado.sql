USE [g1northwind]

CREATE TABLE g1empleado(
	[empleadoID] [int] IDENTITY(1,1) NOT NULL,
	[apellido] [varchar](30) NULL,
	[nombre] [varchar](40) NULL,
	[titulo] [varchar](50) NULL,
	[Tcortesia] [varchar](50) NULL,
	[fcumpleaños] [varchar](20) NULL,
	[fcontratacion] [varchar](20) NULL,
	[direccion] [varchar](20) NULL,
	[ciudad] [varchar](15) NULL,
	[region] [char](50) NULL,
	[codigo_postal] [varchar](10) NULL,
	[pais] [varchar](20) NULL,
	[telefono] [int] NULL,
	[extension] [int] NULL,
	[imagen] [image] NULL,
	[nota] [varchar](50) NULL,
	[reporte] [int] NULL,
	[direc_foto] [varchar](100) NULL,
	[salario] [money] NULL,)
