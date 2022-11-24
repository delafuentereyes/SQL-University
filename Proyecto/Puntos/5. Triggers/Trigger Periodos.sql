USE [ProyectoProgra4]
GO

SELECT * FROM [dbo].[Periodos]
SELECT * FROM Auditoria_Periodos
TRUNCATE TABLE Auditoria_Periodos

CREATE TABLE Auditoria_Periodos (
	Usuario varchar (30),
	Fecha date,
	Descripcion varchar(50),
	Id_Periodo INT NOT NULL,
	Tipo_Periodo VARCHAR (20),
	Id_Año INT NOT NULL
	)
GO



CREATE TRIGGER TR_AUDITORIA_PERIODOS
ON [dbo].[Periodos] FOR INSERT,UPDATE,DELETE
AS
SET NOCOUNT ON
DECLARE @Id_Periodo INT,@Tipo_Periodo VARCHAR (20),@Id_Año VARCHAR (20)
IF EXISTS(SELECT 0 FROM inserted)
BEGIN
	IF EXISTS(SELECT 0 FROM deleted)
	BEGIN
		SELECT @Id_Periodo=[Id_Periodo],@Tipo_Periodo=[Tipo_Periodo],@Id_Año=[Id_Año] FROM deleted
		INSERT INTO Auditoria_Periodos values(SYSTEM_USER,GETDATE(),'Registro Actualizado Eliminado',@Id_Periodo,@Tipo_Periodo,@Id_Año)
		SELECT @Id_Periodo=[Id_Periodo],@Tipo_Periodo=[Tipo_Periodo],@Id_Año=[Id_Año] FROM inserted
		INSERT INTO Auditoria_Periodos values(SYSTEM_USER,GETDATE(),'Registro Actualizado Nuevo',@Id_Periodo,@Tipo_Periodo,@Id_Año)
		END ELSE
	BEGIN		
		SELECT @Id_Periodo=[Id_Periodo],@Tipo_Periodo=[Tipo_Periodo],@Id_Año=[Id_Año] FROM inserted
		INSERT INTO Auditoria_Periodos values(SYSTEM_USER,GETDATE(),'Registro Actualizado ',@Id_Periodo,@Tipo_Periodo,@Id_Año)
	END
END ELSE
BEGIN
		SELECT @Id_Periodo=[Id_Periodo],@Tipo_Periodo=[Tipo_Periodo],@Id_Año=[Id_Año] FROM deleted
		INSERT INTO Auditoria_Periodos values(SYSTEM_USER,GETDATE(),'Registro Eliminado',@Id_Periodo,@Tipo_Periodo,@Id_Año)
END
GO