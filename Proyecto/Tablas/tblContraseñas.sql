USE ProyectoProgra4
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contraseñas](
    [Id_Contraseña] [int] IDENTITY(1,1) NOT NULL,
    [Contra] [varchar](10) NULL,
    [Id_Usuario] [int] NULL,
PRIMARY KEY CLUSTERED 
(
    [Id_Contraseña] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Contraseñas]  WITH CHECK ADD  CONSTRAINT [FK_Id_Usuario_password] FOREIGN KEY([Id_Usuario])
REFERENCES [dbo].[Usuarios] ([Id_Usuario])
GO
ALTER TABLE [dbo].[Contraseñas] CHECK CONSTRAINT [FK_Id_Usuario_password]
GO

SET IDENTITY_INSERT [dbo].[Contraseñas] ON;
GO

INSERT INTO [dbo].Contraseñas(Id_Contraseña, Contra, Id_Usuario)
VALUES 
	(1, 'E1000', 1),
	(2, 'A2000', 2),
	(3, 'E3000', 3),
	(4, 'Y2425', 4),
	(5, 'A1843', 5),
	(6, 'L0857', 6),
	(7, 'F0202', 7),
	(8, 'L1645', 8),
	(9, 'J4900', 9),
	(10, 'R1134', 10),
	(11, 'L1155', 11),
	(12, 'C9804', 12),
	(13, 'J9090', 13),
	(14, 'G0000', 14),
	(15, 'C6060', 15),
	(16, 'D7179', 16),
	(17, 'M2611', 17),
	(18, 'S6291', 18),
	(19, 'B5582', 19),
	(20, 'A3817', 20)
GO

SELECT * FROM [dbo].Contraseñas
GO

