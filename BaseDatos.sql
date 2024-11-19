CREATE USER 'user_colegios'@'localhost' IDENTIFIED BY 'Colegios2024';
GRANT CREATE, INSERT, UPDATE, DELETE, SELECT, EXECUTE ON db_colegios.* TO 'user_colegios'@'localhost';
CREATE DATABASE db_colegios;


--Elimina los permisos, usuario y base de datos--

--REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'user_colegios'@'localhost';
--DROP DATABASE db_colegios;
--DROP USER 'user_colegios'@'localhost';


--Código para verificar si un procedimiento almacenado específico ya está en la DB
--SELECT ROUTINE_NAME FROM INFORMATION_SCHEMA.ROUTINESWHERE ROUTINE_SCHEMA = 'mi_base'AND ROUTINE_TYPE = 'PROCEDURE'AND ROUTINE_NAME = 'mi_procedimiento';

USE db_colegios;

CREATE TABLE Departamento (
    ID_Departamento INT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL
);

INSERT INTO Departamento (ID_Departamento, Nombre) VALUES
(1, 'Antioquia'),
(2, 'Cundinamarca'),
(3, 'Valle del Cauca'),
(4, 'Bolívar'),
(5, 'Santander');


CREATE TABLE SecEducacion_Departamental (
    ID_Secretaria INT PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Direccion VARCHAR(50) NOT NULL,
    Email VARCHAR(50) NOT NULL,
    ID_Departamento INT,
    FOREIGN KEY (ID_Departamento) REFERENCES Departamento(ID_Departamento)
);


INSERT INTO SecEducacion_Departamental (ID_Secretaria, Nombre, Direccion, Email, ID_Departamento) VALUES
(1, 'Secretaria Antioquia', 'Cra 45 # 32-10', 'sec_antioquia@mail.com', 1),
(2, 'Secretaria Cundinamarca', 'Calle 7 # 8-23', 'sec_cundi@mail.com', 2),
(3, 'Secretaria Valle', 'Av 10 # 12-30', 'sec_valle@mail.com', 3),
(4, 'Secretaria Bolívar', 'Cra 12 # 18-05', 'sec_bolivar@mail.com', 4),
(5, 'Secretaria Santander', 'Calle 9 # 10-45', 'sec_santander@mail.com', 5);


CREATE TABLE DirSecretaria_Educacion (
    ID_Director INT PRIMARY KEY,
    Nombre VARCHAR(20) NOT NULL,
	Apellido VARCHAR(20),
    Genero VARCHAR(10) NOT NULL,
    Email VARCHAR(50) NOT NULL,
    Direccion VARCHAR(50) NOT NULL,
    Fecha_contratación DATETIME,
    Fecha_Nacimiento DATETIME,
    ID_Secretaria INT,
    FOREIGN KEY (ID_Secretaria) REFERENCES SecEducacion_Departamental(ID_Secretaria)
);


INSERT INTO DirSecretaria_Educacion (ID_Director, Nombre, Apellido, Genero, Email, Direccion, Fecha_contratación, Fecha_Nacimiento, ID_Secretaria) VALUES
(1, 'Carlos', 'Pérez', 'Masculino', 'carlos.perez@mail.com', 'Cra 45 # 32-10', '2015-05-01 08:30:00', '1970-12-25 00:00:00', 1),
(2, 'Ana', 'Martínez', 'Femenino', 'ana.martinez@mail.com', 'Calle 7 # 8-23', '2017-03-15 09:00:00', '1980-05-16 00:00:00', 2),
(3, 'Luis', 'Gómez', 'Masculino', 'luis.gomez@mail.com', 'Av 10 # 12-30', '2018-07-20 10:00:00', '1975-08-12 00:00:00', 3),
(4, 'Marta', 'Rodríguez', 'Femenino', 'marta.rodriguez@mail.com', 'Cra 12 # 18-05', '2020-11-10 11:00:00', '1985-09-30 00:00:00', 4),
(5, 'José', 'Suárez', 'Masculino', 'jose.suarez@mail.com', 'Calle 9 # 10-45', '2019-09-01 08:00:00', '1978-11-01 00:00:00', 5);


CREATE TABLE Regional (
    ID_Regional INT PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    ID_Secretaria INT,
    FOREIGN KEY (ID_Secretaria) REFERENCES SecEducacion_Departamental(ID_Secretaria)
);


INSERT INTO Regional (ID_Regional, Nombre, ID_Secretaria) VALUES
(1, 'Regional Antioquia', 1),
(2, 'Regional Cundinamarca', 2),
(3, 'Regional Pacífico', 3),
(4, 'Regional Caribe', 4),
(5, 'Regional Oriente', 5);


CREATE TABLE Dir_Regional (
    ID_DirRegional INT PRIMARY KEY,
    Nombre VARCHAR(20) NOT NULL,
    Apellido VARCHAR(20),
    Genero VARCHAR(10) NOT NULL,
    Email VARCHAR(50) NOT NULL,
    Direccion VARCHAR(50) NOT NULL,
    Fecha_contratación DATETIME,
    Fecha_Nacimiento DATETIME,
    ID_Regional INT,
    FOREIGN KEY (ID_Regional) REFERENCES Regional(ID_Regional)
);


INSERT INTO Dir_Regional (ID_DirRegional, Nombre, Apellido, Genero, Email, Direccion, Fecha_contratación, Fecha_Nacimiento, ID_Regional) VALUES
(1, 'Mario', 'López', 'Masculino', 'mario.lopez@mail.com', 'Cra 45 # 32-10', '2016-01-10 09:30:00', '1972-04-17 00:00:00', 1),
(2, 'Sofía', 'Moreno', 'Femenino', 'sofia.moreno@mail.com', 'Calle 7 # 8-23', '2018-06-05 08:30:00', '1979-02-28 00:00:00', 2),
(3, 'Pedro', 'Castro', 'Masculino', 'pedro.castro@mail.com', 'Av 10 # 12-30', '2020-12-01 10:30:00', '1981-01-15 00:00:00', 3),
(4, 'Paula', 'Mendoza', 'Femenino', 'paula.mendoza@mail.com', 'Cra 12 # 18-05', '2021-03-22 11:30:00', '1983-06-21 00:00:00', 4),
(5, 'Camilo', 'Hernández', 'Masculino', 'camilo.hernandez@mail.com', 'Calle 9 # 10-45', '2019-09-17 09:45:00', '1985-12-10 00:00:00', 5);


CREATE TABLE Ciudad (
    ID_Ciudad INT PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    ID_Regional INT,  
    FOREIGN KEY (ID_Regional) REFERENCES Regional(ID_Regional)
);


