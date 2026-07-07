-- ================= DATOS =================

INSERT INTO participantes VALUES
('12345678','Juan Perez','Ninguna','Ciudadano',
'juan@gmail.com','123456',GETDATE(),'Activo'),

('87654321','Maria Lopez','Empresa Verde SAC','Empresa',
'maria@gmail.com','abcdef',GETDATE(),'Activo'),

('11223344','Carlos Ruiz','EcoLife ONG','Organizacion',
'carlos@gmail.com','pass123',GETDATE(),'Activo');

INSERT INTO proyectos VALUES
('Reciclaje Urbano',
'Programa de reciclaje en zonas urbanas',
'Reciclaje','Alto','Lima',
GETDATE(),GETDATE(),'Activo'),

('Energia Solar',
'Implementacion de paneles solares',
'Energia','Alto','Cusco',
GETDATE(),GETDATE(),'Activo');

INSERT INTO categorias VALUES
('Reciclaje'),
('Energia');

INSERT INTO actividades VALUES
(1,
'Recoleccion',
'Recolectar residuos reciclables',
GETDATE(),
GETDATE(),
'En proceso');

INSERT INTO reportes VALUES
(1,
'Reporte Inicial',
'Reporte del avance del proyecto de reciclaje',
GETDATE(),
'Avance'),
(2,
'Reporte Solar',
'Reporte de implementacion de paneles solares',
GETDATE(),
'Impacto');

INSERT INTO aportes VALUES
(1,1,150.00,GETDATE(),'Yape','Completado'),
(2,2,300.00,GETDATE(),'Transferencia','Pendiente');

INSERT INTO comentarios VALUES
(1,1,
'Excelente iniciativa ambiental',
GETDATE(),5),

(2,2,
'Muy buen proyecto sostenible',
GETDATE(),4);

INSERT INTO direcciones VALUES
(1,'Av. Los Alamos 123'),
(2,'Jr. Primavera 456'),
(3,'Av. Central 789');

INSERT INTO telefonos VALUES
(1,'987654321'),
(2,'912345678'),
(3,'999888777');

INSERT INTO equipo_proyecto VALUES
(1,1,'Coordinador'),
(2,1,'Supervisor'),
(3,2,'Asesor');

INSERT INTO metricas_ambientales VALUES
(1,'CO2 Reducido',250.50,GETDATE()),
(2,'Energia Ahorrada',500.75,GETDATE());

INSERT INTO proyecto_categorias VALUES
(1,1),
(2,2);

INSERT INTO recursos VALUES
('Contenedores','Material',20),
('Panel Solar','Equipo',15);

INSERT INTO recursos_actividad VALUES
(1,1);

INSERT INTO responsables_actividad VALUES
(1,1),
(1,2);