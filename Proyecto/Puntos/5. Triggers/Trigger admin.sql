USE [ProyectoProgra4]
GO

SELECT * FROM [dbo].[Administradores]
SELECT * FROM Auditoria_Admin
TRUNCATE TABLE Auditoria_Admin
GO

CREATE TABLE Auditoria_Admin (
	Usuario varchar (30),
	Fecha date,
	Descripcion varchar(50),
	Id_admin INT NOT NULL,
	Login VARCHAR (20),
	Id_Usuario INT NOT NULL
	)
GO



CREATE TRIGGER TR_AUDITORIA_ADMIN
ON [dbo].[Administradores] FOR INSERT,UPDATE,DELETE
AS
SET NOCOUNT ON
DECLARE @Id_admin INT,@Login VARCHAR (20),@Id_Usuario INT 
IF EXISTS(SELECT 0 FROM inserted)
BEGIN
	IF EXISTS(SELECT 0 FROM deleted)
	BEGIN
		SELECT @Id_admin=Id_admi,@Login=Login,@Id_Usuario=Id_Usuario FROM deleted
		INSERT INTO Auditoria_Admin values(SYSTEM_USER,GETDATE(),'Registro Actualizado Eliminado',@Id_admin,@Login,@Id_Usuario)
		SELECT @Id_admin=Id_admi,@Login=Login,@Id_Usuario=Id_Usuario FROM inserted
		INSERT INTO Auditoria_Admin values(SYSTEM_USER,GETDATE(),'Registro Actualizado Nuevo',@Id_admin,@Login,@Id_Usuario)	
		END ELSE
	BEGIN		
		SELECT @Id_admin=Id_admi,@Login=Login,@Id_Usuario=Id_Usuario FROM inserted
		INSERT INTO Auditoria_Admin values(SYSTEM_USER,GETDATE(),'Registro Actualizado ',@Id_admin,@Login,@Id_Usuario)
	END
END ELSE
BEGIN
		SELECT @Id_admin=Id_admi,@Login=Login,@Id_Usuario=Id_Usuario FROM deleted
		INSERT INTO Auditoria_Admin values(SYSTEM_USER,GETDATE(),'Registro Eliminado',@Id_admin,@Login,@Id_Usuario)	
END
GO

UPDATE [dbo].[Administradores] set Login = 'MP182' where [Id_admi] = 1

DELETE FROM [dbo].[Administradores] where Id_admi = 1


