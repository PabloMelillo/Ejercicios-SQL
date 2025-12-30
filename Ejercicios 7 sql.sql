use hr_unicorn;

create table departamentos_copia
select * from departamentos; -- copia de tabla para back up 


create table reporting_provincia_na
select * from reporting_salario_medio where	provincia='sin provincia'; -- copia de tala con la siguientes condiciones para su hallazgo, se replica la estructura pero habria que asignarle PK


set sql_safe_updates = 0;

update reporting_salario_medio set provincia = 'NA' where provincia = 'sin provincia'; -- actualizaremos ciertos datos en algunos campos 

UPDATE empleados
SET telefono = REGEXP_REPLACE(telefono, '[,.]', '-')
WHERE telefono REGEXP '[,.]'; -- se detectaron patrones en los numeros de telefonos, signos que no eran correctos y se lo modifico con - 

create table empleados_copia_1
select * from empleados; -- copia de tabla para back up y realizar un delete

DELETE from empleados_copia
where id_departamento = 50; -- eliminacion de filas en donde 

ALTER TABLE empleados_copia AUTO_INCREMENT = 1; -- reset de auto increment

create table empleados_copia_1
select * from empleados;

truncate table empleados_copia_1;

insert into empleados_copia_1(id_empleado,nombre_empleado,apellido_empleado,email,telefono,fecha_contratacion,id_trabajo,salario,comision_pactada,id_gerente,id_departamento)
SELECT id_empleado,nombre_empleado,apellido_empleado,email,telefono,fecha_contratacion,id_trabajo,salario,comision_pactada,id_gerente,id_departamento
FROM empleados
WHERE id_departamento <> 50; -- se realizo el insert de los registros de la tabla original a la de empleados_copia_1


set sql_safe_updates=1; 
