USE [ProyectoProgra4]
GO

SELECT * FROM [dbo].[Tipo_Carrera]
SELECT * FROM Auditoria_Tipo_Carrera
TRUNCATE TABLE Auditoria_Tipo_Carrera

CREATE TABLE Auditoria_Tipo_Carrera(
	Usuario varchar (30),
	Fecha date,
	Descripcion varchar(50),
	Id_TipoCarrera INT NOT NULL,
	Nombre VARCHAR (50),
	)
GO



CREATE TRIGGER TR_AUDITORIA_TIPOCARRERA
ON [dbo].[Tipo_Carrera] FOR INSERT,UPDATE,DELETE
AS
SET NOCOUNT ON
DECLARE @Id_TipoCarrera INT,@Nombre VARCHAR (50)
IF EXISTS(SELECT 0 FROM inserted)
BEGIN
	IF EXISTS(SELECT 0 FROM deleted)
	BEGIN
		SELECT @Id_TipoCarrera=Id_TipoCarrera,@Nombre=Nombre_Tipo  FROM deleted
		INSERT INTO Auditoria_Tipo_Carrera values(SYSTEM_USER,GETDATE(),'Registro Actualizado Eliminado',@Id_TipoCarrera,@Nombre)
		SELECT @Id_TipoCarrera=Id_TipoCarrera,@Nombre=Nombre_Tipo  FROM inserted
		INSERT INTO Auditoria_Tipo_Carrera values(SYSTEM_USER,GETDATE(),'Registro Actualizado Nuevo',@Id_TipoCarrera,@Nombre)
		END ELSE
	BEGIN		
		SELECT @Id_TipoCarrera=Id_TipoCarrera,@Nombre=Nombre_Tipo  FROM inserted 
		INSERT INTO Auditoria_Tipo_Carrera values(SYSTEM_USER,GETDATE(),'Registro Actualizado ',@Id_TipoCarrera,@Nombre)
		END
END ELSE
BEGIN
		SELECT @Id_TipoCarrera=Id_TipoCarrera,@Nombre=Nombre_Tipo  FROM deleted
		INSERT INTO Auditoria_Tipo_Carrera values(SYSTEM_USER,GETDATE(),'Registro Eliminado',@Id_TipoCarrera,@Nombre)
END
GO