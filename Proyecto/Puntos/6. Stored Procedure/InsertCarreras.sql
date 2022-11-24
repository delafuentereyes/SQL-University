CREATE PROCEDURE [dbo].[Insert_Carreras]
@id_Carrera INT,
@Codigo VARCHAR(10),
@NombreCarrera VARCHAR (200),
@id_TipoCarrera INT

AS
 IF EXISTS (SELECT * FROM [dbo].[Carreras]  WHERE Nombre =@NombreCarrera)
	BEGIN
		PRINT('ESTA CARRRERA SE ENCUENTRA YA REGISTRADA' + @NombreCarrera)
RETURN
END
	BEGIN
		INSERT INTO [dbo].[Carreras]([Codigo],[Nombre],[Id_TipoCarrera])
		VALUES (@Codigo,@NombreCarrera,@id_TipoCarrera)
END

BEGIN 
SELECT * FROM [dbo].[Carreras]   WHERE Nombre = @NombreCarrera
END

EXEC [dbo].[Insert_Carreras] '','MCEJY','Programa Conversacional de Portuges',2