INSERT INTO Ciudad (ID_Ciudad, Nombre, ID_Regional) VALUES
(1, 'Medellín', 1),
(2, 'Bogotá', 2),
(3, 'Cali', 3),
(4, 'Cartagena', 4),
(5, 'Bucaramanga', 5);


CREATE TABLE Comuna (
    ID_Comuna INT PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    ID_Ciudad INT,
    FOREIGN KEY (ID_Ciudad) REFERENCES Ciudad(ID_Ciudad)
);


INSERT INTO Comuna (ID_Comuna, Nombre, ID_Ciudad) VALUES
(1, 'Comuna 1', 1),
(2, 'Comuna 2', 2),
(3, 'Comuna 3', 3),
(4, 'Comuna 4', 4),
(5, 'Comuna 5', 5);


CREATE TABLE Director_Comuna (
    ID_Director INT PRIMARY KEY,
    Nombre VARCHAR(20) NOT NULL,
    Apellido VARCHAR(20),
	Genero VARCHAR(10) NOT NULL,
    Email VARCHAR(50) NOT NULL,
    Direccion VARCHAR(50) NOT NULL,
    Fecha_contratación DATETIME,
    Fecha_Nacimiento DATETIME,
    ID_Comuna INT,
    FOREIGN KEY (ID_Comuna) REFERENCES Comuna(ID_Comuna)
);

INSERT INTO Director_Comuna (ID_Director, Nombre, Apellido, Genero, Email, Direccion, Fecha_contratación, Fecha_Nacimiento, ID_Comuna) VALUES
(1, 'Esteban', 'Ramírez', 'Masculino', 'esteban.ramirez@mail.com', 'Calle 123', '2017-07-05 10:00:00', '1980-10-10 00:00:00', 1),
(2, 'Verónica', 'Ruiz', 'Femenino', 'veronica.ruiz@mail.com', 'Calle 456', '2018-02-15 09:00:00', '1982-07-07 00:00:00', 2),
(3, 'Daniel', 'Orozco', 'Masculino', 'daniel.orozco@mail.com', 'Calle 789', '2019-10-20 08:30:00', '1984-05-05 00:00:00', 3),
(4, 'Clara', 'García', 'Femenino', 'clara.garcia@mail.com', 'Calle 321', '2020-04-01 11:00:00', '1983-03-21 00:00:00', 4),
(5, 'Manuel', 'Torres', 'Masculino', 'manuel.torres@mail.com', 'Calle 654', '2021-01-15 09:30:00', '1985-09-09 00:00:00', 5);



CREATE TABLE Colegio (
    ID_Colegio INT PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Direccion VARCHAR(50),
    Telefono VARCHAR(20),
    ID_Comuna INT,
    FOREIGN KEY (ID_Comuna) REFERENCES Comuna(ID_Comuna)
);

INSERT INTO Colegio (ID_Colegio, Nombre, Direccion, Telefono, ID_Comuna) VALUES
(1, 'Colegio A', 'Cra 1 # 2-3', '3001234567', 1),
(2, 'Colegio B', 'Cra 2 # 3-4', '3002345678', 2),
(3, 'Colegio C', 'Cra 3 # 4-5', '3003456789', 3),
(4, 'Colegio D', 'Cra 4 # 5-6', '3004567890', 4),
(5, 'Colegio E', 'Cra 5 # 6-7', '3005678901', 5);



CREATE TABLE Rector (
    ID_Rector INT PRIMARY KEY,
    Nombre VARCHAR(20) NOT NULL,
    Apellido VARCHAR(20),
    Genero VARCHAR(10) NOT NULL,
    Email VARCHAR(50) NOT NULL,
    Direccion VARCHAR(50) NOT NULL,
    Fecha_contratación DATETIME,
    Fecha_Nacimiento DATETIME,
    ID_Colegio INT,
    FOREIGN KEY (ID_Colegio) REFERENCES Colegio(ID_Colegio)
);

INSERT INTO Rector (ID_Rector, Nombre, Apellido, Genero, Email, Direccion, Fecha_contratación, Fecha_Nacimiento, ID_Colegio) VALUES
(1, 'María', 'Ortiz', 'Femenino', 'maria.ortiz@mail.com', 'Calle 100', '2016-03-25 08:30:00', '1978-04-15 00:00:00', 1),
(2, 'Juan', 'Álvarez', 'Masculino', 'juan.alvarez@mail.com', 'Calle 200', '2017-08-01 09:00:00', '1976-06-20 00:00:00', 2),
(3, 'Lucía', 'Hernández', 'Femenino', 'lucia.hernandez@mail.com', 'Calle 300', '2018-09-15 10:00:00', '1979-11-02 00:00:00', 3),
(4, 'Andrés', 'González', 'Masculino', 'andres.gonzalez@mail.com', 'Calle 400', '2019-02-10 09:30:00', '1981-01-17 00:00:00', 4),
(5, 'Valentina', 'Jiménez', 'Femenino', 'valentina.jimenez@mail.com', 'Calle 500', '2020-06-20 08:00:00', '1985-08-25 00:00:00', 5);


CREATE TABLE Secretaria_Colegio (
    ID_Secretaria INT PRIMARY KEY,
    Nombre VARCHAR(20) NOT NULL,
    Apellido VARCHAR(20),
	Genero VARCHAR(10) NOT NULL,
    Email VARCHAR(50) NOT NULL,
    Direccion VARCHAR(50) NOT NULL,
    Fecha_contratación DATETIME,
    Fecha_Nacimiento DATETIME,
    ID_Colegio INT,
    FOREIGN KEY (ID_Colegio) REFERENCES Colegio(ID_Colegio)
);


INSERT INTO Secretaria_Colegio (ID_Secretaria, Nombre, Apellido, Genero, Email, Direccion, Fecha_contratación, Fecha_Nacimiento, ID_Colegio) VALUES
(1, 'Gabriela', 'Cruz', 'Femenino', 'gabriela.cruz@mail.com', 'Calle 600', '2016-07-05 08:00:00', '1990-02-10 00:00:00', 1),
(2, 'Fernando', 'Pérez', 'Masculino', 'fernando.perez@mail.com', 'Calle 700', '2017-05-15 09:00:00', '1988-04-15 00:00:00', 2),
(3, 'Jessica', 'López', 'Femenino', 'jessica.lopez@mail.com', 'Calle 800', '2018-03-20 09:30:00', '1992-11-11 00:00:00', 3),
(4, 'Diego', 'Ramos', 'Masculino', 'diego.ramos@mail.com', 'Calle 900', '2019-08-25 10:00:00', '1985-07-17 00:00:00', 4),
(5, 'Isabel', 'Vargas', 'Femenino', 'isabel.vargas@mail.com', 'Calle 1000', '2020-04-12 08:30:00', '1993-05-05 00:00:00', 5);


