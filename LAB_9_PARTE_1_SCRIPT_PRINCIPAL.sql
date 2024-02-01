---- lab 9 BDII parte I SCRIPT PRINCIPAL


Create database Empresa
use empresa

create table employee(
empno int primary key,
e_name varchar(25),
e_last_name varchar(25),
salary money,
bonus money

)

insert into employee(empno, e_name,e_last_name,salary, bonus)
values(000060,'Mark','Polk',2000,150),
      (000070, 'Joel', 'Loop', 1600, 200)

select * from employee

BEGIN TRANSACTION
USE EMPRESA
SELECT * FROM EMPLOYEE
UPDATE EMPLOYEE
SET BONUS = BONUS +1
WHERE EMPNO = '000070'

ROLLBACK TRAN

select * from employee





