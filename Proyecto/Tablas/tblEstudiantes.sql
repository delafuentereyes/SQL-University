USE ProyectoProgra4
GO

CREATE TABLE [dbo].[Estudiantes](
    [Id_Estudiante] [int] IDENTITY(1,1) NOT NULL,
    [LoginEstudiante] [varchar](50) NULL,
    [Id_Usuario] [int] NULL,
    [Id_Carrera] [int] NULL,
PRIMARY KEY CLUSTERED 
(
    [Id_Estudiante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Estudiantes]  WITH CHECK ADD  CONSTRAINT [FK_Id_Carrera_Estudiantes] FOREIGN KEY([Id_Carrera])
REFERENCES [dbo].[Carreras] ([Id_Carrera])
GO
ALTER TABLE [dbo].[Estudiantes] CHECK CONSTRAINT [FK_Id_Carrera_Estudiantes]
GO
ALTER TABLE [dbo].[Estudiantes]  WITH CHECK ADD  CONSTRAINT [FK_Id_Usuario_Estudiantes] FOREIGN KEY([Id_Usuario])
REFERENCES [dbo].[Usuarios] ([Id_Usuario])
GO
ALTER TABLE [dbo].[Estudiantes] CHECK CONSTRAINT [FK_Id_Usuario_Estudiantes]
GO

SET IDENTITY_INSERT [dbo].[Estudiantes] ON;
GO


INSERT INTO [dbo].Estudiantes (Id_Estudiante, LoginEstudiante, Id_Usuario, Id_Carrera)
VALUES 
	(1, 'Yeison25', 4, 1),
	(2, 'Anthony05', 5, 1),
	(3, 'Lean90', 6, 3),
	(4, 'Franco02', 7, 1),
	(5, 'Luis10', 8, 4),
	(6, 'Jor40', 9, 3),
	(7, 'RVargas17', 10, 2),
	(8, 'LArman13', 11, 2),
	(9, 'Cris98', 12, 5),
	(10, 'Jei100', 13, 5),
	(11, 'Gei00', 14, 4),
	(12, 'CValle60', 15, 3)
GO

SELECT * FROM [dbo].Estudiantes
