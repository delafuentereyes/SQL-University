USE [ProyectoProgra4]
GO

SELECT * FROM [dbo].[Contraseñas]
SELECT * FROM Auditoria_Contraseña
TRUNCATE TABLE Auditoria_Contraseña

CREATE TABLE Auditoria_Contraseña (
	Usuario varchar (30),
	Fecha date,
	Descripcion varchar(50),
	Id_Contraseña INT NOT NULL,
	Contra VARCHAR (20),
	Id_Usuario INT NOT NULL
	)
GO



CREATE TRIGGER TR_AUDITORIA_CONTRASAEÑA
ON [dbo].[Contraseñas] FOR INSERT,UPDATE,DELETE
AS
SET NOCOUNT ON
DECLARE @Id_Contraseña INT,@Contra VARCHAR (20), @Id_Usuario VARCHAR (20)
IF EXISTS(SELECT 0 FROM inserted)
BEGIN
	IF EXISTS(SELECT 0 FROM deleted)
	BEGIN
		SELECT  @Id_Contraseña =[Id_Contraseña] ,@Contra=[Contra] , @Id_Usuario=[Id_Usuario] FROM deleted
		INSERT INTO Auditoria_Contraseña values(SYSTEM_USER,GETDATE(),'Registro Actualizado Eliminado',@Id_Contraseña,@Contra, @Id_Usuario)
		SELECT  @Id_Contraseña =[Id_Contraseña] ,@Contra=[Contra] , @Id_Usuario=[Id_Usuario] FROM inserted
		INSERT INTO Auditoria_Contraseña values(SYSTEM_USER,GETDATE(),'Registro Actualizado Eliminado',@Id_Contraseña,@Contra, @Id_Usuario)
		END ELSE
	BEGIN		
		SELECT  @Id_Contraseña =[Id_Contraseña] ,@Contra=[Contra] , @Id_Usuario=[Id_Usuario] FROM inserted
		INSERT INTO Auditoria_Contraseña values(SYSTEM_USER,GETDATE(),'Registro Actualizado Eliminado',@Id_Contraseña,@Contra, @Id_Usuario)
	END
END ELSE
BEGIN
		SELECT  @Id_Contraseña =[Id_Contraseña] ,@Contra=[Contra] , @Id_Usuario=[Id_Usuario] FROM deleted
		INSERT INTO Auditoria_Contraseña values(SYSTEM_USER,GETDATE(),'Registro Actualizado Eliminado',@Id_Contraseña,@Contra, @Id_Usuario)
END
GO