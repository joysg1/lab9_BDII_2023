create database BancoTrans
use  BancoTrans


create table CuentasTrans
(ID char(5) not null,
Nombre varchar(30) not null,
constraint CuentasTrans_ID_PK primary key(ID),
Teléfono nvarchar (30),
constraint Telefono_unique unique(Teléfono),
Género varchar(1) not null,
constraint CuentasTrans_check check(Género in('F','M')),
balance money)



insert into CuentasTrans values
	('00001', '?Laurence Hills','6524-8596','F', 5000),
	('00002', 'Carlos Stuart', '6894-7582', 'M', 3500),
	('00003', 'Marcos Jiménez', '6528-2586', 'M', 895),
	('00004', 'Berlinda Sáenz', '6728-8425', 'F', 4100)



SELECT * FROM CuentasTrans



BEGIN TRY
    BEGIN TRANSACTION;

    -- Restar $1300 del saldo de Laurence
    UPDATE CuentasTrans
    SET balance = balance - 1300
    WHERE id = '00001';

    -- Sumar $1300 al saldo de Marcos
    UPDATE CuentasTrans
    SET balance = balance + 1300
    WHERE id = '00003';

    COMMIT TRANSACTION;
    PRINT 'Transacción completada';

END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
    PRINT 'Transacción cancelada';
END CATCH;


select * from CuentasTrans



BEGIN TRY
    BEGIN TRANSACTION;

    -- Restar $1450 del saldo de Marcos 
    UPDATE CuentasTrans
    SET balance = balance - 1450
    WHERE ID = '00003';

    -- Verificar si el ID 'Laurence' existe
    IF EXISTS (SELECT 1 FROM CuentasTrans WHERE ID = 'Laurence')
    BEGIN
        -- Se coloca intencionalmente el error en el ID
        UPDATE CuentasTrans
        SET balance = balance + 1450
        WHERE ID = 'Laurence';

        COMMIT TRANSACTION;
        PRINT 'Transacción completada';
    END
    ELSE
    BEGIN
        -- Si el ID no existe, activar una excepción para el bloque CATCH
        THROW 50001, 'El ID especificado no existe en la tabla.', 1;
    END

END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
    PRINT 'Error: ' + ERROR_MESSAGE(); -- Imprimir el mensaje de error
    PRINT 'Transacción cancelada';
END CATCH;




select * from CuentasTrans












