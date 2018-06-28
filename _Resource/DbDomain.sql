/*CREATE TABLE usuario (
	idusuario INT IDENTITY(1,1) NOT NULL,
	nombres VARCHAR(50) NULL,
	[usuario] [varchar](50) NULL,
	[clave] [varchar](50) NULL,
	CONSTRAINT [PK_Empleado] PRIMARY KEY ([idEmpleado])
 )*/

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

--Insert_User 'Mudassar2', '12345', 'mudassar@aspsnippets.com'
ALTER PROCEDURE pa_insertarusuario
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


ALTER PROCEDURE pa_validarusuario
      @nomuser VARCHAR(20),
      @passuser VARCHAR(20)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @idusuario INT, @ultLogin DATETIME
     
	SELECT @idusuario=id, @ultLogin=ultLogin
	FROM usuario WHERE nomuser = @nomuser AND passuser = @passuser
     
	IF @idusuario IS NOT NULL
	BEGIN
		UPDATE usuario SET ultLogin = GETDATE() WHERE id = @idusuario
		SELECT @idusuario AS idusuario -- User Valid
	END
	ELSE
	BEGIN
		SELECT 0 -- User invalid.
	END
END
GO