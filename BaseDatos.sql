CREATE USER 'user_colegios'@'localhost' IDENTIFIED BY 'Colegios2024';
GRANT CREATE, INSERT, UPDATE, DELETE, SELECT, EXECUTE ON db_colegios.* TO 'user_colegios'@'localhost';
CREATE DATABASE db_colegios;

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
    ID_Departamento INT,
    FOREIGN KEY (ID_Departamento) REFERENCES Departamento(ID_Departamento)
);


INSERT INTO Regional (ID_Regional, Nombre, ID_Departamento) VALUES
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


// los directores, las secretarías que dirigen y los departamentos a los que están asociados
DELIMITER $$
CREATE PROCEDURE proc_select_dir_secretarias()
BEGIN 
    SELECT ds.ID_Director, ds.Nombre AS director_nombre, ds.Apellido, 
           se.Nombre AS secretaria_nombre, d.Nombre AS departamento_nombre
    FROM DirSecretaria_Educacion ds
    INNER JOIN SecEducacion_Departamental se ON ds.ID_Secretaria = se.ID_Secretaria
    INNER JOIN Departamento d ON se.ID_Departamento = d.ID_Departamento;
END$$



// permite seleccionar todos los directores de las secretarías de educación de un departamento específico.

DELIMITER //

CREATE PROCEDURE GetDirectoresByDepartamento(IN departamento_id INT)
BEGIN
    SELECT d.ID_Director, d.Nombre, d.Apellido, d.Email
    FROM DirSecretaria_Educacion d
    JOIN SecEducacion_Departamental s ON d.ID_Secretaria = s.ID_Secretaria
    WHERE s.ID_Departamento = departamento_id;
END //

DELIMITER ;


// permite insertar un nuevo colegio en la base de datos.

DELIMITER //

CREATE PROCEDURE InsertColegio2(
    IN id_colegio INT,
    IN nombre VARCHAR(50),
    IN direccion VARCHAR(50),
    IN telefono VARCHAR(20),
    IN id_comuna INT
)
BEGIN
    INSERT INTO Colegio (ID_Colegio, Nombre, Direccion, Telefono, ID_Comuna)
    VALUES (id_colegio, nombre, direccion, telefono, id_comuna);
END //

DELIMITER ;


// Este procedimiento actualiza la dirección y el teléfono de un colegio existente.

DELIMITER //

CREATE PROCEDURE UpdateColegio(
    IN id_colegio INT,
    IN nueva_direccion VARCHAR(50),
    IN nuevo_telefono VARCHAR(20)
)
BEGIN
    UPDATE Colegio
    SET Direccion = nueva_direccion, Telefono = nuevo_telefono
    WHERE ID_Colegio = id_colegio;
END //

DELIMITER ;

// Este procedimiento elimina un director de una comuna específica.

DELIMITER //

CREATE PROCEDURE DeleteDirector(
    IN id_director INT
)
BEGIN
    DELETE FROM Director_Comuna
    WHERE ID_Director = id_director;
END //

DELIMITER ;

// Este procedimiento devuelve el número de colegios por departamento

DELIMITER //

CREATE PROCEDURE GetColegiosCountByDepartamento()
BEGIN
    SELECT d.Nombre AS Departamento, COUNT(c.ID_Colegio) AS Total_Colegios
    FROM Departamento d
    LEFT JOIN Comuna cm ON cm.ID_Ciudad IN (SELECT ID_Ciudad FROM Ciudad WHERE ID_Regional IN (SELECT ID_Regional FROM Regional WHERE ID_Departamento = d.ID_Departamento))
    LEFT JOIN Colegio c ON c.ID_Comuna = cm.ID_Comuna
    GROUP BY d.ID_Departamento;
END //

DELIMITER ;
