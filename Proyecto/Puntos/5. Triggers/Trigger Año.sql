USE [ProyectoProgra4]
GO

SELECT * FROM [dbo].[Año]
SELECT * FROM Auditoria_Año
TRUNCATE TABLE Auditoria_Año

CREATE TABLE Auditoria_Año (
	Usuario varchar (30),
	Fecha date,
	Descripcion varchar(50),
	Id_año INT NOT NULL,
	año VARCHAR (20),
	)
GO



CREATE TRIGGER TR_AUDITORIA_AÑO
ON [dbo].[Año] FOR INSERT,UPDATE,DELETE
AS
SET NOCOUNT ON
DECLARE @Id_año INT,@año VARCHAR (20)
IF EXISTS(SELECT 0 FROM inserted)
BEGIN
	IF EXISTS(SELECT 0 FROM deleted)
	BEGIN
		SELECT  @Id_año=Id_Año,@año=Año FROM deleted
		INSERT INTO Auditoria_Año values(SYSTEM_USER,GETDATE(),'Registro Actualizado Eliminado',@Id_año,@año)
		SELECT  @Id_año=Id_Año,@año=Año FROM inserted
		INSERT INTO Auditoria_Año values(SYSTEM_USER,GETDATE(),'Registro Actualizado Nuevo',@Id_año,@año)
		END ELSE
	BEGIN		
		SELECT  @Id_año=Id_Año,@año=Año FROM inserted
		INSERT INTO Auditoria_Año values(SYSTEM_USER,GETDATE(),'Registro Actualizado Nuevo',@Id_año,@año)
	END
END ELSE
BEGIN
		SELECT  @Id_año=Id_Año,@año=Año FROM deleted
		INSERT INTO Auditoria_Año values(SYSTEM_USER,GETDATE(),'Registro Actualizado Nuevo',@Id_año,@año)
END
GO