CREATE TABLE Profesor (
    ID_Profesor INT PRIMARY KEY,
    Nombre VARCHAR(20) NOT NULL,
    Apellido VARCHAR(20),
    Genero VARCHAR(10) NOT NULL,
    Email VARCHAR(50) NOT NULL,
    Direccion VARCHAR(50) NOT NULL,
    Fecha_Nacimiento DATETIME,
    Titulo VARCHAR(150),
    ID_Colegio INT,
    FOREIGN KEY (ID_Colegio) REFERENCES Colegio(ID_Colegio)
);


INSERT INTO Profesor (ID_Profesor, Nombre, Apellido, Genero, Email, Direccion, Fecha_Nacimiento, ID_Colegio) VALUES
(1, 'Laura', 'Salazar', 'Femenino', 'laura.salazar@mail.com', 'Calle 110', '1987-06-18 00:00:00', 1),
(2, 'Jorge', 'Martínez', 'Masculino', 'jorge.martinez@mail.com', 'Calle 220', '1985-02-11 00:00:00', 2),
(3, 'Silvia', 'García', 'Femenino', 'silvia.garcia@mail.com', 'Calle 330', '1990-09-05 00:00:00', 3),
(4, 'Roberto', 'Cortez', 'Masculino', 'roberto.cortez@mail.com', 'Calle 440', '1982-12-25 00:00:00', 4),
(5, 'Patricia', 'Hernández', 'Femenino', 'patricia.hernandez@mail.com', 'Calle 550', '1989-03-13 00:00:00', 5);


CREATE TABLE Profesor_Colegio (
    ID_Profesor INT,
    ID_Colegio INT,
    Fecha_Contratacion DATETIME,
    PRIMARY KEY (ID_Profesor, ID_Colegio),
    FOREIGN KEY (ID_Profesor) REFERENCES Profesor(ID_Profesor),
    FOREIGN KEY (ID_Colegio) REFERENCES Colegio(ID_Colegio)
);

INSERT INTO Profesor_Colegio (ID_Profesor, ID_Colegio, Fecha_Contratacion) VALUES
(1, 1, '2016-07-05 08:00:00'), 
(2, 2, '2017-05-15 09:00:00'),  
(3, 3, '2018-03-20 09:30:00'), 
(4, 4, '2019-08-25 10:00:00'), 
(5, 5, '2020-04-12 08:30:00');  


CREATE TABLE Curso (
    ID_Curso INT PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Num_Estudiantes INT,
    ID_Colegio INT,
    FOREIGN KEY (ID_Colegio) REFERENCES Colegio(ID_Colegio)
);

INSERT INTO Curso (ID_Curso, Nombre, Num_Estudiantes, ID_Colegio) VALUES
(1, 'Octavo', 25, 1),
(2, 'Séptimo', 30, 2),
(3, 'Sexto', 20, 3),
(4, 'Quinto', 15, 4),
(5, 'Décimo', 28, 5);


CREATE TABLE Asignatura (
    ID_Asignatura INT PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    ID_Curso INT,
    FOREIGN KEY (ID_Curso) REFERENCES Curso(ID_Curso)
);


INSERT INTO Asignatura (ID_Asignatura, Nombre, ID_Curso) VALUES
(1, 'Álgebra', 1),  
(2, 'Biología', 2),  
(3, 'Geografía', 3), 
(4, 'Cuentos Clásicos', 4), 
(5, 'Entrenamiento Deportivo', 5);  


CREATE TABLE Profesor_Asignatura (
    ID_Profesor INT,
    ID_Asignatura INT,
    Fecha_Contratacion DATETIME,
    PRIMARY KEY (ID_Profesor, ID_Asignatura),
    FOREIGN KEY (ID_Profesor) REFERENCES Profesor(ID_Profesor),
    FOREIGN KEY (ID_Asignatura) REFERENCES Asignatura(ID_Asignatura)
);

INSERT INTO Profesor_Asignatura (ID_Profesor, ID_Asignatura, Fecha_Contratacion) VALUES
(1, 1, '2016-07-05 08:00:00'),  
(2, 2, '2017-05-15 09:00:00'),  
(3, 3, '2018-03-20 09:30:00'),  
(4, 4, '2019-08-25 10:00:00'),  
(5, 5, '2020-04-12 08:30:00'); 


CREATE TABLE Estudiante (
    ID_Estudiante INT PRIMARY KEY,
    Nombre VARCHAR(20) NOT NULL,
    Apellido VARCHAR(20),
    Fecha_Nacimiento DATETIME,
    ID_Colegio INT, 
    FOREIGN KEY (ID_Colegio) REFERENCES Colegio(ID_Colegio)
);


INSERT INTO Estudiante (ID_Estudiante, Nombre, Apellido, Fecha_Nacimiento, ID_Colegio) VALUES
(1, 'Ana', 'Torres', '2005-01-15 00:00:00', 1),
(2, 'Luis', 'Rojas', '2006-02-20 00:00:00', 2),
(3, 'Carmen', 'Pérez', '2004-03-30 00:00:00', 3),
(4, 'Diego', 'Cano', '2005-05-10 00:00:00', 4),
(5, 'Isabella', 'Suárez', '2007-08-22 00:00:00', 5);


CREATE TABLE Estudiante_Asignatura (
    ID_Estudiante INT,
    ID_Asignatura INT,
    Fecha_matricula DATETIME,
    PRIMARY KEY (ID_Estudiante, ID_Asignatura),
    FOREIGN KEY (ID_Estudiante) REFERENCES Estudiante(ID_Estudiante),
    FOREIGN KEY (ID_Asignatura) REFERENCES Asignatura(ID_Asignatura)
);

INSERT INTO Estudiante_Asignatura (ID_Estudiante, ID_Asignatura, Fecha_matricula) VALUES
(1, 1, '2023-01-15 00:00:00'), 
(2, 2, '2023-02-20 00:00:00'), 
(3, 3, '2023-03-30 00:00:00'),  
(4, 4, '2023-05-10 00:00:00'), 
(5, 5, '2023-08-22 00:00:00');  


-- (1)  Procedimientos para la tabla Departamento

-- Insertar Departamento
DELIMITER //
CREATE PROCEDURE InsertarDepartamento(
    IN IID_Departamento INT,
    IN I_Nombre VARCHAR(100)
)
BEGIN
    INSERT INTO Departamento (ID_Departamento, Nombre)
    VALUES (IID_Departamento, I_Nombre);
END //

DELIMITER ;

