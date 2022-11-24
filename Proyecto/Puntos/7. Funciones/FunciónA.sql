CREATE FUNCTION NotaPorPeriodo(@IdEstudiante int)

RETURNS TABLE 
AS
RETURN 
(
			SELECT  dbo.Notas.Nota, dbo.Cursos.Nombre, dbo.Estudiantes.LoginEstudiante, dbo.Periodos.Tipo_Periodo
			FROM dbo.PlanesEstudio INNER JOIN
                         dbo.Cursos ON dbo.PlanesEstudio.Id_Curso = dbo.Cursos.Id_Curso INNER JOIN
                         dbo.Matriculas ON dbo.Cursos.Id_Curso = dbo.Matriculas.Id_Curso INNER JOIN
                         dbo.Notas ON dbo.Matriculas.Id_Matricula = dbo.Notas.Id_Matricula INNER JOIN
                         dbo.Periodos ON dbo.PlanesEstudio.Id_Periodo = dbo.Periodos.Id_Periodo AND dbo.Matriculas.Id_Periodo = dbo.Periodos.Id_Periodo INNER JOIN
                         dbo.Estudiantes ON dbo.Matriculas.Id_Estudiante = dbo.Estudiantes.Id_Estudiante
						 Where dbo.Estudiantes.Id_Estudiante = @IdEstudiante

)

SELECT * FROM [dbo].[NotaPorPeriodo] ('2')
