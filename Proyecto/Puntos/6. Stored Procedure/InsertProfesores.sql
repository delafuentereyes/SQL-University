CREATE PROCEDURE [dbo].[Insert_Profesores]
@LoginProfesor VARCHAR (50),
@id_Usuario INT,
@id_Carrera INT,
@Desempe�o VARCHAR(20)

AS
	IF EXISTS (SELECT * FROM [dbo].[Profesores] WHERE LoginProfesor =@LoginProfesor)
		BEGIN
			PRINT('EL PROFESOR SE ENCUENTRA YA REGISTRADO' + @LoginProfesor)
RETURN
END
BEGIN 
	INSERT INTO [dbo].[Profesores] ([LoginProfesor],[Id_Usuario],[Id_Carrera],[Desempe�o])
	VALUES(@LoginProfesor, @id_Usuario, @id_Carrera, @Desempe�o)
END

BEGIN 
	SELECT * FROM [dbo].[Profesores]  WHERE LoginProfesor = @LoginProfesor
END

EXEC [dbo].[Insert_Profesores] 'ADDA17', 27, 28, 'Mejorable'