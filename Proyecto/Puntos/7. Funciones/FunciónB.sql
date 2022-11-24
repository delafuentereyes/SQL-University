USE ProyectoProgra4
GO

ALTER FUNCTION PromedioEstudiante(@Id_Nota VARCHAR(20)) RETURNS DECIMAL(10,2)
AS

BEGIN 

DECLARE @Promedio DECIMAL(10,2)

SELECT @Promedio = AVG(Nota) 
FROM dbo.Notas INNER JOIN
		dbo.Matriculas ON dbo.Notas.Id_Matricula = dbo.Matriculas.Id_Matricula INNER JOIN
			dbo.Estudiantes ON dbo.Matriculas.Id_Estudiante = dbo.Estudiantes.Id_Estudiante 
WHERE LoginEstudiante = @Id_Nota

RETURN @Promedio

END
GO

SELECT LoginEstudiante, [dbo].[PromedioEstudiante](30) AS Promedio 
FROM dbo.Notas INNER JOIN
		dbo.Matriculas ON dbo.Notas.Id_Matricula = dbo.Matriculas.Id_Matricula INNER JOIN
			dbo.Estudiantes ON dbo.Matriculas.Id_Estudiante = dbo.Estudiantes.Id_Estudiante 
WHERE LoginEstudiante = 'Lean90'
GO