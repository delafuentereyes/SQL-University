USE ProyectoProgra4
GO

CREATE TABLE [dbo].[Tipo_Carrera](
    [Id_TipoCarrera] [int] IDENTITY(1,1) NOT NULL,
    [Nombre_Tipo] [varchar](50) NULL,
PRIMARY KEY CLUSTERED
(
    [Id_TipoCarrera] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET IDENTITY_INSERT [dbo].[Tipo_Carrera] ON;
GO

INSERT INTO [dbo].[Tipo_Carrera] (Id_TipoCarrera, Nombre_Tipo) 
VALUES
	(1, 'Bachiller'),
	(2, 'Licenciatura'),
	(3, 'Técnico'),
	(4, 'Postgrado'),
	(5, 'Diplomado')
GO

SELECT * FROM [dbo].[Tipo_Carrera] 
GO

UPDATE [dbo].[Tipo_Carrera]  
    SET Nombre_Tipo = 'Cursos Libres' 
    WHERE Id_TipoCarrera = '3'
GO
