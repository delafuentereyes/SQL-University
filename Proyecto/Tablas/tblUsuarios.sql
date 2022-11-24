USE ProyectoProgra4
GO

CREATE TABLE [dbo].[Usuarios](
    [Id_Usuario] [int] IDENTITY(1,1) NOT NULL,
    [Nombre] [varchar](100) NULL,
    [Cedula] [varchar](20) NULL,
    [Correo] [varchar](100) NULL,
PRIMARY KEY CLUSTERED
(
    [Id_Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET IDENTITY_INSERT [dbo].[Usuarios] ON;
GO

INSERT INTO [dbo].[Usuarios] (Id_Usuario, Nombre, Cedula, Correo) 
VALUES 
	(1, 'Enrique Villalobos', '1-1843-0197', '118430197@castrocarazo.ac.cr'),
	(2, 'Ana Solis', '1-1843-0198', '118430198@castrocarazo.ac.cr'),
	(3, 'Elena Vargas', '1-0857-0164', '108570164@castrocarazo.ac.cr'),
	(4, 'Yeison Delgado', '1-0953-6458', '109536458@castrocarazo.ac.cr'),
	(5, 'Anthony Fallas', '1-0519-1033', '105191033@castrocarazo.ac.cr'),
	(6, 'Leandro Vargas', '1-1829-1810', '118291810@castrocarazo.ac.cr'),
	(7, 'Francisco Delgado', '1-1852-7211', '118527211@castrocarazo.ac.cr'),
	(8, 'Luis Stuard Madrigal', '1-1799-5498', '117995498@castrocarazo.ac.cr'),
	(9, 'Jorge Castrillo', '1-1877-8228', '118778228@castrocarazo.ac.cr'),
	(10, 'Roberto Vargas', '1-1600-3740', '116003740@castrocarazo.ac.cr'),
	(11, 'Luis Armando', '1-1850-0212', '118500212@castrocarazo.ac.cr'),
	(12, 'Cristina Aguilar', '1-1853-6590', '118536590@castrocarazo.ac.cr'),
	(13, 'Jeinier Gómez', '1-1788-3923', '117883923@castrocarazo.ac.cr'),
	(14, 'Geiner Fernández', '1-1820-7705', '118207705@castrocarazo.ac.cr'),
	(15, 'Carlos Vallecillo', '1-1639-2517', '116392517@castrocarazo.ac.cr'),
	(16, 'Diego Calderón', '1-1601-7222', '116017222@castrocarazo.ac.cr'),
	(17, 'Martín Vargas', '1-1599-4301', '115994301@castrocarazo.ac.cr'),
	(18, 'Steven Fallas', '1-1689-8712', '116898712@castrocarazo.ac.cr'),
	(19, 'Braulio Sandí', '1-1679-6617', '116796617@castrocarazo.ac.cr'),
	(20, 'Alex Sánchez', '1-1601-7371', '116017371@castrocarazo.ac.cr'),
	(21, 'Mauren Abendaño', '1-1623-8152', '116238152@castrocarazo.ac.cr'),
	(22, 'Luis Valverde', '1-1730-4261', '117304261@castrocarazo.ac.cr'),
	(23, 'Cristhian López', '1-1789-7292', '117897292@castrocarazo.ac.cr'),
	(24, 'Jairo Castillo', '1-1721-8126', '117218126@castrocarazo.ac.cr')
GO

SELECT * FROM [dbo].[Usuarios]