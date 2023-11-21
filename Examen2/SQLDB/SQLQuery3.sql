CREATE DATABASE EXAMEN2
GO
USE EXAMEN2
GO
CREATE TABLE USUARIO
(
	id int identity,
	nombre varchar(50) not null,
	correo varchar(50),
	telefono varchar(15) unique,
	constraint pk_idusuario primary key(id)
)
go

CREATE TABLE EQUIPO
(
	id int identity,
	idusuario int,
	
	tipoEquipo varchar(50) not null,
	modelo varchar(50)
	constraint fk_idusuario foreign key (idusuario) references usuario(id),
	
	constraint pk_idequipo primary key(id)
)
go

CREATE TABLE REPARACION
(
	id int identity,
	idequipo int,
	iddetallesreparacion int,
	fechasolicitud date,
	estado char(1),
	constraint fk_idequipo foreign key (idequipo) references equipo(id),
	constraint fk_iddetallesreparacion foreign key (iddetallesreparacion) references detallesreparacion(id),
	constraint pk_idreparacion primary key(id)


)
go

CREATE TABLE DETALLESREPARACION
(
	id int identity,
	idreparacion int,
	descripcion varchar(50),
	fechainicio date,
	fechafin date,
	constraint fk_idreparacion foreign key (idreparacion) references reparacion(id),
	constraint pk_iddetallesreparacion primary key(id)
)
go

CREATE TABLE ASIGNACIONES
(
	id int identity,
	idreparacion int,
	idtecnico int,
	fechaasignacion date,
	
	
	constraint pk_idasignaciones primary key(id)
)
go

CREATE TABLE TECNICO
(
	id int identity(50,1),
	nombre varchar(50),
	especialidad varchar(50),
	constraint pk_idtecnico primary key(id)
)
go

Select * from TECNICO

-----------------------------Procedimientos Almacenados----------------------------------------------------

CREATE PROCEDURE CONSULTARUSUARIO
AS
	BEGIN
		SELECT *FROM USUARIO
	END

	EXEC CONSULTARUSUARIO

CREATE PROCEDURE BORRARUSUARIO
@CODIGO INT
AS
	BEGIN
		DELETE USUARIO WHERE id = @CODIGO
	END

	DELETE USUARIO WHERE ID=4
	EXEC CONSULTARUSUARIO

CREATE PROCEDURE CONSULTARUSUARIO_FILTRO
@CODIGO INT
AS
	BEGIN
		SELECT *FROM USUARIO WHERE id = @CODIGO
	END

	EXEC CONSULTARUSUARIO_FILTRO 3

CREATE PROCEDURE ACTUALIZARUSUARIO
@CODIGO INT,
@nombre varchar(50),
@correo varchar(50),
@telefono varchar(15)
AS
	BEGIN
		UPDATE USUARIO SET nombre = @nombre, correo = @correo, telefono = @telefono WHERE ID = @CODIGO
	END

	EXEC ACTUALIZARUSUARIO 3, 'Roberto', 'robenm@hotmail.com', 80906040
	EXEC CONSULTARUSUARIO

CREATE PROCEDURE INGRESARUSUARIO
@CODIGO INT,
@nombre varchar(50),
@correo varchar(50),
@telefono varchar(15)
AS
	BEGIN
		INSERT INTO USUARIO (nombre,correo,telefono) values (@nombre,@correo,@telefono)
	END

	EXEC INGRESARUSUARIO 3, 'Miguel', 'migue234@gmail.com',675843210
	EXEC CONSULTARUSUARIO

	CREATE PROCEDURE CONSULTAREQUIPO
AS
	BEGIN
		SELECT *FROM EQUIPO
	END

	EXEC CONSULTAREQUIPO

CREATE PROCEDURE BORRAREQUIPO
@CODIGO INT
AS
	BEGIN
		DELETE EQUIPO WHERE id = @CODIGO
	END

CREATE PROCEDURE CONSULTAREQUIPO_FILTRO
@CODIGO INT
AS
	BEGIN
		SELECT *FROM EQUIPO WHERE id = @CODIGO
	END

CREATE PROCEDURE ACTUALIZAREQUIPO
@CODIGO INT,
@TipoEquipo varchar(50),
@Modelo varchar(50)
AS
	BEGIN
		UPDATE EQUIPO SET tipoEquipo = @TipoEquipo, modelo = @Modelo WHERE ID = @CODIGO
	END

	EXEC ACTUALIZAREQUIPO 1, 'Monitor', 'AOC'
	EXEC CONSULTAREQUIPO

CREATE PROCEDURE INGRESAREQUIPO	
@TipoEquipo varchar(50),
@Modelo varchar(50)

AS
	BEGIN
		INSERT INTO EQUIPO(tipoEquipo,modelo) values (@TipoEquipo,@Modelo)
	END

	EXEC INGRESAREQUIPO 'Cable HDMI', 'hp'
	EXEC CONSULTAREQUIPO

	--------------------------------------------------------------------------------------

CREATE PROCEDURE CONSULTARTECNICOS
AS
	BEGIN
		SELECT *FROM TECNICO
	END

	EXEC CONSULTARTECNICOS

CREATE PROCEDURE BORRARTECNICO
@CODIGO INT
AS
	BEGIN
		DELETE TECNICO WHERE id = @CODIGO
	END

CREATE PROCEDURE CONSULTARTECNICO_FILTRO
@CODIGO INT
AS
	BEGIN
		SELECT *FROM TECNICO WHERE id = @CODIGO
	END

CREATE PROCEDURE ACTUALIZARTECNICO
@CODIGO INT,
@Nombre varchar(50),
@Especialidad varchar(50)
AS
	BEGIN
		UPDATE TECNICO SET nombre = @Nombre, especialidad = @Especialidad WHERE ID = @CODIGO
	END

	EXEC ACTUALIZARTECNICO 3, 'John', 'instalacion'
	EXEC CONSULTARTECNICOS

CREATE PROCEDURE INGRESARTECNICO	
@CODIGO INT,
@Nombre varchar(50),
@Especialidad varchar(50)

AS
	BEGIN
		INSERT INTO TECNICO (nombre,especialidad) values (@Nombre,@Especialidad)
	END