-- -- Actualizar Departamento
DELIMITER //
CREATE PROCEDURE ActualizarDepartamento(
    IN AID_Departamento INT,
    IN A_NuevoNombre VARCHAR(100)
)
BEGIN
    UPDATE Departamento
    SET Nombre = A_NuevoNombre
    WHERE ID_Departamento = AID_Departamento;
END//

DELIMITER ;

-- Eliminar Departamento
DELIMITER //
CREATE PROCEDURE EliminarDepartamento(
    IN EID_Departamento INT
)
BEGIN
    DELETE FROM Departamento
    WHERE ID_Departamento = EID_Departamento;
END//

DELIMITER ;

-- Seleccionar Departamento
DELIMITER //
CREATE PROCEDURE SeleccionarDepartamento()
BEGIN
    SELECT * FROM Departamento;
END;
//

DELIMITER ;


-- (2) Procedimientos para la tabla SecEducacion_Departamental

-- Insertar SecEducacion_Departamental
DELIMITER //
CREATE PROCEDURE InsertarSecEducacion_Departamental(
    IN IID_Secretaria INT,
    IN INombre VARCHAR(50),
    IN IDireccion VARCHAR(50),
    IN IEmail VARCHAR(50),
    IN IID_Departamento INT
)
BEGIN
    INSERT INTO SecEducacion_Departamental (ID_Secretaria, Nombre, Direccion, Email, ID_Departamento)
    VALUES (IID_Secretaria, INombre, IDireccion, IEmail, IID_Departamento);
END;//

DELIMITER ;

-- Actualizar SecEducacion_Departamental
DELIMITER //
CREATE PROCEDURE ActualizarSecEducacion_Departamental(
    IN IID_Secretaria INT,
    IN NuevoNombre VARCHAR(50),
    IN NuevaDireccion VARCHAR(50),
    IN NuevoEmail VARCHAR(50),
    IN NuevoID_Departamento INT
)
BEGIN
    UPDATE SecEducacion_Departamental
    SET Nombre = NuevoNombre,
        Direccion = NuevaDireccion,
        Email = NuevoEmail,
        ID_Departamento = NuevoID_Departamento
    WHERE ID_Secretaria = IID_Secretaria;
END;//

DELIMITER ;

-- Eliminar SecEducacion_Departamental
DELIMITER //
CREATE PROCEDURE EliminarSecEducacion_Departamental(
    IN EID_Secretaria INT
)
BEGIN
    DELETE FROM SecEducacion_Departamental
    WHERE ID_Secretaria = EID_Secretaria;
END;//
DELIMITER ;

-- Seleccionar SecEducacion_Departamental
DELIMITER //
CREATE PROCEDURE SeleccionarSecEducacion_Departamental()
BEGIN
    SELECT * FROM SecEducacion_Departamental;
END;//

DELIMITER ;


-- (3) Procedimientos para la tabla DirSecretaria_Educacion

-- Insertar DirSecretaria_Educacion
DELIMITER //
CREATE PROCEDURE InsertarDirSecretaria_Educacion(
    IN IID_Director INT,
    IN I_Nombre VARCHAR(20),
    IN I_Apellido VARCHAR(20),
    IN I_Genero VARCHAR(10),
    IN I_Email VARCHAR(50),
    IN I_Direccion VARCHAR(50),
    IN IFecha_contratacion DATETIME,
    IN IFecha_Nacimiento DATETIME,
    IN IID_Secretaria INT
)
BEGIN
    INSERT INTO DirSecretaria_Educacion (ID_Director, Nombre, Apellido, Genero, Email, Direccion, Fecha_contratación, Fecha_Nacimiento, ID_Secretaria)
    VALUES (IID_Director, I_Nombre, I_Apellido, I_Genero, I_Email, I_Direccion, IFecha_contratacion , IFecha_Nacimiento, IID_Secretaria);
END;//

DELIMITER ;

-- Actualizar DirSecretaria_Educacion
DELIMITER //
CREATE PROCEDURE ActualizarDirSecretaria_Educacion(
    IN IID_Director INT,
    IN NuevoNombre VARCHAR(20),
    IN NuevoApellido VARCHAR(20),
    IN NuevoGenero VARCHAR(10),
    IN NuevoEmail VARCHAR(50),
    IN NuevaDireccion VARCHAR(50),
    IN NuevaFecha_contratacion DATETIME,
    IN NuevaFecha_Nacimiento DATETIME,
    IN NuevoID_Secretaria INT
)
BEGIN
    UPDATE DirSecretaria_Educacion
    SET Nombre = NuevoNombre,
        Apellido = NuevoApellido,
        Genero = NuevoGenero,
        Email = NuevoEmail,
        Direccion = NuevaDireccion,
        Fecha_contratación = NuevaFecha_contratacion,
        Fecha_Nacimiento = NuevaFecha_Nacimiento,
        ID_Secretaria = NuevoID_Secretaria
    WHERE ID_Director = IID_Director;
END;//

DELIMITER ;

-- Eliminar DirSecretaria_Educacion
DELIMITER //
CREATE PROCEDURE EliminarDirSecretaria_Educacion(
    IN IID_Director INT
)
BEGIN
    DELETE FROM DirSecretaria_Educacion
    WHERE ID_Director = IID_Director;
END;//

DELIMITER ;

-- Seleccionar DirSecretaria_Educacion
DELIMITER //
CREATE PROCEDURE SeleccionarDirSecretaria_Educacion()
BEGIN
    SELECT * FROM DirSecretaria_Educacion;
END;//

DELIMITER ;


-- (4) Procedimientos para la tabla Regional

-- Insertar Regional
DELIMITER //
CREATE PROCEDURE InsertarRegional(
    IN IID_Regional INT,
    IN I_Nombre VARCHAR(20),
    IN IID_Secretaria INT
)
BEGIN
    INSERT INTO Regional (ID_Regional, Nombre, ID_Secretaria)
    VALUES (IID_Regional, I_Nombre, IID_Secretaria);
END;//

DELIMITER ;

-- Actualizar Regional
DELIMITER //
CREATE PROCEDURE ActualizarRegional(
    IN AID_Regional INT,
    IN NuevoNombre VARCHAR(20),
    IN NuevoID_Secretaria INT
)
BEGIN
    UPDATE Regional
    SET Nombre = NuevoNombre,
	ID_Secretaria = NuevoID_Secretaria
    WHERE ID_Regional = AID_Regional;
END;//

DELIMITER ;

-- Eliminar Regional
DELIMITER //
CREATE PROCEDURE EliminarRegional(
    IN IID_Regional INT
)
BEGIN
    DELETE FROM Regional
    WHERE ID_Regional = IID_Regional;
END;//

DELIMITER ;

