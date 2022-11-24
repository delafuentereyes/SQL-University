USE [ProyectoProgra4]
GO

SELECT * FROM [dbo].[Tipo_Carrera]
SELECT * FROM Auditoria_Usuarios
TRUNCATE TABLE Auditoria_Usuarios

CREATE TABLE Auditoria_Usuarios(
	Usuario varchar (30),
	Fecha date,
	Descripcion varchar(50),
	Id_Usuario INT NOT NULL,
	Nombre VARCHAR (100),
	Cedula VARCHAR (100),
	Correo VARCHAR (100),
	)
GO



CREATE TRIGGER TR_AUDITORIA_USUARIOS
ON [dbo].[Usuarios] FOR INSERT,UPDATE,DELETE
AS
SET NOCOUNT ON
DECLARE @Id_Usuario INT,@Nombre VARCHAR (100),@Cedula VARCHAR (100),@Correo VARCHAR (100)
IF EXISTS(SELECT 0 FROM inserted)
BEGIN
	IF EXISTS(SELECT 0 FROM deleted)
	BEGIN
		SELECT @Id_Usuario=Id_Usuario,@Nombre=Nombre,@Cedula=Cedula,@Correo=Correo  FROM deleted
		INSERT INTO Auditoria_Usuarios values(SYSTEM_USER,GETDATE(),'Registro Actualizado Eliminado',@Id_Usuario,@Nombre,@Cedula,@Correo)
		SELECT @Id_Usuario=Id_Usuario,@Nombre=Nombre,@Cedula=Cedula,@Correo=Correo  FROM inserted
		INSERT INTO Auditoria_Usuarios values(SYSTEM_USER,GETDATE(),'Registro Actualizado Nuevo',@Id_Usuario,@Nombre,@Cedula,@Correo)
		END ELSE
	BEGIN		
		SELECT @Id_Usuario=Id_Usuario,@Nombre=Nombre,@Cedula=Cedula,@Correo=Correo  FROM inserted
		INSERT INTO Auditoria_Usuarios values(SYSTEM_USER,GETDATE(),'Registro Actualizado ',@Id_Usuario,@Nombre,@Cedula,@Correo)
		END
END ELSE
BEGIN
		SELECT @Id_Usuario=Id_Usuario,@Nombre=Nombre,@Cedula=Cedula,@Correo=Correo  FROM deleted
		INSERT INTO Auditoria_Usuarios values(SYSTEM_USER,GETDATE(),'Registro Eliminado',@Id_Usuario,@Nombre,@Cedula,@Correo)
END
GO