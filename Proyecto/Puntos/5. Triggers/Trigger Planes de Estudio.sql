USE [ProyectoProgra4]
GO

SELECT * FROM [dbo].[PlanesEstudio]
SELECT * FROM Auditoria_Periodos
TRUNCATE TABLE Auditoria_Periodos

CREATE TABLE Auditoria_Periodos (
	Usuario varchar (30),
	Fecha date,
	Descripcion varchar(50),
	Id_PlanEstudio INT NOT NULL,
	Id_Carrera INT NOT NULL,
	Id_Curso INT NOT NULL,
	Id_Periodo INT NOT NULL,
	 
	)
GO



CREATE TRIGGER TR_AUDITORIA_PLANESESTUDIO
ON [dbo].[PlanesEstudio] FOR INSERT,UPDATE,DELETE
AS
SET NOCOUNT ON
DECLARE @Id_PlanEstudio INT,@Id_Carrera INT,@Id_Curso INT,@Id_Periodo INT
IF EXISTS(SELECT 0 FROM inserted)
BEGIN
	IF EXISTS(SELECT 0 FROM deleted)
	BEGIN
		SELECT @Id_PlanEstudio=[Id_PlanEstudio],@Id_Carrera=[Id_Carrera],@Id_Curso=[Id_Curso],@Id_Periodo=[Id_Periodo] FROM deleted
		INSERT INTO Auditoria_Periodos values(SYSTEM_USER,GETDATE(),'Registro Actualizado Eliminado',@Id_PlanEstudio,@Id_Carrera,@Id_Curso,@Id_Periodo)
		SELECT @Id_PlanEstudio=[Id_PlanEstudio],@Id_Carrera=[Id_Carrera],@Id_Curso=[Id_Curso],@Id_Periodo=[Id_Periodo] FROM inserted
		INSERT INTO Auditoria_Periodos values(SYSTEM_USER,GETDATE(),'Registro Actualizado Nuevo',@Id_PlanEstudio,@Id_Carrera,@Id_Curso,@Id_Periodo)
		END ELSE
	BEGIN		
		SELECT @Id_PlanEstudio=[Id_PlanEstudio],@Id_Carrera=[Id_Carrera],@Id_Curso=[Id_Curso],@Id_Periodo=[Id_Periodo] FROM inserted
		INSERT INTO Auditoria_Periodos values(SYSTEM_USER,GETDATE(),'Registro Actualizado ',@Id_PlanEstudio,@Id_Carrera,@Id_Curso,@Id_Periodo)
	END
END ELSE
BEGIN
		SELECT @Id_PlanEstudio=[Id_PlanEstudio],@Id_Carrera=[Id_Carrera],@Id_Curso=[Id_Curso],@Id_Periodo=[Id_Periodo] FROM deleted
		INSERT INTO Auditoria_Periodos values(SYSTEM_USER,GETDATE(),'Registro Eliminado',@Id_PlanEstudio,@Id_Carrera,@Id_Curso,@Id_Periodo)
END
GO