-- Seleccionar Regional
DELIMITER //
CREATE PROCEDURE SeleccionarRegional()
BEGIN
    SELECT * FROM Regional;
END;//

DELIMITER ;


-- (5) Procedimientos para la tabla DirRegional

-- Insertar DirRegional
DELIMITER //
CREATE PROCEDURE InsertarDirRegional(
    IN IID_DirRegional INT,
    IN I_Nombre VARCHAR(20),
    IN I_Apellido VARCHAR(20),
    IN I_Genero VARCHAR(10),
    IN I_Email VARCHAR(50),
    IN I_Direccion VARCHAR(50),
    IN IFecha_Contratacion DATETIME,
    IN IFecha_Nacimiento DATETIME,
    IN IID_Regional INT
)
BEGIN
    INSERT INTO Dir_Regional (ID_DirRegional, Nombre, Apellido, Genero, Email, Direccion, Fecha_contratación, Fecha_Nacimiento, ID_Regional)
    VALUES (IID_DirRegional, I_Nombre, I_Apellido, I_Genero, I_Email, I_Direccion, IFecha_Contratacion, IFecha_Nacimiento, IID_Regional);
END;//

DELIMITER ;

-- Actualizar DirRegional
DELIMITER //
CREATE PROCEDURE ActualizarDirRegional(
    IN AID_DirRegional INT,
    IN NuevoNombre VARCHAR(20),
    IN NuevoApellido VARCHAR(20),
    IN NuevoGenero VARCHAR(10),
    IN NuevoEmail VARCHAR(50),
    IN NuevoDireccion VARCHAR(50),
    IN NuevoFecha_Contratacion DATETIME,
    IN NuevoFecha_Nacimiento DATETIME,
    IN AID_Regional INT
)
BEGIN
    UPDATE Dir_Regional
    SET Nombre = NuevoNombre,
        Apellido = NuevoApellido,
        Genero = NuevoGenero,
        Email = NuevoEmail,
        Direccion = NuevoDireccion ,
        Fecha_contratación = NuevoFecha_Contratacion,
        Fecha_Nacimiento = NuevoFecha_Nacimiento,
        ID_Regional = AID_Regional
    WHERE ID_DirRegional = AID_DirRegional;
END;//

DELIMITER ;


-- Eliminar DirRegional
DELIMITER //
CREATE PROCEDURE EliminarDirRegional(
    IN EID_DirRegional INT
)
BEGIN
    DELETE FROM Dir_Regional
    WHERE ID_DirRegional = EID_DirRegional;
END;//

DELIMITER ;

-- Seleccionar DirRegional
DELIMITER //
CREATE PROCEDURE SeleccionarDirRegional()
BEGIN
    SELECT * FROM Dir_Regional;
END;//

DELIMITER ;

-- (6) Procedimientos para la tabla Ciudad

-- Insertar Ciudad
DELIMITER //
CREATE PROCEDURE InsertarCiudad(
    IN IID_Ciudad INT,
    IN I_Nombre VARCHAR(50),
    IN IID_Regional INT
)
BEGIN
    INSERT INTO Ciudad (ID_Ciudad, Nombre, ID_Regional)
    VALUES (IID_Ciudad, I_Nombre, IID_Regional);
END;//

DELIMITER ;

-- Actualizar
DELIMITER //
CREATE PROCEDURE ActualizarCiudad(
    IN AID_Ciudad INT,
    IN NuevoNombre VARCHAR(50),
    IN AID_Regional INT
)
BEGIN
    UPDATE Ciudad
    SET Nombre = NuevoNombre,
        ID_Regional = AID_Regional
    WHERE ID_Ciudad = AID_Ciudad;
END;//

DELIMITER ;

-- Eliminar
DELIMITER //
CREATE PROCEDURE EliminarCiudad(
    IN EID_Ciudad INT
)
BEGIN
    DELETE FROM Ciudad
    WHERE ID_Ciudad = EID_Ciudad;
END;//

DELIMITER ;

-- Seleccionar
DELIMITER //
CREATE PROCEDURE SeleccionarCiudad()
BEGIN
    SELECT * FROM Ciudad;
END;//

DELIMITER ;


-- (7) Procedimientos para la tabla Comuna
-- Insertar Comuna

DELIMITER //
CREATE PROCEDURE InsertarComuna(
    IN IID_Comuna INT,
    IN I_Nombre VARCHAR(50),
    IN I_ID_Ciudad INT
)
BEGIN
    INSERT INTO Comuna (ID_Comuna, Nombre, ID_Ciudad)
    VALUES (IID_Comuna, I_Nombre, I_ID_Ciudad);
END;//

DELIMITER ;

-- Actualizar
DELIMITER //
CREATE PROCEDURE ActualizarComuna(
    IN AID_Comuna INT,
    IN NuevoNombre VARCHAR(50),
    IN AID_Ciudad INT
)
BEGIN
    UPDATE Comuna
    SET Nombre = NuevoNombre,
        ID_Ciudad = AID_Ciudad
    WHERE ID_Comuna = AID_Comuna;
END;//

DELIMITER ;

-- Eliminar
DELIMITER //
CREATE PROCEDURE EliminarComuna(
    IN EID_Comuna INT
)
BEGIN
    DELETE FROM Comuna
    WHERE ID_Comuna = EID_Comuna;
END;//

DELIMITER ;

-- Seleccionar
DELIMITER //
CREATE PROCEDURE SeleccionarComuna()
BEGIN
    SELECT * FROM Comuna;
END;//

DELIMITER ;


-- (8) Procedimientos para la tabla DirComuna
-- Insertar DirComuna

DELIMITER //
CREATE PROCEDURE InsertarDirectorComuna(
    IN IID_Director INT,
    IN I_Nombre VARCHAR(20),
    IN I_Apellido VARCHAR(20),
    IN I_Genero VARCHAR(10),
    IN I_Email VARCHAR(50),
    IN I_Direccion VARCHAR(50),
    IN IFecha_Contratacion DATETIME,
    IN IFecha_Nacimiento DATETIME,
    IN IID_Comuna INT
)
BEGIN
    INSERT INTO Director_Comuna (ID_Director, Nombre, Apellido, Genero, Email, Direccion, Fecha_contratación, Fecha_Nacimiento, ID_Comuna)
    VALUES (IID_Director, I_Nombre, I_Apellido, I_Genero, I_Email, I_Direccion, IFecha_Contratacion, IFecha_Nacimiento, IID_Comuna);
END;//

DELIMITER ;

