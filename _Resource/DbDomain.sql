/*CREATE TABLE usuario (
	idusuario INT IDENTITY(1,1) NOT NULL,
	nombres VARCHAR(50) NULL,
	[usuario] [varchar](50) NULL,
	[clave] [varchar](50) NULL,
	CONSTRAINT [PK_Empleado] PRIMARY KEY ([idEmpleado])
 )*/
CREATE DATABASE DbDomain
GO

USE DbDomain
GO

CREATE TABLE usuario (
	id INT IDENTITY(1,1) NOT NULL, -- ID
	nomape VARCHAR(20) NOT NULL,   -- nombre y apellido   
	nomuser VARCHAR(20) NOT NULL,  -- nombre usuario
	passuser VARCHAR(30) NOT NULL, -- clave
	email VARCHAR(50) NOT NULL,    -- Correo uuario
	ultLogin DATETIME NULL,		   -- ulitmo inicio de sesion
	fecreg DATETIME NOT NULL,	   -- fecha de registro
	CONSTRAINT [pk_usuario] PRIMARY KEY ( id )
)
GO


CREATE PROCEDURE pa_insertarusuario
	--pa_insertarusuario 'Marco Polo', 'marco', '123456', 'marco@miweb.com'
	@nomape NVARCHAR(20),
	@nomuser NVARCHAR(20),
	@passuser NVARCHAR(20),
	@email VARCHAR(50)
AS
BEGIN
	SET NOCOUNT ON;
	IF EXISTS(SELECT id FROM usuario WHERE nomuser = @nomuser)
	BEGIN
		SELECT -1 -- Username exists.
	END
	ELSE IF EXISTS(SELECT id FROM usuario WHERE email = @email)
	BEGIN
		SELECT -2 -- Email exists.
	END
	ELSE
	BEGIN
		INSERT INTO usuario (nomape,nomuser,passuser,email,fecreg)
		VALUES (@nomape ,@nomuser ,@passuser ,@email ,GETDATE())
		SELECT SCOPE_IDENTITY() -- UserId			   
     END
END
GO


CREATE PROCEDURE pa_validarusuario
	-- pa_validarusuario 'marsco', '123456'
    @nomuser VARCHAR(20),
    @passuser VARCHAR(20)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @idusuario INT, @ultLogin DATETIME
    
	-- Guardando datos de usuario (suponiendo que usuario es unico)
	SELECT * INTO #usuario FROM usuario WHERE nomuser = @nomuser

	-- Seteando idusuario y ultlogin
	SELECT @idusuario=id, @ultLogin=ultLogin FROM #usuario

    -- Verificando que existe idusuario
	IF @idusuario IS NOT NULL
	BEGIN
		IF EXISTS (SELECT * FROM #usuario WHERE passuser = @passuser)
		BEGIN
			UPDATE usuario SET ultLogin = GETDATE() WHERE id = @idusuario
			SELECT @idusuario AS idusuario -- Usuario existe
		END
		ELSE
		BEGIN
			SELECT -1 -- password incorrecto
		END
	END
	ELSE
	BEGIN
		SELECT 0 -- Usuario no existe
	END
END
GO