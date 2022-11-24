USE [ProyectoProgra4]
GO

SELECT * FROM [dbo].[Profesores]
SELECT * FROM Auditoria_Profesores
TRUNCATE TABLE Auditoria_Profesores

CREATE TABLE Auditoria_Profesores(
	Usuario varchar (30),
	Fecha date,
	Descripcion varchar(50),
	Id_Profesores INT NOT NULL,
	LoginProfesor VARCHAR (20),
	Id_Usuario INT NOT NULL,
	Id_Carrera INT NOT NULL,
	Desempeño VARCHAR (20), 
	)
GO



CREATE TRIGGER TR_AUDITORIA_PROFESORES
ON [dbo].[Profesores] FOR INSERT,UPDATE,DELETE
AS
SET NOCOUNT ON
DECLARE @Id_Profesores INT,@LoginProfesor VARCHAR (20),@Id_Usuario INT,@Id_Carrera INT,@Desempeño VARCHAR (20)
IF EXISTS(SELECT 0 FROM inserted)
BEGIN
	IF EXISTS(SELECT 0 FROM deleted)
	BEGIN
		SELECT @Id_Profesores=[Id_Profesor],@LoginProfesor=[LoginProfesor],@Id_Usuario=[Id_Usuario],@Id_Carrera=[Id_Carrera],@Desempeño=[Desempeño] FROM deleted
		INSERT INTO Auditoria_Profesores values(SYSTEM_USER,GETDATE(),'Registro Actualizado Eliminado',@Id_Profesores,@LoginProfesor,@Id_Usuario,@Id_Carrera,@Desempeño)
		SELECT @Id_Profesores=[Id_Profesor],@LoginProfesor=[LoginProfesor],@Id_Usuario=[Id_Usuario],@Id_Carrera=[Id_Carrera],@Desempeño=[Desempeño] FROM inserted
		INSERT INTO Auditoria_Profesores values(SYSTEM_USER,GETDATE(),'Registro Actualizado Nuevo',@Id_Profesores,@LoginProfesor,@Id_Usuario,@Id_Carrera,@Desempeño)
		END ELSE
	BEGIN		
		SELECT @Id_Profesores=[Id_Profesor],@LoginProfesor=[LoginProfesor],@Id_Usuario=[Id_Usuario],@Id_Carrera=[Id_Carrera],@Desempeño=[Desempeño] FROM inserted
		INSERT INTO Auditoria_Profesores values(SYSTEM_USER,GETDATE(),'Registro Actualizado ',@Id_Profesores,@LoginProfesor,@Id_Usuario,@Id_Carrera,@Desempeño)
END
END ELSE
BEGIN
		SELECT @Id_Profesores=[Id_Profesor],@LoginProfesor=[LoginProfesor],@Id_Usuario=[Id_Usuario],@Id_Carrera=[Id_Carrera],@Desempeño=[Desempeño] FROM deleted
		INSERT INTO Auditoria_Profesores values(SYSTEM_USER,GETDATE(),'Registro Eliminado',@Id_Profesores,@LoginProfesor,@Id_Usuario,@Id_Carrera,@Desempeño)
END
GO