-- Actualizar
DELIMITER //
CREATE PROCEDURE ActualizarDirectorComuna(
    IN AID_Director INT,
    IN NuevoNombre VARCHAR(20),
    IN NuevoApellido VARCHAR(20),
    IN NuevoGenero VARCHAR(10),
    IN NuevoEmail VARCHAR(50),
    IN NuevoDireccion VARCHAR(50),
    IN NuevoFecha_Contratacion DATETIME,
    IN NuevoFecha_Nacimiento DATETIME,
    IN AID_Comuna INT
)
BEGIN
    UPDATE Director_Comuna
    SET Nombre = NuevoNombre,
        Apellido = NuevoApellido,
        Genero = NuevoGenero,
        Email = NuevoEmail,
        Direccion = NuevoDireccion,
        Fecha_contratación = NuevoFecha_Contratacion,
        Fecha_Nacimiento = NuevoFecha_Nacimiento,
        ID_Comuna = AID_Comuna
    WHERE ID_Director = AID_Director;
END;//

DELIMITER ;


-- Eliminar
DELIMITER //
CREATE PROCEDURE EliminarDirectorComuna(
    IN EID_Director INT
)
BEGIN
    DELETE FROM Director_Comuna
    WHERE ID_Director = EID_Director;
END;//

DELIMITER ;


-- Seleccionar
DELIMITER //
CREATE PROCEDURE SeleccionarDirectorComuna()
BEGIN
    SELECT * FROM Director_Comuna;
END;//

DELIMITER ;


-- (9) Procedimientos para la tabla Colegio

-- Insertar Colegio
DELIMITER //
CREATE PROCEDURE InsertarColegio(
    IN IID_Colegio INT,
    IN I_Nombre VARCHAR(50),
    IN I_Direccion VARCHAR(50),
    IN I_Telefono VARCHAR(20),
    IN IID_Comuna INT
)
BEGIN
    INSERT INTO Colegio (ID_Colegio, Nombre, Direccion, Telefono, ID_Comuna)
    VALUES (IID_Colegio, I_Nombre, I_Direccion, I_Telefono, IID_Comuna);
END;//

DELIMITER ;

-- Actualizar
DELIMITER //
CREATE PROCEDURE ActualizarColegio(
    IN AID_Colegio INT,
    IN NuevoNombre VARCHAR(50),
    IN NuevoDireccion VARCHAR(50),
    IN NuevoTelefono VARCHAR(20),
    IN AID_Comuna INT
)
BEGIN
    UPDATE Colegio
    SET Nombre = NuevoNombre,
        Direccion = NuevoDireccion,
        Telefono = NuevoTelefono,
        ID_Comuna = AID_Comuna
    WHERE ID_Colegio = AID_Colegio;
END;//

DELIMITER ;


-- Eliminar
DELIMITER //
CREATE PROCEDURE EliminarColegio(
    IN EID_Colegio INT
)
BEGIN
    DELETE FROM Colegio
    WHERE ID_Colegio = EID_Colegio;
END;//

DELIMITER ;



-- Seleccionar
DELIMITER //
CREATE PROCEDURE SeleccionarColegio()
BEGIN
    SELECT * FROM Colegio;
END;//

DELIMITER ;


-- (10) Procedimientos para la tabla Rector
-- Insertar Rector

DELIMITER //
CREATE PROCEDURE InsertarRector(
    IN IID_Rector INT,
    IN I_Nombre VARCHAR(20),
    IN I_Apellido VARCHAR(20),
    IN I_Genero VARCHAR(10),
    IN I_Email VARCHAR(50),
    IN I_Direccion VARCHAR(50),
    IN IFecha_Contratacion DATETIME,
    IN IFecha_Nacimiento DATETIME,
    IN IID_Colegio INT
)
BEGIN
    INSERT INTO Rector (ID_Rector, Nombre, Apellido, Genero, Email, Direccion, Fecha_contratación, Fecha_Nacimiento, ID_Colegio)
    VALUES (IID_Rector, I_Nombre, I_Apellido, I_Genero, I_Email, I_Direccion, IFecha_Contratacion, IFecha_Nacimiento, IID_Colegio);
END;//

DELIMITER ;

-- Actualizar
DELIMITER //
CREATE PROCEDURE ActualizarRector(
    IN AID_Rector INT,
    IN NuevoNombre VARCHAR(20),
    IN NuevoApellido VARCHAR(20),
    IN NuevoGenero VARCHAR(10),
    IN NuevoEmail VARCHAR(50),
    IN NuevoDireccion VARCHAR(50),
    IN NuevoFecha_Contratacion DATETIME,
    IN NuevoFecha_Nacimiento DATETIME,
    IN AID_Colegio INT
)
BEGIN
    UPDATE Rector
    SET Nombre = NuevoNombre,
        Apellido = NuevoApellido,
        Genero = NuevoGenero,
        Email = NuevoEmail,
        Direccion = NuevoDireccion,
        Fecha_contratación = NuevoFecha_Contratacion,
        Fecha_Nacimiento = NuevoFecha_Nacimiento,
        ID_Colegio = AID_Colegio
    WHERE ID_Rector = AID_Rector;
END;//

DELIMITER ;


-- Eliminar
DELIMITER //
CREATE PROCEDURE EliminarRector(
    IN EID_Rector INT
)
BEGIN
    DELETE FROM Rector
    WHERE ID_Rector = EID_Rector;
END;//

DELIMITER ;

-- Seleccionar
DELIMITER //
CREATE PROCEDURE SeleccionarRector()
BEGIN
    SELECT * FROM Rector;
END;//

DELIMITER ;


-- (11)  Procedimientos para la tabla Secretaria_Colegio
-- Insertar Secretaria
DELIMITER //
CREATE PROCEDURE InsertarSecretariaColegio(
    IN IID_Secretaria INT,
    IN I_Nombre VARCHAR(20),
    IN I_Apellido VARCHAR(20),
    IN I_Genero VARCHAR(10),
    IN I_Email VARCHAR(50),
    IN I_Direccion VARCHAR(50),
    IN IFecha_Contratacion DATETIME,
    IN IFecha_Nacimiento DATETIME,
    IN IID_Colegio INT
)
BEGIN
    INSERT INTO Secretaria_Colegio (ID_Secretaria, Nombre, Apellido, Genero, Email, Direccion, Fecha_contratación, Fecha_Nacimiento, ID_Colegio)
    VALUES (IID_Secretaria, I_Nombre, I_Apellido, I_Genero, I_Email, I_Direccion, IFecha_Contratacion, IFecha_Nacimiento, IID_Colegio);
END;//

DELIMITER ;


