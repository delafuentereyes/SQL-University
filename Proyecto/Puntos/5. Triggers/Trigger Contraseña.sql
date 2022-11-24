USE [ProyectoProgra4]
GO

SELECT * FROM [dbo].[Contrase�as]
SELECT * FROM Auditoria_Contrase�a
TRUNCATE TABLE Auditoria_Contrase�a

CREATE TABLE Auditoria_Contrase�a (
	Usuario varchar (30),
	Fecha date,
	Descripcion varchar(50),
	Id_Contrase�a INT NOT NULL,
	Contra VARCHAR (20),
	Id_Usuario INT NOT NULL
	)
GO



CREATE TRIGGER TR_AUDITORIA_CONTRASAE�A
ON [dbo].[Contrase�as] FOR INSERT,UPDATE,DELETE
AS
SET NOCOUNT ON
DECLARE @Id_Contrase�a INT,@Contra VARCHAR (20), @Id_Usuario VARCHAR (20)
IF EXISTS(SELECT 0 FROM inserted)
BEGIN
	IF EXISTS(SELECT 0 FROM deleted)
	BEGIN
		SELECT  @Id_Contrase�a =[Id_Contrase�a] ,@Contra=[Contra] , @Id_Usuario=[Id_Usuario] FROM deleted
		INSERT INTO Auditoria_Contrase�a values(SYSTEM_USER,GETDATE(),'Registro Actualizado Eliminado',@Id_Contrase�a,@Contra, @Id_Usuario)
		SELECT  @Id_Contrase�a =[Id_Contrase�a] ,@Contra=[Contra] , @Id_Usuario=[Id_Usuario] FROM inserted
		INSERT INTO Auditoria_Contrase�a values(SYSTEM_USER,GETDATE(),'Registro Actualizado Eliminado',@Id_Contrase�a,@Contra, @Id_Usuario)
		END ELSE
	BEGIN		
		SELECT  @Id_Contrase�a =[Id_Contrase�a] ,@Contra=[Contra] , @Id_Usuario=[Id_Usuario] FROM inserted
		INSERT INTO Auditoria_Contrase�a values(SYSTEM_USER,GETDATE(),'Registro Actualizado Eliminado',@Id_Contrase�a,@Contra, @Id_Usuario)
	END
END ELSE
BEGIN
		SELECT  @Id_Contrase�a =[Id_Contrase�a] ,@Contra=[Contra] , @Id_Usuario=[Id_Usuario] FROM deleted
		INSERT INTO Auditoria_Contrase�a values(SYSTEM_USER,GETDATE(),'Registro Actualizado Eliminado',@Id_Contrase�a,@Contra, @Id_Usuario)
END
GO