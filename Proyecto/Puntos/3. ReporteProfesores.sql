SELECT * FROM [dbo].[ReporteProfesores]
WHERE A�o BETWEEN 2020 AND 2021 
ORDER BY A�o DESC
GO

CREATE VIEW [dbo].[ReporteProfesores]
AS
SELECT dbo.Profesores.Id_Profesor, dbo.Usuarios.Nombre, dbo.ProfesoresxCursosxCuatri.Id_Curso, 
dbo.Periodos.Tipo_Periodo, dbo.A�o.A�o, dbo.Profesores.Desempe�o
FROM dbo.A�o INNER JOIN
		dbo.Periodos ON dbo.A�o.Id_A�o = dbo.Periodos.Id_A�o INNER JOIN
			dbo.ProfesoresxCursosxCuatri ON dbo.Periodos.Id_Periodo = dbo.ProfesoresxCursosxCuatri.Id_Periodo INNER JOIN
				dbo.Profesores ON dbo.ProfesoresxCursosxCuatri.Id_Profesor = dbo.Profesores.Id_Profesor INNER JOIN
					dbo.Usuarios ON dbo.Profesores.Id_Usuario = dbo.Usuarios.Id_Usuario
GO