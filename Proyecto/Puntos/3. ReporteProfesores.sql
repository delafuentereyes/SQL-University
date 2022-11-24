SELECT * FROM [dbo].[ReporteProfesores]
WHERE Año BETWEEN 2020 AND 2021 
ORDER BY Año DESC
GO

CREATE VIEW [dbo].[ReporteProfesores]
AS
SELECT dbo.Profesores.Id_Profesor, dbo.Usuarios.Nombre, dbo.ProfesoresxCursosxCuatri.Id_Curso, 
dbo.Periodos.Tipo_Periodo, dbo.Año.Año, dbo.Profesores.Desempeño
FROM dbo.Año INNER JOIN
		dbo.Periodos ON dbo.Año.Id_Año = dbo.Periodos.Id_Año INNER JOIN
			dbo.ProfesoresxCursosxCuatri ON dbo.Periodos.Id_Periodo = dbo.ProfesoresxCursosxCuatri.Id_Periodo INNER JOIN
				dbo.Profesores ON dbo.ProfesoresxCursosxCuatri.Id_Profesor = dbo.Profesores.Id_Profesor INNER JOIN
					dbo.Usuarios ON dbo.Profesores.Id_Usuario = dbo.Usuarios.Id_Usuario
GO