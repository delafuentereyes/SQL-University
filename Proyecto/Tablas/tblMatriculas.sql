USE ProyectoProgra4
GO

CREATE TABLE [dbo].[Matriculas](
    [Id_Matricula] [int] IDENTITY(1,1) NOT NULL,
    [Id_Estudiante] [int] NULL,
    [Id_Curso] [int] NULL,
    [Id_Periodo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
    [Id_Matricula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Matriculas]  WITH CHECK ADD  CONSTRAINT [FK_Id_Periodo_Matriculas] FOREIGN KEY([Id_Periodo])
REFERENCES [dbo].[Periodos] ([Id_Periodo])
GO
ALTER TABLE [dbo].[Matriculas] CHECK CONSTRAINT [FK_Id_Periodo_Matriculas]
GO
ALTER TABLE [dbo].[Matriculas]  WITH CHECK ADD  CONSTRAINT [FK_Id_Curso_Matriculas] FOREIGN KEY([Id_Curso])
REFERENCES [dbo].[Cursos] ([Id_Curso])
GO
ALTER TABLE [dbo].[Matriculas] CHECK CONSTRAINT [FK_Id_Curso_Matriculas]
GO
ALTER TABLE [dbo].[Matriculas]  WITH CHECK ADD  CONSTRAINT [FK_Id_Estudiante_Matriculas] FOREIGN KEY([Id_Estudiante])
REFERENCES [dbo].[Estudiantes] ([Id_Estudiante])
GO
ALTER TABLE [dbo].[Matriculas] CHECK CONSTRAINT [FK_Id_Estudiante_Matriculas]
GO

SET IDENTITY_INSERT [dbo].[Matriculas] ON;
GO

SELECT * FROM Matriculas

 INSERT INTO [dbo].[Matriculas] ([Id_Matricula], [Id_Estudiante], [Id_Curso], [Id_Periodo])
 VALUES 
	  (1, 1, 1, 1),
	  (2, 1, 2, 2),
	  (3, 1, 3, 3),
	  (4, 1, 4, 1),
	  (5, 1, 5, 2),
	  (6, 1, 6, 3),
	  (7, 1, 7, 1),
	  (8, 1, 8, 2),
	  (9, 1, 9, 3),
	  (10, 2, 10, 1),
	  (11, 2, 11, 2),
	  (12, 2, 12, 3),
	  (13, 2, 13, 1),
	  (14, 2, 14, 2),
	  (15, 2, 15, 3),
	  (16, 2, 16, 1),
	  (17, 2, 17, 2),
	  (18, 2, 18, 3),
	  (19, 2, 19, 1),
	  (20, 2, 20, 2),
	  (21, 2, 21, 3),
	  (22, 2, 22, 1),
	  (23, 2, 23, 2),
	  (24, 2, 24, 3),
	  (25, 3, 25, 1),
	  (26, 3, 26, 2),
	  (27, 3, 27, 3),
	  (28, 3, 28, 1),
	  (29, 3, 29, 2),
	  (30, 3, 30, 3),
	  (31, 3, 31, 1),
	  (32, 3, 32, 2),
	  (33, 3, 33, 3),
	  (34, 3, 34, 1),
	  (35, 3, 1, 2),
	  (36, 3, 2, 3),
	  (37, 4, 3, 1),
	  (38, 4, 4, 2),
	  (39, 4, 5, 3),
	  (40, 4, 6, 1),
	  (41, 4, 7, 2),
	  (42, 4, 8, 3),
	  (43, 4, 9, 1),
	  (44, 4, 10, 2),
	  (45, 4, 11, 3),
	  (46, 4, 12, 1),
	  (47, 4, 13, 2),
	  (48, 4, 14, 3),
	  (49, 5, 15, 1),
	  (50, 5, 16, 2),
	  (51, 5, 17, 3),
	  (52, 5, 18, 1),
	  (53, 5, 19, 2),
	  (54, 5, 20, 3),
	  (55, 5, 21, 1),
	  (56, 5, 22, 2),
	  (57, 5, 23, 3),
	  (58, 5, 24, 1),
	  (59, 5, 25, 2),
	  (60, 5, 26, 3),
	  (61, 6, 27, 1),
	  (62, 6, 27, 2),
	  (63, 6, 27, 3),
	  (64, 6, 27, 1),
	  (65, 6, 27, 2),
	  (66, 6, 27, 3),
	  (67, 6, 27, 1),
	  (68, 6, 27, 2),
	  (69, 6, 27, 3),
	  (70, 6, 27, 1),
	  (71, 6, 27, 2),
	  (72, 6, 27, 3),
	  (73, 7, 28, 1),
	  (74, 7, 29, 2),
	  (75, 7, 30, 3),
	  (76, 7, 31, 1),
	  (77, 7, 32, 2),
	  (78, 7, 33, 3),
	  (79, 7, 34, 1),
	  (80, 7, 1, 2),
	  (81, 7, 2, 3),
	  (82, 7, 3, 1),
	  (83, 7, 4, 2),
	  (84, 7, 5, 3),
	  (85, 8, 6, 1),
	  (86, 8, 7, 2),
	  (87, 8, 8, 3),
	  (88, 8, 9, 1),
	  (89, 8, 10, 2),
	  (90, 8, 11, 3),
	  (91, 8, 12, 1),
	  (92, 8, 13, 2),
	  (93, 8, 14, 3),
	  (94, 8, 15, 1),
	  (95, 8, 16, 2),
	  (96, 8, 17, 3),
	  (97, 3, 28, 1),
	  (98, 9, 18, 2),
	  (99, 10, 20, 3),
	  (100, 11, 25, 1),
	  (101, 12, 34, 2)
GO