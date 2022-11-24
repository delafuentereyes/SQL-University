SELECT * FROM [dbo].[ReportePlanEstudio]
WHERE Tipo_Periodo BETWEEN 'Cuatrimestre' AND 'Trimestre' 
ORDER BY Tipo_Periodo 
GO

CREATE VIEW [dbo].[ReportePlanEstudio]
AS
SELECT dbo.PlanesEstudio.Id_PlanEstudio, dbo.PlanesEstudio.Id_Carrera, dbo.Cursos.Nombre, 
	   dbo.Cursos.Codigo_Curso, dbo.Periodos.Tipo_Periodo
FROM dbo.Cursos INNER JOIN
		dbo.PlanesEstudio ON dbo.Cursos.Id_Curso = dbo.PlanesEstudio.Id_Curso INNER JOIN
			dbo.Periodos ON dbo.PlanesEstudio.Id_Periodo = dbo.Periodos.Id_Periodo
GO