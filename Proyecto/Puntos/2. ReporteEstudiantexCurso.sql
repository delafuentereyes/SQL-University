SELECT * FROM [dbo].[ReporteEstudiantesxCurso]
WHERE Id_Estudiante =1 
ORDER BY Año DESC
GO

CREATE VIEW [dbo].[ReporteEstudiantesxCurso]
AS
SELECT dbo.Estudiantes.Id_Estudiante, dbo.Usuarios.Nombre AS Estudiante, dbo.Matriculas.Id_Matricula, 
	   dbo.Cursos.Id_Curso, dbo.Cursos.Nombre AS Curso, dbo.Notas.Nota, dbo.Notas.Estado, dbo.Año.Año
FROM     dbo.Estudiantes INNER JOIN
			dbo.Matriculas ON dbo.Estudiantes.Id_Estudiante = dbo.Matriculas.Id_Estudiante INNER JOIN
				dbo.Cursos ON dbo.Matriculas.Id_Curso = dbo.Cursos.Id_Curso INNER JOIN
					dbo.Notas ON dbo.Matriculas.Id_Matricula = dbo.Notas.Id_Matricula INNER JOIN
						dbo.Usuarios ON dbo.Estudiantes.Id_Usuario = dbo.Usuarios.Id_Usuario INNER JOIN
							dbo.Periodos ON dbo.Matriculas.Id_Periodo = dbo.Periodos.Id_Periodo INNER JOIN
								dbo.Año ON dbo.Periodos.Id_Año = dbo.Año.Id_Año
GO