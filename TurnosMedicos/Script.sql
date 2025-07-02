use turnos_medicos;
insert into medicos (id, nombre, especialidad_id)
values (5, "Dr.Pablo Beltran", 2);

show triggers;
create user 'katy_user'@'localhost' identified by 'katy1234';
grant all privileges on turnos_medicos.* to 'katy_user'@'localhost';
flush privileges;
select user, host from mysql.user;
drop user 'katy_user'@'localhost';
SHOW TRIGGERS;