USE ProyectoProgra4
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Cursos](
    [Id_Curso] [int] IDENTITY(1,1) NOT NULL,
    [Nombre] [varchar](50) NULL,
    [Id_Profesor] [int] NULL,
    [Id_Carrera1] [int] NOT NULL,
    [Id_Carrera2] [int] NULL,
    [Id_Carrera3] [int] NULL,
    [Codigo_Curso] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
    [Id_Curso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Cursos]  WITH CHECK ADD  CONSTRAINT [FK_Id_Carrera_Cursos1] FOREIGN KEY([Id_Carrera1])
REFERENCES [dbo].[Carreras] ([Id_Carrera])
GO

ALTER TABLE [dbo].[Cursos] CHECK CONSTRAINT [FK_Id_Carrera_Cursos1]
GO

ALTER TABLE [dbo].[Cursos]  WITH CHECK ADD  CONSTRAINT [FK_Id_Carrera_Cursos2] FOREIGN KEY([Id_Carrera2])
REFERENCES [dbo].[Carreras] ([Id_Carrera])
GO

ALTER TABLE [dbo].[Cursos] CHECK CONSTRAINT [FK_Id_Carrera_Cursos2]
GO

ALTER TABLE [dbo].[Cursos]  WITH CHECK ADD  CONSTRAINT [FK_Id_Carrera_Cursos3] FOREIGN KEY([Id_Carrera3])
REFERENCES [dbo].[Carreras] ([Id_Carrera])
GO

ALTER TABLE [dbo].[Cursos] CHECK CONSTRAINT [FK_Id_Carrera_Cursos3]
GO

ALTER TABLE [dbo].[Cursos]  WITH CHECK ADD  CONSTRAINT [FK_Id_Profesor_Cursos] FOREIGN KEY([Id_Profesor])
REFERENCES [dbo].[Profesores] ([Id_Profesor])
GO

ALTER TABLE [dbo].[Cursos] CHECK CONSTRAINT [FK_Id_Profesor_Cursos]
GO


SET IDENTITY_INSERT [dbo].[Cursos] ON;
GO

INSERT INTO [dbo].[Cursos] (Id_Curso, Nombre, Id_Profesor, Id_Carrera1, Id_Carrera2, Id_Carrera3, Codigo_Curso) 
VALUES
	(1, 'Ingl�s 1', 1, 1, 2, 3, 'LM1016'),
	(2, 'Ingl�s 2', 1, 1, 2, 3, 'LM4016'),
	(3, 'Ingl�s 3', 1, 1, 2, 3, 'LM2024'),
	(4, 'Ingl�s 4', 1, 1, 2, 3, 'LM2044'),
	(5, 'Ingl�s 5', 1, 1, 2, 3, 'LM2063'),
	(6, 'Introducci�n a la Programaci�n', 3, 1, NULL, NULL, 'IN1013'),
	(7, 'Programaci�n 1', 3, 1, NULL, NULL, 'IN1024'),
	(8, 'Programaci�n 2', 4, 1, NULL, NULL, 'IN1032'),
	(9, 'Programaci�n 3', 4, 1, NULL, NULL, 'IN1048'),
	(10, 'Programaci�n 4', 4, 1, NULL, NULL, 'IN3032'),
	(11, 'Programaci�n 5', 4, 1, NULL, NULL, 'IN1013'),
	(12, 'Programaci�n 6', 4, 1, NULL, NULL, 'IN3114'),
	(13, 'Informes y Presentaciones', 2, 1, 2, 3, 'EG1015'),
	(14, '�tica Profesional', 2, 1, 2, 3, 'EG2023'),
	(15, 'Bases de Datos 1', 9, 1, 2, 3, 'IN4013'),
	(16, 'Bases de Datos 2', 4, 1, NULL, NULL, 'IN4024'),
	(17, 'Estructura de Datos', 5, 1, NULL, NULL, 'IN2064'),
	(18, 'Arquitectura de Computadoras', 5, 1, NULL, NULL, 'IN3017'),
	(19, 'Matem�tica General', 6, 1, 2, 3, 'MA1012'),
	(20, 'Matem�ticas Discretas 1', 6, 1, 2, 3, 'MA1024'),
	(21, 'Matem�ticas Discretas 2', 6, 1, 2, 3, 'MA2035'),
	(22, 'C�lculo Diferencial e Integral', 7, 1, 2, 3, 'MA2025'),
	(23, '�lgebra Lineal y Combinatoria', 7, 1, 2, 3, 'MA2054'),
	(24, 'Estad�stica 1', 8, 1, 2, 3, 'ES1014'),
	(25, 'Finanzas Personales', 8, 1, 2, 3, 'AD1017'),
	(26, 'Contabilidad 1', 8, 1, 2, 3, 'CO1014'),
	(27, 'Formulaci�n y Evaluaci�n de Proyectos', 1, 1, NULL, NULL, 'IN3144'),
	(28, 'El Emprendedor y la Creaci�n de Empresas', 7, 1, 2, 3, 'AD1016'),
	(29, 'An�lisis y Dise�o de Sistemas', 5, 1, NULL, NULL, 'IN3063'),
	(30, 'Redes de Computadora 1', 5, 1, NULL, NULL, 'IN4035'),
	(31, 'Redes de Computadora 2', 5, 1, NULL, NULL, 'IN4064'),
	(32, 'Sistemas Operativos', 9, 1, NULL, NULL, 'IN3084'),
	(33, 'Auditor�a de Sistemas', 9, 1, NULL, NULL, 'IN3124'),
	(34, 'Ingenier�a del Software', 3, 1, NULL, NULL, 'IN4074')
GO

UPDATE [dbo].[Cursos]  
    SET Id_Profesor = 3 
    WHERE Id_Curso = 27
GO

SELECT * FROM Cursos