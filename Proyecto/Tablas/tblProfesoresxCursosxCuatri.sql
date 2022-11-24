USE ProyectoProgra4
GO

CREATE TABLE [dbo].[ProfesoresxCursosxCuatri](
    [Id_PCC] [int] IDENTITY(1,1) NOT NULL,
    [Id_Profesor] [int] NULL,
    [Id_Curso] [int] NULL,
    [Id_Periodo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
    [Id_PCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ProfesoresxCursosxCuatri]  WITH CHECK ADD  CONSTRAINT [FK_Id_Periodo_PCC] FOREIGN KEY([Id_Periodo])
REFERENCES [dbo].[Periodos] ([Id_Periodo])
GO
ALTER TABLE [dbo].[ProfesoresxCursosxCuatri] CHECK CONSTRAINT [FK_Id_Periodo_PCC]
GO
ALTER TABLE [dbo].[ProfesoresxCursosxCuatri]  WITH CHECK ADD  CONSTRAINT [FK_Id_Curso_PCC] FOREIGN KEY([Id_Curso])
REFERENCES [dbo].[Cursos] ([Id_Curso])
GO
ALTER TABLE [dbo].[ProfesoresxCursosxCuatri] CHECK CONSTRAINT [FK_Id_Curso_PCC]
GO
ALTER TABLE [dbo].[ProfesoresxCursosxCuatri]  WITH CHECK ADD  CONSTRAINT [FK_Id_Profesor_PCC] FOREIGN KEY([Id_Profesor])
REFERENCES [dbo].[Profesores] ([Id_Profesor])
GO
ALTER TABLE [dbo].[ProfesoresxCursosxCuatri] CHECK CONSTRAINT [FK_Id_Profesor_PCC]
GO


SET IDENTITY_INSERT [dbo].[ProfesoresxCursosxCuatri] ON;
GO

SELECT * FROM ProfesoresxCursosxCuatri
GO

INSERT INTO [dbo].[ProfesoresxCursosxCuatri](Id_PCC, Id_Profesor, Id_Curso, Id_Periodo)
VALUES
	(1, 1, 4, 1),
	(2, 2, 5, 2),
	(3, 3, 6, 3),
	(4, 1, 7, 1),
	(5, 1, 8, 2),
	(6, 1, 9, 3),
	(7, 2, 10, 1),
	(8, 2, 11, 2),
	(9, 1, 12, 3),
	(10, 3, 13, 1),
	(11, 4, 14, 2),
	(12, 4, 15, 3),
	(13, 1, 16, 1),
	(14, 1, 17, 2),
	(15, 5, 18, 3),
	(16, 1, 19, 1),
	(17, 3, 20, 2),
	(18, 4, 21, 3),
	(19, 4, 22, 1),
	(20, 1, 23, 2)
GO