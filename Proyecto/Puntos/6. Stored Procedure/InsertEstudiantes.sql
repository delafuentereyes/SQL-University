ALTER PROCEDURE Insert_Estudiantes
@id_Estudiante INT,
@LoginEstudiante VARCHAR(50),
@id_Usuario INT,
@id_Carrera INT

AS 
 IF EXISTS (SELECT * FROM  [dbo].[Estudiantes] WHERE LoginEstudiante=@LoginEstudiante)
	BEGIN
		PRINT('ESTE ESTUDIANTE ENCUENTRA YA REGISTRADO'+ @LoginEstudiante)
RETURN
END
BEGIN
		INSERT INTO [dbo].[Estudiantes]([LoginEstudiante],[Id_Usuario],[Id_Carrera])
		VALUES (@LoginEstudiante,@id_Usuario,@id_Carrera)
END

BEGIN 
SELECT * FROM [dbo].[Estudiantes] WHERE LoginEstudiante = @LoginEstudiante
END

EXEC Insert_Estudiantes  '','Loba033',2,3