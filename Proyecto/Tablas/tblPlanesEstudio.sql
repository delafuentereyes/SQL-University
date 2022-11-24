USE ProyectoProgra4
GO

CREATE TABLE [dbo].[PlanesEstudio](
    [Id_PlanEstudio] [int] IDENTITY(1,1) NOT NULL,
    [Id_Carrera] [int] NULL,
    [Id_Curso] [int] NULL,
    [Id_Periodo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
    [Id_PlanEstudio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PlanesEstudio]  WITH CHECK ADD  CONSTRAINT [FK_Id_Carrera_Plan] FOREIGN KEY([Id_Carrera])
REFERENCES [dbo].[Carreras] ([Id_Carrera])
GO
ALTER TABLE [dbo].[PlanesEstudio] CHECK CONSTRAINT [FK_Id_Carrera_Plan]
GO
ALTER TABLE [dbo].[PlanesEstudio]  WITH CHECK ADD  CONSTRAINT [FK_Id_Periodo_Plan] FOREIGN KEY([Id_Periodo])
REFERENCES [dbo].[Periodos] ([Id_Periodo])
GO
ALTER TABLE [dbo].[PlanesEstudio] CHECK CONSTRAINT [FK_Id_Periodo_Plan]
GO
ALTER TABLE [dbo].[PlanesEstudio]  WITH CHECK ADD  CONSTRAINT [FK_Id_Curso_Plan] FOREIGN KEY([Id_Curso])
REFERENCES [dbo].[Cursos] ([Id_Curso])
GO
ALTER TABLE [dbo].[PlanesEstudio] CHECK CONSTRAINT [FK_Id_Curso_Plan]
GO


SELECT * FROM PlanesEstudio


SET IDENTITY_INSERT [dbo].[PlanesEstudio] ON;
GO

INSERT INTO [dbo].[PlanesEstudio] ([Id_PlanEstudio], [Id_Carrera], [Id_Curso], [Id_Periodo])
VALUES
	(1, 1, 1, 1),
	(2, 1, 6, 1),
	(3, 1, 13, 1),
	(4, 1, 19, 1),
	(5, 1, 2, 2),
	(6, 1, 7, 2),
	(7, 1, 14, 2),
	(8, 1, 20, 2),
	(9, 1, 3, 3),
	(10, 1, 8, 3),
	(11, 1, 15, 3),
	(12, 1, 17, 3),
	(13, 1, 4, 1),
	(14, 1, 9, 2),
	(15, 1, 18, 3),
	(16, 1, 21, 1),
	(17, 1, 5, 2),
	(18, 1, 10, 3),
	(19, 1, 22, 1),
	(20, 1, 26, 2),
	(21, 1, 11, 3),
	(22, 1, 16, 1),
	(23, 1, 23, 2),
	(24, 1, 24, 3),
	(25, 1, 12, 1),
	(26, 1, 25, 2),
	(27, 1, 27, 3),
	(28, 1,	28, 1),
	(29, 1,	29, 2),
	(30, 1,	30, 3),
	(31, 1,	31, 1),
	(32, 1,	32, 2),
	(33, 1,	33, 3),
	(34, 1,	34, 1),
	(35, 3,	34, 2),
	(36, 3,	34, 3),
	(37, 3, 26, 1),
	(38, 3,	20, 2),
	(39, 3,	21, 3),
	(40, 3,	22, 1),
	(41, 3,	23, 2),
	(42, 4, 20, 3),
	(43, 4, 21, 1),
	(44, 4, 23, 2),
	(45, 4, 24, 3),
	(46, 5, 21, 1),
	(47, 5, 22, 2),
	(48, 5, 23, 3),
	(49, 5, 24, 1),
	(50, 5, 25, 2)
GO