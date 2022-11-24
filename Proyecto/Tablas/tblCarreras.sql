USE ProyectoProgra4
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carreras](
�� �[Id_Carrera] [int] IDENTITY(1,1) NOT NULL,
�� �[Codigo] [varchar](10) NULL,
�� �[Nombre] [varchar](200) NULL,
�� �[Id_TipoCarrera] [int] NULL,
PRIMARY KEY CLUSTERED�
(
�� �[Id_Carrera] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Carreras] �WITH CHECK ADD �CONSTRAINT [FK_Id_TipoCarrera] FOREIGN KEY([Id_TipoCarrera])
REFERENCES [dbo].[Tipo_Carrera] ([Id_TipoCarrera])
GO
ALTER TABLE [dbo].[Carreras] CHECK CONSTRAINT [FK_Id_TipoCarrera]
GO

SET IDENTITY_INSERT [dbo].[Carreras] ON;
GO

INSERT INTO [dbo].[Carreras](Id_Carrera, Codigo, Nombre, Id_TipoCarrera)
VALUES
	(1, 'IG01256', 'Ingenier�a en Inform�tica', 1),
	(2, 'AD01223', 'Administraci�n de Aduanas', 1),
	(3, 'DE0154', 'Derecho', 1),
	(4, 'CO02002', 'Contadur�a', 1),
	(5, 'AN01002', 'Administraci�n de Negocios', 1),
	(6, 'LC0123', 'Licenciatura en Contadur�a P�blica', 2),
	(7, 'LD0456', 'Licenciatura en Derecho', 2),
	(8, 'LAA789', 'Licenciatura en Administraci�n de Aduanas', 2),
	(9, 'LED2598', 'Licenciatura en Ciencias de la Educaci�n con �nfasis en Docencia', 2),
	(10, 'CO01002', 'Licenciatura en Gerencia de RRHH', 2),
	(11, 'TM0123', 'Taller de Merceologia', 3),
	(12, 'POS0333', 'Programa en Oralidad y Simulaci�n de Juicios', 3),
	(13, 'PCP789', 'Programa Conversacional de Portuges', 3),
	(14, 'PCI2598', 'Programa Conversacional de Ingl�s', 3),
	(15, 'PT01902', 'Prueba de TOIC', 3),
	(16, 'ESD2020', 'Especialidad en Docencia Universitaria', 4),
	(17, 'MAN0103', 'Maestr�a en Administraci�n de Negocios', 4),
	(18, 'MAE2509', 'Maestr�a en Administraci�n Educativa', 4),
	(19, 'MTH789', 'Maestr�a en Administraci�n de Negocios con �nfasis en Desarrollo del Talento Humano', 4),
	(20, 'MABF25', 'Maestria en Administraci�n de Negocios con �nfasis en Banca y Finanzas', 4),
	(21, 'DI0123', 'Diplomado Ingenier�a en Inform�tica', 5),
	(22, 'DAA0333', 'Diplomado Administracion de Aduanas', 5),
	(23, 'DD789', 'Diplomado Derecho', 5),
	(24, 'DC2598', 'Diplomado Contadur�a', 5),
	(25, 'DAN01902', 'Diplomado Administraci�n de Negocios', 5)
GO

SELECT * FROM [dbo].[Carreras]
