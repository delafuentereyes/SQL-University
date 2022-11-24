USE [ProyectoProgra4]
GO

SELECT * FROM [dbo].[Carreras]
SELECT * FROM Auditoria_Carrera
TRUNCATE TABLE Auditoria_Año

CREATE TABLE Auditoria_Carrera (
	Usuario varchar (30),
	Fecha date,
	Descripcion varchar(50),
	Id_Carrera INT NOT NULL,
	Codigo VARCHAR (20),
	Nombre VARCHAR (20),
	Id_TipoCarrera INT NOT NULL
	)
GO



CREATE TRIGGER TR_AUDITORIA_CARRERA
ON [dbo].[Carreras] FOR INSERT,UPDATE,DELETE
AS
SET NOCOUNT ON
DECLARE @Id_Carrera INT,@Codigo VARCHAR (20), @Nombre VARCHAR (20),@Id_TipoCarrera INT 
IF EXISTS(SELECT 0 FROM inserted)
BEGIN
	IF EXISTS(SELECT 0 FROM deleted)
	BEGIN
		SELECT  @Id_Carrera =Id_Carrera, @Codigo=Codigo, @Nombre=Nombre ,@Id_TipoCarrera=Id_TipoCarrera  FROM deleted
		INSERT INTO Auditoria_Carrera values(SYSTEM_USER,GETDATE(),'Registro Actualizado Eliminado',@Id_Carrera,@Codigo,@Nombre,@Id_TipoCarrera)
		SELECT  @Id_Carrera =Id_Carrera, @Codigo=Codigo, @Nombre=Nombre ,@Id_TipoCarrera=Id_TipoCarrera  FROM inserted
		INSERT INTO Auditoria_Carrera values(SYSTEM_USER,GETDATE(),'Registro Actualizado Nuevo',@Id_Carrera,@Codigo,@Nombre,@Id_TipoCarrera)
		END ELSE
	BEGIN		
		SELECT  @Id_Carrera =Id_Carrera, @Codigo=Codigo, @Nombre=Nombre ,@Id_TipoCarrera=Id_TipoCarrera  FROM inserted
		INSERT INTO Auditoria_Carrera values(SYSTEM_USER,GETDATE(),'Registro Actualizado ',@Id_Carrera,@Codigo,@Nombre,@Id_TipoCarrera)
	END
END ELSE
BEGIN
		SELECT  @Id_Carrera =Id_Carrera, @Codigo=Codigo, @Nombre=Nombre ,@Id_TipoCarrera=Id_TipoCarrera  FROM deleted
		INSERT INTO Auditoria_Carrera values(SYSTEM_USER,GETDATE(),'Registro Eliminado',@Id_Carrera,@Codigo,@Nombre,@Id_TipoCarrera)
END
GO