-- Actualizar
DELIMITER //
CREATE PROCEDURE ActualizarSecretariaColegio(
    IN AID_Secretaria INT,
    IN NuevoNombre VARCHAR(20),
    IN NuevoApellido VARCHAR(20),
    IN NuevoGenero VARCHAR(10),
    IN NuevoEmail VARCHAR(50),
    IN NuevoDireccion VARCHAR(50),
    IN NuevoFecha_Contratacion DATETIME,
    IN NuevoFecha_Nacimiento DATETIME,
    IN AID_Colegio INT
)
BEGIN
    UPDATE Secretaria_Colegio
    SET Nombre = NuevoNombre,
        Apellido = NuevoApellido,
        Genero = NuevoGenero,
        Email = NuevoEmail,
        Direccion = NuevoDireccion,
        Fecha_contratación = NuevoFecha_Contratacion,
        Fecha_Nacimiento = NuevoFecha_Nacimiento,
        ID_Colegio = AID_Colegio
    WHERE ID_Secretaria = AID_Secretaria;
END;//

DELIMITER ;

-- Eliminar
DELIMITER //
CREATE PROCEDURE EliminarSecretariaColegio(
    IN EID_Secretaria INT
)
BEGIN
    DELETE FROM Secretaria_Colegio
    WHERE ID_Secretaria = EID_Secretaria;
END;//

DELIMITER ;

-- Seleccionar
DELIMITER //
CREATE PROCEDURE SeleccionarSecretariaColegio()
BEGIN
    SELECT * FROM Secretaria_Colegio;
END;//

DELIMITER ;

-- (12) Procedimientos para la tabla Profesor

-- Insertar Profesor
DELIMITER //
CREATE PROCEDURE InsertarProfesor(
    IN IID_Profesor INT,
    IN I_Nombre VARCHAR(20),
    IN I_Apellido VARCHAR(20),
    IN I_Genero VARCHAR(10),
    IN I_Email VARCHAR(50),
    IN I_Direccion VARCHAR(50),
    IN IFecha_Nacimiento DATETIME,
    IN ITitulo VARCHAR(150),
    IN IID_Colegio INT
)
BEGIN
    INSERT INTO Profesor (ID_Profesor, Nombre, Apellido, Genero, Email, Direccion, Fecha_Nacimiento, Titulo, ID_Colegio)
    VALUES (IID_Profesor, I_Nombre, I_Apellido, I_Genero, I_Email, I_Direccion, IFecha_Nacimiento, ITitulo, IID_Colegio);
END;//

DELIMITER ;


-- Actualizar
DELIMITER //
CREATE PROCEDURE ActualizarProfesor(
    IN AID_Profesor INT,
    IN NuevoNombre VARCHAR(20),
    IN NuevoApellido VARCHAR(20),
    IN NuevoGenero VARCHAR(10),
    IN NuevoEmail VARCHAR(50),
    IN NuevoDireccion VARCHAR(50),
    IN NuevoFecha_Nacimiento DATETIME,
    IN NuevoTitulo VARCHAR(150),
    IN AID_Colegio INT
)
BEGIN
    UPDATE Profesor
    SET Nombre = NuevoNombre,
        Apellido = NuevoApellido,
        Genero = NuevoGenero,
        Email = NuevoEmail,
        Direccion = NuevoDireccion,
        Fecha_Nacimiento = NuevoFecha_Nacimiento,
        Titulo = NuevoTitulo,
        ID_Colegio = AID_Colegio
    WHERE ID_Profesor = AID_Profesor;
END;//

DELIMITER ;


-- Eliminar
DELIMITER //
CREATE PROCEDURE EliminarProfesor(
    IN EID_Profesor INT
)
BEGIN
    DELETE FROM Profesor
    WHERE ID_Profesor = EID_Profesor;
END;//

DELIMITER ;


-- Seleccionar
DELIMITER //
CREATE PROCEDURE SeleccionarProfesor()
BEGIN
    SELECT * FROM Profesor;
END;//

DELIMITER ;


-- (13) Procedimientos para la tabla Profesor-Colegio
-- Insertar Profesor-Colegio

-- Insertar
DELIMITER //
CREATE PROCEDURE InsertarProfesorColegio(
    IN IID_Profesor INT,
    IN IID_Colegio INT,
    IN IFecha_Contratacion DATETIME
)
BEGIN
    INSERT INTO Profesor_Colegio (ID_Profesor, ID_Colegio, Fecha_Contratacion)
    VALUES (IID_Profesor, IID_Colegio, IFecha_Contratacion);
END;//

DELIMITER ;


-- Actualizar
DELIMITER //
CREATE PROCEDURE ActualizarProfesorColegio(
    IN AID_Profesor INT,
    IN AID_Colegio INT,
    IN NuevoFecha_Contratacion DATETIME
)
BEGIN
    UPDATE Profesor_Colegio
    SET Fecha_Contratacion = NuevoFecha_Contratacion
    WHERE ID_Profesor = AID_Profesor AND ID_Colegio = AID_Colegio ;
END;//

DELIMITER ;

-- Eliminar
DELIMITER //
CREATE PROCEDURE EliminarProfesorColegio(
    IN EID_Profesor INT,
    IN EID_Colegio INT
)
BEGIN
    DELETE FROM Profesor_Colegio
    WHERE ID_Profesor = EID_Profesor AND ID_Colegio = EID_Colegio;
END;//

DELIMITER ;


-- Seleccionar
DELIMITER //
CREATE PROCEDURE SeleccionarProfesorColegio()
BEGIN
    SELECT * FROM Profesor_Colegio;
END;//

DELIMITER ;

-- (14) Procedimientos para la tabla Curso

-- Insertar Curso
DELIMITER //
CREATE PROCEDURE InsertarCurso(
    IN IID_Curso INT,
    IN I_Nombre VARCHAR(50),
    IN INum_Estudiantes INT,
    IN IID_Colegio INT
)
BEGIN
    INSERT INTO Curso (ID_Curso, Nombre, Num_Estudiantes, ID_Colegio)
    VALUES (IID_Curso, I_Nombre, INum_Estudiantes, IID_Colegio);
END;//

DELIMITER ;

-- Actualizar
DELIMITER //
CREATE PROCEDURE ActualizarCurso(
    IN AID_Curso INT,
    IN NuevoNombre VARCHAR(50),
    IN NuevoNum_Estudiantes INT,
    IN AID_Colegio INT
)
BEGIN
    UPDATE Curso
    SET Nombre = NuevoNombre,
        Num_Estudiantes = NuevoNum_Estudiantes,
        ID_Colegio = AID_Colegio
    WHERE ID_Curso = AID_Curso;
END;//

DELIMITER ;


-- Eliminar
DELIMITER //
CREATE PROCEDURE EliminarCurso(
    IN EID_Curso INT
)
BEGIN
    DELETE FROM Curso
    WHERE ID_Curso = EID_Curso;
END;//

DELIMITER ;


