USE ProyectoProgra4
GO

CREATE TABLE [dbo].[Notas](
    [Id_Nota] [int] IDENTITY(1,1) NOT NULL,
    [Nota] [decimal](18, 0) NULL,
    [Estado] [varchar](15) NULL,
    [Id_Matricula] [int] NULL,
PRIMARY KEY CLUSTERED 
(
    [Id_Nota] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Notas]  WITH CHECK ADD  CONSTRAINT [FK_Id_Matricula_Notas] FOREIGN KEY([Id_Matricula])
REFERENCES [dbo].[Matriculas] ([Id_Matricula])
GO
ALTER TABLE [dbo].[Notas] CHECK CONSTRAINT [FK_Id_Matricula_Notas]
GO

SET IDENTITY_INSERT [dbo].[Notas] ON;
GO

SELECT * FROM Notas

INSERT INTO [dbo].[Notas]([Id_Nota], [Nota], [Estado], [Id_Matricula])
VALUES
	(1, 100, 'Aprobado', 1),
    (2, 100, 'Aprobado', 2),
    (3, 100,'Aprobado', 3),
    (4, 90, 'Aprobado', 4),
    (5, 0, 'En curso', 5),
    (6, 0, 'En curso', 6),
    (7, 0, 'En curso', 7),
    (8, 80, 'Aprobado', 8),
    (9, 89, 'Aprobado', 9),
    (10, 75, 'Aprobado', 10),
    (11, 95, 'Aprobado', 11),
    (12, 0, 'En curso', 12),
    (13, 97, 'Aprobado', 13),
    (14, 81, 'Aprobado', 14),
    (15, 100, 'Aprobado', 15),
    (16, 100, 'Aprobado', 16),
    (17, 94, 'Aprobado', 17),
    (18, 86, 'Aprobado', 18),
    (19, 99, 'Aprobado', 19),
    (20, 62, 'Reprobado', 20),
    (21, 97, 'Aprobado', 21),
    (22, 0, 'En curso', 22),
    (23, 72, 'Aprobado', 23),
    (24, 73, 'Aprobado', 24),
    (25, 78, 'Aprobado', 25),
    (26, 79, 'Aprobado', 26),
    (27, 80, 'Aprobado', 27),
    (28, 90, 'Aprobado', 28),
    (29, 0, 'En curso', 29),
    (30, 65, 'Reprobado', 30),
    (31, 100, 'Aprobado', 31),
    (32, 76, 'Aprobado', 32),
    (33, 78, 'Aprobado', 33),
    (34, 100, 'Aprobado', 34),
    (35, 100, 'Aprobado', 35),
    (36, 100, 'Aprobado', 36),
    (37, 99, 'Aprobado', 37),
    (38, 90, 'Aprobado', 38),
    (39, 80, 'Aprobado', 39),
    (40, 98, 'Aprobado', 40),
    (41, 89, 'Aprobado', 41),
    (42, 98, 'Aprobado', 42),
    (43, 76, 'Aprobado', 43),
    (44, 87, 'Aprobado', 44),
    (45, 75, 'Aprobado', 45),
    (46, 79, 'Aprobado', 46),
    (47, 73, 'Aprobado', 47),
    (48, 72, 'Aprobado', 48),
    (49, 78, 'Aprobado', 49),
    (50, 0, 'En curso', 50),
    (51, 100, 'Aprobado', 51),
    (52, 40, 'Reprobado', 52),
    (53, 100, 'Aprobado', 53),
    (54, 100, 'Aprobado', 54),
    (55, 100, 'Aprobado', 55),
    (56, 100, 'Aprobado', 56),
    (57, 90, 'Aprobado', 57),
    (58, 98, 'Aprobado', 58),
    (59, 91, 'Aprobado', 59),
    (60, 95,'Aprobado' , 60),
    (61, 98, 'Aprobado', 61),
    (62, 94, 'Aprobado', 62),
    (63, 92, 'Aprobado', 63),
    (64, 75, 'Aprobado', 64),
    (65, 75, 'Aprobado', 65),
    (66, 0, 'En curso', 66),
    (67, 71, 'Aprobado', 67),
    (68, 70, 'Aprobado', 68),
    (69, 76, 'Aprobado', 69),
    (70, 76, 'Aprobado', 70),
    (71, 68, 'Reprobado', 71),
    (72, 78, 'Aprobado', 72),
    (73, 79, 'Aprobado', 73),
    (74, 79, 'Aprobado', 74),
    (75, 78, 'Aprobado', 75),
    (76, 77, 'Aprobado', 76),
    (77, 76, 'Aprobado', 77),
    (78, 74, 'Aprobado', 78),
    (79, 73, 'Aprobado', 79),
    (80, 74, 'Aprobado', 80),
    (81, 72, 'Aprobado', 81),
    (82, 71, 'Aprobado', 82),
    (83, 79, 'Aprobado', 83),
    (84, 78, 'Aprobado', 84),
    (85, 89, 'Aprobado', 85),
    (86, 89, 'Aprobado', 86),
    (87, 89, 'Aprobado', 87),
    (88, 87, 'Aprobado', 88),
    (89, 87, 'Aprobado', 89),
    (90, 86, 'Aprobado', 90),
    (91, 86, 'Aprobado', 91),
    (92, 84, 'Aprobado', 92),
    (93, 83, 'Aprobado', 93),
    (94, 83, 'Aprobado', 94),
    (95, 83, 'Aprobado', 95),
    (96, 88, 'Aprobado', 96),
    (97, 97, 'Aprobado', 97),
    (98, 90, 'Aprobado', 98),
    (99, 89, 'Aprobado', 99),
    (100, 54, 'Reprobado', 100),
    (101, 100, 'Aprobado', 101)
GO
