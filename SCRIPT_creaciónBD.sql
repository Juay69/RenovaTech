CREATE DATABASE Empresa__Ambiental;
GO

USE Empresa__Ambiental;
GO

-- ================= TABLAS =================

CREATE TABLE participantes(
    ID_participante INT IDENTITY(1,1) PRIMARY KEY,
    DNI CHAR(8) NOT NULL,
    nombres VARCHAR(100) NOT NULL,
    razon_social VARCHAR(200) NOT NULL,
    tipo VARCHAR(50) NOT NULL,
    correo VARCHAR(150) NOT NULL,
    contrasena_acceso VARCHAR(120) NOT NULL,
    fecha_registro DATETIME NOT NULL,
    estado_cuenta VARCHAR(12) NOT NULL
);

CREATE TABLE proyectos(
    ID_proyecto INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(300) NOT NULL,
    tipo VARCHAR(30) NOT NULL,
    nivel_impacto VARCHAR(50) NOT NULL,
    ubicacion VARCHAR(150) NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    estado VARCHAR(20) NOT NULL
);

CREATE TABLE categorias(
    ID_categoria INT IDENTITY(1,1) PRIMARY KEY,
    categoria VARCHAR(40) NOT NULL
);

CREATE TABLE actividades(
    ID_actividad INT IDENTITY(1,1) PRIMARY KEY,
    ID_proyecto INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(300) NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    estado VARCHAR(15) NOT NULL
);

CREATE TABLE aportes(
    ID_aporte INT IDENTITY(1,1) PRIMARY KEY,
    ID_proyecto INT NOT NULL,
    ID_participante INT NOT NULL,
    monto NUMERIC(10,2) NOT NULL,
    fecha DATETIME NOT NULL,
    medio_pago VARCHAR(20) NOT NULL,
    estado_transaccion VARCHAR(15) NOT NULL
);

CREATE TABLE comentarios(
    ID_comentario INT IDENTITY(1,1) PRIMARY KEY,
    ID_participante INT NOT NULL,
    ID_proyecto INT NOT NULL,
    mensaje VARCHAR(300) NOT NULL,
    fecha DATETIME NOT NULL,
    calificacion INT NOT NULL
);

CREATE TABLE direcciones(
    ID_participante INT NOT NULL,
    direccion VARCHAR(150) NOT NULL,
    PRIMARY KEY (ID_participante)
);

CREATE TABLE telefonos(
    ID_participante INT NOT NULL,
    telefono VARCHAR(15) NOT NULL,
    PRIMARY KEY (ID_participante)
);

CREATE TABLE equipo_proyecto(
    ID_participante INT NOT NULL,
    ID_proyecto INT NOT NULL,
    rol_participante VARCHAR(30) NOT NULL,
    PRIMARY KEY (ID_participante, ID_proyecto)
);

CREATE TABLE metricas_ambientales(
    ID_metricas INT IDENTITY(1,1) PRIMARY KEY,
    ID_proyecto INT NOT NULL,
    tipo_indicador VARCHAR(50) NOT NULL,
    valor_medido NUMERIC(10,2) NOT NULL,
    fecha_registro DATETIME NOT NULL
);

CREATE TABLE proyecto_categorias(
    ID_proyecto INT NOT NULL,
    ID_categoria INT NOT NULL,
    PRIMARY KEY (ID_proyecto, ID_categoria)
);

CREATE TABLE recursos(
    ID_recurso INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    tipo VARCHAR(30) NOT NULL,
    stock NUMERIC(10,2) NOT NULL
);

CREATE TABLE recursos_actividad(
    ID_recurso INT NOT NULL,
    ID_actividad INT NOT NULL,
    PRIMARY KEY (ID_recurso, ID_actividad)
);

CREATE TABLE responsables_actividad(
    ID_actividad INT NOT NULL,
    ID_participante INT NOT NULL,
    PRIMARY KEY (ID_actividad, ID_participante)
);

CREATE TABLE reportes(
    ID_reporte INT IDENTITY(1,1) PRIMARY KEY,
    ID_proyecto INT NOT NULL,
    titulo VARCHAR(100) NOT NULL,
    descripcion VARCHAR(300) NOT NULL,
    fecha_generacion DATETIME NOT NULL,
    tipo_reporte VARCHAR(50) NOT NULL
);

-- ================= UNIQUE =================

