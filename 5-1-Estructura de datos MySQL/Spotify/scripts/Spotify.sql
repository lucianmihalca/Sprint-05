CREATE DATABASE IF NOT EXISTS spotify;
USE spotify;

-- 01. Tabla de usuarios: Almacena información principal de los usuarios, incluyendo tipo, datos personales y de contacto.
CREATE TABLE IF NOT EXISTS usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    tipo_usuario ENUM('free', 'premium') NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    genero VARCHAR(20) NOT NULL,
    pais VARCHAR(30) NOT NULL,
    codigo_postal VARCHAR(20) NOT NULL
);
-- 02. Tabla de artistas: Guarda información sobre cada artista, incluyendo su nombre e imagen.
CREATE TABLE IF NOT EXISTS artistas (
    id_artista INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    imagen_artista VARCHAR(200) NOT NULL  -- Aquí solo el nombre del archivo almacenado en Google Cloud Storage, por ejemplo.
);

-- 03. Tabla de álbumes: Almacena información sobre álbumes, incluyendo el artista que los publicó.
CREATE TABLE IF NOT EXISTS albumes (
    id_album INT AUTO_INCREMENT PRIMARY KEY,
    id_artista INT NOT NULL,
    titulo VARCHAR(100) NOT NULL,
    fecha_publicacion YEAR NOT NULL,
    imagen_portada VARCHAR(200) NOT NULL, -- Aquí solo el nombre del archivo almacenado en Google Cloud Storage, por ejemplo.
    FOREIGN KEY (id_artista) REFERENCES artistas (id_artista)
);

-- 04. Tabla de canciones: Almacena información detallada de cada canción, incluyendo a qué álbum pertenece.
CREATE TABLE IF NOT EXISTS canciones (
    id_cancion INT AUTO_INCREMENT PRIMARY KEY,
    id_album INT NOT NULL,
    titulo VARCHAR(100) NOT NULL,
    duracion INT NOT NULL,
    veces_reproducida INT DEFAULT 0,
    FOREIGN KEY (id_album) REFERENCES albumes (id_album)
);


-- 05. Tabla de métodos de pago: Registra los diferentes métodos de pago utilizados por los usuarios.
CREATE TABLE IF NOT EXISTS metodos_pago (
    id_metodo_pago INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    tipo_metodo_pago ENUM('tarjeta', 'PayPal') NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuarios (id_usuario)
);

-- 06. Tabla de datos de tarjetas: Almacena detalles específicos de tarjetas de crédito de los usuarios.
CREATE TABLE IF NOT EXISTS datos_tarjetas (
    id_datos_tarjeta INT AUTO_INCREMENT PRIMARY KEY,
    id_metodo_pago INT NOT NULL,
    numero_tarjeta VARCHAR(16) NOT NULL,
    mes_caducidad INT NOT NULL,
    anio_caducidad INT NOT NULL,
    CVV VARCHAR(3) NOT NULL,
    FOREIGN KEY (id_metodo_pago) REFERENCES metodos_pago (id_metodo_pago)
);

-- 07. Tabla de datos de PayPal: Guarda información específica de las cuentas de PayPal de los usuarios.
CREATE TABLE IF NOT EXISTS datos_paypal (
    id_datos_paypal INT AUTO_INCREMENT PRIMARY KEY,
    id_metodo_pago INT NOT NULL,
    nombre_cuenta_paypal VARCHAR(100) NOT NULL,
    FOREIGN KEY (id_metodo_pago) REFERENCES metodos_pago (id_metodo_pago)
);


-- 08. Tabla de suscripciones: Almacena información sobre las suscripciones de usuarios premium.
CREATE TABLE IF NOT EXISTS suscripciones (
    id_suscripcion INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_metodo_pago INT NOT NULL,
    fecha_inicio_suscripcion datetime NOT NULL,
    fecha_renovacion datetime NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuarios (id_usuario),
    FOREIGN KEY (id_metodo_pago) REFERENCES metodos_pago (id_metodo_pago)
);

-- 09. Tabla de pagos: Registra los pagos realizados por los usuarios, relacionados con sus métodos de pago.
CREATE TABLE IF NOT EXISTS pagos (
    id_pago INT AUTO_INCREMENT PRIMARY KEY,
    id_metodo_pago INT NOT NULL,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    numero_orden VARCHAR(50) UNIQUE NOT NULL,
    total DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_metodo_pago) REFERENCES metodos_pago (id_metodo_pago)
);

-- 10. Tabla de playlists: Almacena las playlists creadas por los usuarios, incluyendo detalles y estado.
CREATE TABLE IF NOT EXISTS playlists (
    id_playlist INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    titulo VARCHAR(50) NOT NULL,
    numero_canciones INT NOT NULL,  -- Puede ser calculado dinámicamente
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    estado ENUM('activa', 'borrada') DEFAULT 'activa',
    fecha_eliminacion TIMESTAMP NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuarios (id_usuario)
);

-- 11. Tabla de playlists compartidas: Gestiona qué usuarios tienen acceso a playlists compartidas.
CREATE TABLE IF NOT EXISTS playlists_compartidas (
    id_playlist INT NOT NULL,
    id_usuario INT NOT NULL,
    fecha_compartida TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    FOREIGN KEY (id_playlist) REFERENCES playlists (id_playlist),
    FOREIGN KEY (id_usuario) REFERENCES usuarios (id_usuario)
);

-- 12. Tabla de artistas relacionados: Establece relaciones entre artistas para sugerir artistas similares.
CREATE TABLE IF NOT EXISTS artistas_relacionados (
    id_artista INT NOT NULL,
    id_artista_relacionado INT NOT NULL,
    FOREIGN KEY (id_artista) REFERENCES artistas (id_artista),
    FOREIGN KEY (id_artista_relacionado) REFERENCES artistas (id_artista)
);

-- 13. Tabla de canciones favoritas: Permite a los usuarios marcar canciones como favoritas.
CREATE TABLE IF NOT EXISTS canciones_favoritas (
    id_usuario INT NOT NULL,
    id_cancion INT NOT NULL,
    fecha_agregado TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuarios (id_usuario),
    FOREIGN KEY (id_cancion) REFERENCES canciones (id_cancion)
);

-- 14. Tabla de álbumes favoritos: Permite a los usuarios marcar álbumes como favoritos.
CREATE TABLE IF NOT EXISTS albumes_favoritos (
    id_usuario INT NOT NULL,
    id_album INT NOT NULL,
    fecha_agregado TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuarios (id_usuario),
    FOREIGN KEY (id_album) REFERENCES albumes (id_album)
);

-- 15. Tabla de canciones en playlists: Gestiona qué canciones están en cada playlist, y quién las añadió.
CREATE TABLE IF NOT EXISTS canciones_playlist (
    id_playlist INT NOT NULL,
    id_cancion INT NOT NULL,
    id_usuario_agrego INT,  -- Opcional, para rastrear quién añadió la canción.
    fecha_agregado TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    FOREIGN KEY (id_playlist) REFERENCES playlists (id_playlist),
    FOREIGN KEY (id_cancion) REFERENCES canciones (id_cancion),
    FOREIGN KEY (id_usuario_agrego) REFERENCES usuarios (id_usuario)
);
