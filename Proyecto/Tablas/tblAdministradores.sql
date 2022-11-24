USE ProyectoProgra4
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Administradores](
    [Id_admi] [int] IDENTITY(1,1) NOT NULL,
    [Login] [varchar](100) NULL,
    [Id_Usuario] [int] NULL,
PRIMARY KEY CLUSTERED 
(
    [Id_admi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Administradores]  WITH CHECK ADD  CONSTRAINT [FK_Id_Usuario] FOREIGN KEY([Id_Usuario])
REFERENCES [dbo].[Usuarios] ([Id_Usuario])
GO
ALTER TABLE [dbo].[Administradores] CHECK CONSTRAINT [FK_Id_Usuario]
GO

SET IDENTITY_INSERT [dbo].[Administradores] ON;
GO

INSERT INTO [dbo].[Administradores] (Id_admi, [Login], Id_Usuario) 
VALUES 
	(1, 'Enrique01', 1),
	(2, 'Ana02', 2),
	(3, 'Elena03', 3)
GO

SELECT * FROM [dbo].[Administradores]
GO
