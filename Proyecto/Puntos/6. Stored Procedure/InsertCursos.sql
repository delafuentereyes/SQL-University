CREATE PROCEDURE [dbo].[Insert_Cursos]

@NombreCurso VARCHAR(50),
@id_Profesor INT,
@id_Carrera1 INT,
@id_Carrera2 INT,
@id_Carrera3 INT,
@CodigoCurso VARCHAR(10)

AS
 IF EXISTS (SELECT * FROM [dbo].[Cursos]  WHERE Nombre =@NombreCurso)
	BEGIN
		PRINT('ESTE CURSO SE ENCUENTRA YA REGISTRADO'+ @NombreCurso)
RETURN
END
BEGIN
		INSERT INTO [dbo].[Cursos]([Nombre],[Id_Profesor],[Id_Carrera1],[Id_Carrera2],[Id_Carrera3],[Codigo_Curso])
		VALUES( @NombreCurso,@id_Profesor,@id_Carrera1, @id_Carrera2,@id_Carrera3, @CodigoCurso)
END
BEGIN 
SELECT * FROM [dbo].[Cursos]  WHERE Nombre = @NombreCurso
END

EXEC [dbo].[Insert_Cursos] 'Inglespithyon',1,1,2,3,'LM144324'