-- Seleccionar
DELIMITER //
CREATE PROCEDURE SeleccionarCurso()
BEGIN
    SELECT * FROM Curso;
END;//

DELIMITER ;

-- (15) Procedimientos para la tabla Asignatura

-- Insertar Asignatura
DELIMITER //
CREATE PROCEDURE InsertarAsignatura(
    IN IID_Asignatura INT,
    IN I_Nombre VARCHAR(50),
    IN IID_Curso INT
)
BEGIN
    INSERT INTO Asignatura (ID_Asignatura, Nombre, ID_Curso)
    VALUES (IID_Asignatura, I_Nombre, IID_Curso);
END;//

DELIMITER ;

-- Actualizar
DELIMITER //
CREATE PROCEDURE ActualizarAsignatura(
    IN AID_Asignatura INT,
    IN I_Nombre VARCHAR(50),
    IN AID_Curso INT
)
BEGIN
    UPDATE Asignatura
    SET Nombre = I_Nombre,
        ID_Curso = AID_Curso
    WHERE ID_Asignatura = AID_Asignatura;
END;//

DELIMITER ;


-- Eliminar
DELIMITER //
CREATE PROCEDURE EliminarAsignatura(
    IN EID_Asignatura INT
)
BEGIN
    DELETE FROM Asignatura
    WHERE ID_Asignatura = EID_Asignatura;
END;//

DELIMITER ;

-- Seleccionar
DELIMITER //
CREATE PROCEDURE SeleccionarAsignatura()
BEGIN
    SELECT * FROM Asignatura;
END;//

DELIMITER ;


-- (16)  Procedimientos para la tabla Profesor-Asignatura

-- Insertar Profesor-Asignatura
DELIMITER //
CREATE PROCEDURE InsertarProfesorAsignatura(
    IN IID_Profesor INT,
    IN IID_Asignatura INT,
    IN IFecha_Contratacion DATETIME
)
BEGIN
    INSERT INTO Profesor_Asignatura (ID_Profesor, ID_Asignatura, Fecha_Contratacion)
    VALUES (ID_Profesor, IID_Asignatura, IFecha_Contratacion);
END;//

DELIMITER ;

-- Actualizar
DELIMITER //
CREATE PROCEDURE ActualizarProfesorAsignatura(
    IN AID_Profesor INT,
    IN AID_Asignatura INT,
    IN NuevoFecha_Contratacion DATETIME
)
BEGIN
    UPDATE Profesor_Asignatura
    SET Fecha_Contratacion = NuevoFecha_Contratacion
    WHERE ID_Profesor = AID_Profesor AND ID_Asignatura = AID_Asignatura;
END;//

DELIMITER ;

-- Eliminar
DELIMITER //
CREATE PROCEDURE EliminarProfesorAsignatura(
    IN EID_Profesor INT,
    IN EID_Asignatura INT
)
BEGIN
    DELETE FROM Profesor_Asignatura
    WHERE ID_Profesor = EID_Profesor AND ID_Asignatura = EID_Asignatura;
END;//

DELIMITER ;

-- Seleccionar
DELIMITER //
CREATE PROCEDURE SeleccionarProfesorAsignatura()
BEGIN
    SELECT * FROM Profesor_Asignatura;
END;//

DELIMITER ;

-- (17) Procedimientos para la tabla Estudiante

-- Insertar Estudiante
DELIMITER //
CREATE PROCEDURE InsertarEstudiante(
    IN IID_Estudiante INT,
    IN I_Nombre VARCHAR(20),
    IN I_Apellido VARCHAR(20),
    IN IFecha_Nacimiento DATETIME,
    IN IID_Colegio INT
)
BEGIN
    INSERT INTO Estudiante (ID_Estudiante, Nombre, Apellido, Fecha_Nacimiento, ID_Colegio)
    VALUES (IID_Estudiante, I_Nombre, I_Apellido, IFecha_Nacimiento, IID_Colegio);
END;//

DELIMITER ;


-- Actualizar
DELIMITER //
CREATE PROCEDURE ActualizarEstudiante(
    IN AID_Estudiante INT,
    IN NuevoNombre VARCHAR(20),
    IN NuevoApellido VARCHAR(20),
    IN NuevoFecha_Nacimiento DATETIME,
    IN AID_Colegio INT
)
BEGIN
    UPDATE Estudiante
    SET Nombre = NuevoNombre,
        Apellido = NuevoApellido,
        Fecha_Nacimiento = NuevoFecha_Nacimiento,
        ID_Colegio = AID_Colegio
    WHERE ID_Estudiante = AID_Estudiante;
END;//

DELIMITER ;

-- Eliminar
DELIMITER //
CREATE PROCEDURE EliminarEstudiante(
    IN EID_Estudiante INT
)
BEGIN
    DELETE FROM Estudiante
    WHERE ID_Estudiante = EID_Estudiante;
END;//

DELIMITER ;

-- Seleccionar
DELIMITER //
CREATE PROCEDURE SeleccionarEstudiante()
BEGIN
    SELECT * FROM Estudiante;
END;//

DELIMITER ;

-- (18) Procedimientos para la tabla Estudiante- Asignatura

-- Insertar Estudiante- Asignatura
DELIMITER //
CREATE PROCEDURE InsertarEstudianteAsignatura(
    IN IID_Estudiante INT,
    IN IID_Asignatura INT,
    IN IFecha_matricula DATETIME
)
BEGIN
    INSERT INTO Estudiante_Asignatura (ID_Estudiante, ID_Asignatura, Fecha_matricula)
    VALUES (IID_Estudiante, IID_Asignatura, IFecha_matricula);
END;//

DELIMITER ;

-- Actualizar
DELIMITER //
CREATE PROCEDURE ActualizarEstudianteAsignatura(
    IN AID_Estudiante INT,
    IN AID_Asignatura INT,
    IN NuevoFecha_matricula DATETIME
)
BEGIN
    UPDATE Estudiante_Asignatura
    SET Fecha_matricula = NuevoFecha_matricula
    WHERE ID_Estudiante = AID_Estudiante AND ID_Asignatura = AID_Asignatura;
END;//

DELIMITER ;

-- Eliminar
DELIMITER //
CREATE PROCEDURE EliminarEstudianteAsignatura(
    IN EID_Estudiante INT,
    IN EID_Asignatura INT
)
BEGIN
    DELETE FROM Estudiante_Asignatura
    WHERE ID_Estudiante = EID_Estudiante AND ID_Asignatura = EID_Asignatura;
END;//

DELIMITER ;

-- Seleccionar
DELIMITER //
CREATE PROCEDURE SeleccionarEstudianteAsignatura()
BEGIN
    SELECT * FROM Estudiante_Asignatura;
END;//

DELIMITER ;

















