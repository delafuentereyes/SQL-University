USE [ProyectoProgra4]
GO

SELECT * FROM [dbo].[Matriculas]
SELECT * FROM Auditoria_Matriculas
TRUNCATE TABLE Auditoria_Matriculas

CREATE TABLE Auditoria_Matriculas (
	Usuario varchar (30),
	Fecha date,
	Descripcion varchar(50),
	Id_Matricula INT NOT NULL,
	Id_Estudiante INT NOT NULL,
	Id_Curso INT NOT NULL,
	Id_Periodo INT NOT NULL
	)
GO



CREATE TRIGGER TR_AUDITORIA_MATRICULAS
ON [dbo].[Matriculas] FOR INSERT,UPDATE,DELETE
AS
SET NOCOUNT ON
DECLARE @Id_Matricula INT,@Id_Estudiante INT, @Id_Curso INT,@Id_Periodo INT 
IF EXISTS(SELECT 0 FROM inserted)
BEGIN
	IF EXISTS(SELECT 0 FROM deleted)
	BEGIN
		SELECT  @Id_Matricula= [Id_Matricula],@Id_Estudiante =[Id_Estudiante], @Id_Curso =[Id_Curso],@Id_Periodo = [Id_Periodo] FROM deleted
		INSERT INTO Auditoria_Matriculas values(SYSTEM_USER,GETDATE(),'Registro Actualizado Eliminado',@Id_Matricula,@Id_Estudiante, @Id_Curso,@Id_Periodo)
		SELECT  @Id_Matricula= [Id_Matricula],@Id_Estudiante =[Id_Estudiante], @Id_Curso =[Id_Curso],@Id_Periodo = [Id_Periodo] FROM inserted
		INSERT INTO Auditoria_Matriculas values(SYSTEM_USER,GETDATE(),'Registro Actualizado Nuevo',@Id_Matricula,@Id_Estudiante, @Id_Curso,@Id_Periodo)
		END ELSE
	BEGIN		
		SELECT  @Id_Matricula= [Id_Matricula],@Id_Estudiante =[Id_Estudiante], @Id_Curso =[Id_Curso],@Id_Periodo = [Id_Periodo] FROM inserted
		INSERT INTO Auditoria_Matriculas values(SYSTEM_USER,GETDATE(),'Registro Actualizado ',@Id_Matricula,@Id_Estudiante, @Id_Curso,@Id_Periodo)
	END
END ELSE
BEGIN
		SELECT  @Id_Matricula= [Id_Matricula],@Id_Estudiante =[Id_Estudiante], @Id_Curso =[Id_Curso],@Id_Periodo = [Id_Periodo] FROM deleted
		INSERT INTO Auditoria_Matriculas values(SYSTEM_USER,GETDATE(),'Registro Eliminado',@Id_Matricula,@Id_Estudiante, @Id_Curso,@Id_Periodo)
END
GO