ALTER TABLE participantes
ADD CONSTRAINT UQ_participantes_DNI
UNIQUE(DNI);

ALTER TABLE participantes
ADD CONSTRAINT UQ_participantes_correo
UNIQUE(correo);

-- ================= CHECK =================

ALTER TABLE participantes
ADD CONSTRAINT CHK_estado_cuenta
CHECK (estado_cuenta IN ('Activo','Inactivo','Suspendido'));

ALTER TABLE proyectos
ADD CONSTRAINT CHK_estado_proyecto
CHECK (estado IN ('Activo','Finalizado','Suspendido'));

ALTER TABLE actividades
ADD CONSTRAINT CHK_estado_actividad
CHECK (estado IN ('Pendiente','En proceso','Finalizado'));

ALTER TABLE aportes
ADD CONSTRAINT CHK_estado_transaccion
CHECK (estado_transaccion IN ('Pendiente','Completado','Fallido','Cancelado'));

ALTER TABLE comentarios
ADD CONSTRAINT CHK_calificacion
CHECK (calificacion BETWEEN 1 AND 5);

-- ================= RELACIONES =================

ALTER TABLE actividades
ADD CONSTRAINT FK_actividades_proyectos
FOREIGN KEY(ID_proyecto)
REFERENCES proyectos(ID_proyecto);

ALTER TABLE aportes
ADD CONSTRAINT FK_aportes_proyectos
FOREIGN KEY(ID_proyecto)
REFERENCES proyectos(ID_proyecto);

ALTER TABLE aportes
ADD CONSTRAINT FK_aportes_participantes
FOREIGN KEY(ID_participante)
REFERENCES participantes(ID_participante);

ALTER TABLE comentarios
ADD CONSTRAINT FK_comentarios_proyectos
FOREIGN KEY(ID_proyecto)
REFERENCES proyectos(ID_proyecto);

ALTER TABLE comentarios
ADD CONSTRAINT FK_comentarios_participantes
FOREIGN KEY(ID_participante)
REFERENCES participantes(ID_participante);

ALTER TABLE direcciones
ADD CONSTRAINT FK_direcciones_participantes
FOREIGN KEY(ID_participante)
REFERENCES participantes(ID_participante);

ALTER TABLE telefonos
ADD CONSTRAINT FK_telefonos_participantes
FOREIGN KEY(ID_participante)
REFERENCES participantes(ID_participante);

ALTER TABLE equipo_proyecto
ADD CONSTRAINT FK_equipo_participantes
FOREIGN KEY(ID_participante)
REFERENCES participantes(ID_participante);

ALTER TABLE equipo_proyecto
ADD CONSTRAINT FK_equipo_proyectos
FOREIGN KEY(ID_proyecto)
REFERENCES proyectos(ID_proyecto);

ALTER TABLE metricas_ambientales
ADD CONSTRAINT FK_metricas_proyectos
FOREIGN KEY(ID_proyecto)
REFERENCES proyectos(ID_proyecto);

ALTER TABLE proyecto_categorias
ADD CONSTRAINT FK_proyectoCategorias_proyectos
FOREIGN KEY(ID_proyecto)
REFERENCES proyectos(ID_proyecto);

ALTER TABLE proyecto_categorias
ADD CONSTRAINT FK_proyectoCategorias_categorias
FOREIGN KEY(ID_categoria)
REFERENCES categorias(ID_categoria);

ALTER TABLE recursos_actividad
ADD CONSTRAINT FK_recursosActividad_recursos
FOREIGN KEY(ID_recurso)
REFERENCES recursos(ID_recurso);

ALTER TABLE recursos_actividad
ADD CONSTRAINT FK_recursosActividad_actividades
FOREIGN KEY(ID_actividad)
REFERENCES actividades(ID_actividad);

ALTER TABLE responsables_actividad
ADD CONSTRAINT FK_responsablesActividad_actividades
FOREIGN KEY(ID_actividad)
REFERENCES actividades(ID_actividad);

ALTER TABLE responsables_actividad
ADD CONSTRAINT FK_responsablesActividad_participantes
FOREIGN KEY(ID_participante)
REFERENCES participantes(ID_participante);

ALTER TABLE reportes
ADD CONSTRAINT FK_reportes_proyectos
FOREIGN KEY(ID_proyecto)
REFERENCES proyectos(ID_proyecto);