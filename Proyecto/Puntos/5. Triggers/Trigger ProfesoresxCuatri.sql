USE [ProyectoProgra4]
GO

SELECT * FROM [dbo].[ProfesoresxCursosxCuatri]
SELECT * FROM Auditoria_ProfesoresXCuatri
TRUNCATE TABLE Auditoria_ProfesoresXCuatri

CREATE TABLE Auditoria_ProfesoresXCuatri(
	Usuario varchar (30),
	Fecha date,
	Descripcion varchar(50),
	Id_PCC INT NOT NULL,
	Id_Profesor INT NOT NULL,
	Id_Curso INT NOT NULL,
	Id_Periodo INT NOT NULL
	)
GO



CREATE TRIGGER TR_AUDITORIA_PROFESORESXCUATRI
ON [dbo].[ProfesoresxCursosxCuatri] FOR INSERT,UPDATE,DELETE
AS
SET NOCOUNT ON
DECLARE @Id_PCC INT,@Id_Profesor INT,@Id_Curso INT,@Id_Periodo INT
IF EXISTS(SELECT 0 FROM inserted)
BEGIN
	IF EXISTS(SELECT 0 FROM deleted)
	BEGIN
		SELECT @Id_PCC=[Id_PCC],@Id_Profesor=[Id_Profesor],@Id_Curso=[Id_Curso],@Id_Periodo=[Id_Periodo] FROM deleted
		INSERT INTO Auditoria_ProfesoresXCuatri values(SYSTEM_USER,GETDATE(),'Registro Actualizado Eliminado',@Id_PCC,@Id_Profesor,@Id_Curso,@Id_Periodo)
		SELECT @Id_PCC=[Id_PCC],@Id_Profesor=[Id_Profesor],@Id_Curso=[Id_Curso],@Id_Periodo=[Id_Periodo] FROM inserted
		INSERT INTO Auditoria_ProfesoresXCuatri values(SYSTEM_USER,GETDATE(),'Registro Actualizado Nuevo',@Id_PCC,@Id_Profesor,@Id_Curso,@Id_Periodo)
		END ELSE
	BEGIN		
		SELECT @Id_PCC=[Id_PCC],@Id_Profesor=[Id_Profesor],@Id_Curso=[Id_Curso],@Id_Periodo=[Id_Periodo] FROM inserted
		INSERT INTO Auditoria_ProfesoresXCuatri values(SYSTEM_USER,GETDATE(),'Registro Actualizado ',@Id_PCC,@Id_Profesor,@Id_Curso,@Id_Periodo)
		END
END ELSE
BEGIN
		SELECT @Id_PCC=[Id_PCC],@Id_Profesor=[Id_Profesor],@Id_Curso=[Id_Curso],@Id_Periodo=[Id_Periodo] FROM deleted
		INSERT INTO Auditoria_ProfesoresXCuatri values(SYSTEM_USER,GETDATE(),'Registro Eliminado',@Id_PCC,@Id_Profesor,@Id_Curso,@Id_Periodo)
END
GO