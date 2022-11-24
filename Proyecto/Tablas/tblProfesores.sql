USE ProyectoProgra4
GO

CREATE TABLE [dbo].[Profesores](
    [Id_Profesor] [int] IDENTITY(1,1) NOT NULL,
    [LoginProfesor] [varchar](50) NULL,
    [Id_Usuario] [int] NULL,
    [Id_Carrera] [int] NULL,
	[Desempeño] [varchar](20),
PRIMARY KEY CLUSTERED 
(
    [Id_Profesor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Profesores]  WITH CHECK ADD  CONSTRAINT [FK_Id_Carrera_Profesores] FOREIGN KEY([Id_Carrera])
REFERENCES [dbo].[Carreras] ([Id_Carrera])
GO
ALTER TABLE [dbo].[Profesores] CHECK CONSTRAINT [FK_Id_Carrera_Profesores]
GO
ALTER TABLE [dbo].[Profesores]  WITH CHECK ADD  CONSTRAINT [FK_Id_Usuario_Profesores] FOREIGN KEY([Id_Usuario])
REFERENCES [dbo].[Usuarios] ([Id_Usuario])
GO
ALTER TABLE [dbo].[Profesores] CHECK CONSTRAINT [FK_Id_Usuario_Profesores]
GO

SET IDENTITY_INSERT [dbo].[Profesores] ON;
GO


INSERT INTO [dbo].[Profesores] (Id_Profesor, LoginProfesor, Id_Usuario, Id_Carrera, Desempeño) 
VALUES
	(1, 'DiCa01', 16, 1, 'Excelente'),
	(2, 'MaVa01', 17, 1, 'Bueno'),
	(3, 'StFa01', 18, 1, 'Bueno'),
	(4, 'BrSa01', 19, 1, 'Excelente'),
	(5, 'AlSa01', 20, 1, 'Excelente'),
	(6, 'MaAb01', 21, 1, 'Regular'),
	(7, 'LuVa01', 22, 1, 'Malo'),
	(8, 'CrLo01', 23, 1, 'Malo'),
	(9, 'JaCa01', 24, 1, 'Mejorable')
GO

SELECT * FROM [dbo].[Profesores]
