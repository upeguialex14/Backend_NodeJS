create database Huella;
use Huella;

create table roles (
id_rol INT auto_increment primary key,
nombre varchar(50)
);

create table permiso (
id_permiso int auto_increment primary key,
nombre varchar(50),
descripcion text
);

create table rol_permiso (
id_rol_permiso int auto_increment primary key,
id_rol int,
permiso_id int,
foreign key (id_rol) references roles(id_rol),
foreign key (permiso_id) references permiso(id_permiso)
);

create table usuarios (
id_usuarios int auto_increment primary key,
nombre varchar(100),
email varchar(300),
clave varchar(500),
id_rol int,
foreign key (id_rol) references roles(id_rol)
);

-- insertar roles
insert into roles (nombre) values
('Administrador'),
('Empleado');

-- insertar permisos
insert into permiso (nombre, descripcion) values
('Crear', 'Permite crear nuevos registros'),
('Leer','Permite visualizar registros'),
('Actualizar', 'Permite modificar registros exitosamente'),
('Eliminar', 'Permite eliminar registros');

-- Asignar permisos al rol Administrador (id_rol = 1)
INSERT INTO rol_permiso (id_rol, permiso_id) VALUES
(1, 1), -- Crear
(1, 2), -- Leer
(1, 3), -- Actualizar
(1, 4); -- Eliminar

-- Asignar permisos al rol Empleado (id_rol = 2), solo Leer
INSERT INTO rol_permiso (id_rol, permiso_id) VALUES
(2, 2);

-- Insertar usuario Admin (contraseña: 123456)
INSERT INTO usuarios (nombre, email, clave, id_rol)
VALUES
('Admin', 'admin@gmail.com', '$2b$10$wLyuMd5mP.D5YekcUa2uSOQIRXvXFyKmpz3go/ryHgHU1ihTtioa6', 1);
-- La contraseña es: 1

-- Insertar usuario Empleado (contraseña: 123456)
INSERT INTO usuarios (nombre, email, clave, id_rol)
VALUES
('Empleado', 'empleado@gmail.com', '$2b$10$wLyuMd5mP.D5YekcUa2uSOQIRXvXFyKmpz3go/ryHgHU1ihTtioa6', 2);
-- La contraseña es: 1

