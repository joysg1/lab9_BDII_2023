---- lab 9 BDII parte I SCRIPT SECUNDARIO



BEGIN TRANSACTION 
USE EMPRESA
SELECT * FROM EMPLOYEE 
UPDATE EMPLOYEE


SET BONUS = BONUS +1
WHERE EMPNO = '000070'

select * from employee

select * from employee WITH (NOLOCK)

