USE [ProyectoProgra4]
GO

SELECT * FROM [dbo].[A�o]
SELECT * FROM Auditoria_A�o
TRUNCATE TABLE Auditoria_A�o

CREATE TABLE Auditoria_A�o (
	Usuario varchar (30),
	Fecha date,
	Descripcion varchar(50),
	Id_a�o INT NOT NULL,
	a�o VARCHAR (20),
	)
GO



CREATE TRIGGER TR_AUDITORIA_A�O
ON [dbo].[A�o] FOR INSERT,UPDATE,DELETE
AS
SET NOCOUNT ON
DECLARE @Id_a�o INT,@a�o VARCHAR (20)
IF EXISTS(SELECT 0 FROM inserted)
BEGIN
	IF EXISTS(SELECT 0 FROM deleted)
	BEGIN
		SELECT  @Id_a�o=Id_A�o,@a�o=A�o FROM deleted
		INSERT INTO Auditoria_A�o values(SYSTEM_USER,GETDATE(),'Registro Actualizado Eliminado',@Id_a�o,@a�o)
		SELECT  @Id_a�o=Id_A�o,@a�o=A�o FROM inserted
		INSERT INTO Auditoria_A�o values(SYSTEM_USER,GETDATE(),'Registro Actualizado Nuevo',@Id_a�o,@a�o)
		END ELSE
	BEGIN		
		SELECT  @Id_a�o=Id_A�o,@a�o=A�o FROM inserted
		INSERT INTO Auditoria_A�o values(SYSTEM_USER,GETDATE(),'Registro Actualizado Nuevo',@Id_a�o,@a�o)
	END
END ELSE
BEGIN
		SELECT  @Id_a�o=Id_A�o,@a�o=A�o FROM deleted
		INSERT INTO Auditoria_A�o values(SYSTEM_USER,GETDATE(),'Registro Actualizado Nuevo',@Id_a�o,@a�o)
END
GO