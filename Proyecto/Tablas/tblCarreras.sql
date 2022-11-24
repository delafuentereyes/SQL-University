USE ProyectoProgra4
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carreras](
    [Id_Carrera] [int] IDENTITY(1,1) NOT NULL,
    [Codigo] [varchar](10) NULL,
    [Nombre] [varchar](200) NULL,
    [Id_TipoCarrera] [int] NULL,
PRIMARY KEY CLUSTERED 
(
    [Id_Carrera] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Carreras]  WITH CHECK ADD  CONSTRAINT [FK_Id_TipoCarrera] FOREIGN KEY([Id_TipoCarrera])
REFERENCES [dbo].[Tipo_Carrera] ([Id_TipoCarrera])
GO
ALTER TABLE [dbo].[Carreras] CHECK CONSTRAINT [FK_Id_TipoCarrera]
GO

SET IDENTITY_INSERT [dbo].[Carreras] ON;
GO

INSERT INTO [dbo].[Carreras](Id_Carrera, Codigo, Nombre, Id_TipoCarrera)
VALUES
	(1, 'IG01256', 'Ingeniería en Informática', 1),
	(2, 'AD01223', 'Administración de Aduanas', 1),
	(3, 'DE0154', 'Derecho', 1),
	(4, 'CO02002', 'Contaduría', 1),
	(5, 'AN01002', 'Administración de Negocios', 1),
	(6, 'LC0123', 'Licenciatura en Contaduría Pública', 2),
	(7, 'LD0456', 'Licenciatura en Derecho', 2),
	(8, 'LAA789', 'Licenciatura en Administración de Aduanas', 2),
	(9, 'LED2598', 'Licenciatura en Ciencias de la Educación con énfasis en Docencia', 2),
	(10, 'CO01002', 'Licenciatura en Gerencia de RRHH', 2),
	(11, 'TM0123', 'Taller de Merceologia', 3),
	(12, 'POS0333', 'Programa en Oralidad y Simulación de Juicios', 3),
	(13, 'PCP789', 'Programa Conversacional de Portuges', 3),
	(14, 'PCI2598', 'Programa Conversacional de Inglés', 3),
	(15, 'PT01902', 'Prueba de TOIC', 3),
	(16, 'ESD2020', 'Especialidad en Docencia Universitaria', 4),
	(17, 'MAN0103', 'Maestría en Administración de Negocios', 4),
	(18, 'MAE2509', 'Maestría en Administración Educativa', 4),
	(19, 'MTH789', 'Maestría en Administración de Negocios con énfasis en Desarrollo del Talento Humano', 4),
	(20, 'MABF25', 'Maestria en Administración de Negocios con énfasis en Banca y Finanzas', 4),
	(21, 'DI0123', 'Diplomado Ingeniería en Informática', 5),
	(22, 'DAA0333', 'Diplomado Administracion de Aduanas', 5),
	(23, 'DD789', 'Diplomado Derecho', 5),
	(24, 'DC2598', 'Diplomado Contaduría', 5),
	(25, 'DAN01902', 'Diplomado Administración de Negocios', 5)
GO

SELECT * FROM [dbo].[Carreras]
