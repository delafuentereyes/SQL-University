USE [ProyectoProgra4]
GO

SELECT * FROM [dbo].[Estudiantes]
SELECT * FROM Auditoria_Estudiantes
TRUNCATE TABLE Auditoria_Estudiantes

CREATE TABLE Auditoria_Estudiantes (
	Usuario varchar (30),
	Fecha date,
	Descripcion varchar(50),
	Id_Estudiante INT NOT NULL,
	LoginEstudiante VARCHAR (50),
	Id_Usuario VARCHAR (20),
	Id_Carrera INT NOT NULL 
	)
GO



CREATE TRIGGER TR_AUDITORIA_ESTUDIANTES
ON [dbo].[Estudiantes] FOR INSERT,UPDATE,DELETE
AS
SET NOCOUNT ON
DECLARE @Id_Estudiante INT, @LoginEstudiante VARCHAR (50),@Id_Usuario VARCHAR (20),@Id_Carrera INT
IF EXISTS(SELECT 0 FROM inserted)
BEGIN
	IF EXISTS(SELECT 0 FROM deleted)
	BEGIN
		SELECT   @Id_Estudiante =[Id_Estudiante], @LoginEstudiante=[LoginEstudiante],@Id_Usuario =[Id_Usuario],@Id_Carrera =[Id_Carrera]  FROM deleted
		INSERT INTO Auditoria_Estudiantes values(SYSTEM_USER,GETDATE(),'Registro Actualizado Eliminado',@Id_Estudiante,@LoginEstudiante,@Id_Usuario,@Id_Carrera)
		SELECT   @Id_Estudiante =[Id_Estudiante], @LoginEstudiante=[LoginEstudiante],@Id_Usuario =[Id_Usuario],@Id_Carrera =[Id_Carrera]  FROM inserted
		INSERT INTO Auditoria_Estudiantes values(SYSTEM_USER,GETDATE(),'Registro Actualizado Eliminado',@Id_Estudiante,@LoginEstudiante,@Id_Usuario,@Id_Carrera)
		END ELSE
	BEGIN		
		SELECT   @Id_Estudiante =[Id_Estudiante], @LoginEstudiante=[LoginEstudiante],@Id_Usuario =[Id_Usuario],@Id_Carrera =[Id_Carrera]  FROM inserted
		INSERT INTO Auditoria_Estudiantes values(SYSTEM_USER,GETDATE(),'Registro Actualizado Eliminado',@Id_Estudiante,@LoginEstudiante,@Id_Usuario,@Id_Carrera)
	END
END ELSE
BEGIN
		SELECT   @Id_Estudiante =[Id_Estudiante], @LoginEstudiante=[LoginEstudiante],@Id_Usuario =[Id_Usuario],@Id_Carrera =[Id_Carrera]  FROM deleted
		INSERT INTO Auditoria_Estudiantes values(SYSTEM_USER,GETDATE(),'Registro Actualizado Eliminado',@Id_Estudiante,@LoginEstudiante,@Id_Usuario,@Id_Carrera)
END
GO