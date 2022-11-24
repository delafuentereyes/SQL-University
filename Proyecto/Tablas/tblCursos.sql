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
	(1, 'Inglés 1', 1, 1, 2, 3, 'LM1016'),
	(2, 'Inglés 2', 1, 1, 2, 3, 'LM4016'),
	(3, 'Inglés 3', 1, 1, 2, 3, 'LM2024'),
	(4, 'Inglés 4', 1, 1, 2, 3, 'LM2044'),
	(5, 'Inglés 5', 1, 1, 2, 3, 'LM2063'),
	(6, 'Introducción a la Programación', 3, 1, NULL, NULL, 'IN1013'),
	(7, 'Programación 1', 3, 1, NULL, NULL, 'IN1024'),
	(8, 'Programación 2', 4, 1, NULL, NULL, 'IN1032'),
	(9, 'Programación 3', 4, 1, NULL, NULL, 'IN1048'),
	(10, 'Programación 4', 4, 1, NULL, NULL, 'IN3032'),
	(11, 'Programación 5', 4, 1, NULL, NULL, 'IN1013'),
	(12, 'Programación 6', 4, 1, NULL, NULL, 'IN3114'),
	(13, 'Informes y Presentaciones', 2, 1, 2, 3, 'EG1015'),
	(14, 'Ética Profesional', 2, 1, 2, 3, 'EG2023'),
	(15, 'Bases de Datos 1', 9, 1, 2, 3, 'IN4013'),
	(16, 'Bases de Datos 2', 4, 1, NULL, NULL, 'IN4024'),
	(17, 'Estructura de Datos', 5, 1, NULL, NULL, 'IN2064'),
	(18, 'Arquitectura de Computadoras', 5, 1, NULL, NULL, 'IN3017'),
	(19, 'Matemática General', 6, 1, 2, 3, 'MA1012'),
	(20, 'Matemáticas Discretas 1', 6, 1, 2, 3, 'MA1024'),
	(21, 'Matemáticas Discretas 2', 6, 1, 2, 3, 'MA2035'),
	(22, 'Cálculo Diferencial e Integral', 7, 1, 2, 3, 'MA2025'),
	(23, 'Álgebra Lineal y Combinatoria', 7, 1, 2, 3, 'MA2054'),
	(24, 'Estadística 1', 8, 1, 2, 3, 'ES1014'),
	(25, 'Finanzas Personales', 8, 1, 2, 3, 'AD1017'),
	(26, 'Contabilidad 1', 8, 1, 2, 3, 'CO1014'),
	(27, 'Formulación y Evaluación de Proyectos', 1, 1, NULL, NULL, 'IN3144'),
	(28, 'El Emprendedor y la Creación de Empresas', 7, 1, 2, 3, 'AD1016'),
	(29, 'Análisis y Diseño de Sistemas', 5, 1, NULL, NULL, 'IN3063'),
	(30, 'Redes de Computadora 1', 5, 1, NULL, NULL, 'IN4035'),
	(31, 'Redes de Computadora 2', 5, 1, NULL, NULL, 'IN4064'),
	(32, 'Sistemas Operativos', 9, 1, NULL, NULL, 'IN3084'),
	(33, 'Auditoría de Sistemas', 9, 1, NULL, NULL, 'IN3124'),
	(34, 'Ingeniería del Software', 3, 1, NULL, NULL, 'IN4074')
GO

UPDATE [dbo].[Cursos]  
    SET Id_Profesor = 3 
    WHERE Id_Curso = 27
GO

SELECT * FROM Cursos