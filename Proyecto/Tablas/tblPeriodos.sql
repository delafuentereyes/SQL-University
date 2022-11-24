USE ProyectoProgra4
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Periodos](
    [Id_Periodo] [int] IDENTITY(1,1) NOT NULL,
    [Tipo_Periodo] VARCHAR (20),
    [Id_A�o] [int] NULL,
PRIMARY KEY CLUSTERED 
(
    [Id_Periodo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Periodos]  WITH CHECK ADD  CONSTRAINT [FK_Id_A�o] FOREIGN KEY([Id_A�o])
REFERENCES [dbo].[A�o] ([Id_A�o])
GO
ALTER TABLE [dbo].[Periodos] CHECK CONSTRAINT [FK_Id_A�o]
GO

SET IDENTITY_INSERT [dbo].[Periodos] ON;
GO

INSERT INTO [dbo].[Periodos] ( [Id_Periodo], Tipo_Periodo, [Id_A�o])
VALUES
      (1, 'Cuatrimestre', 1),
      (2, 'Bimestre', 2),
      (3, 'Trimestre', 3)
GO

SELECT * FROM [dbo].[Periodos]