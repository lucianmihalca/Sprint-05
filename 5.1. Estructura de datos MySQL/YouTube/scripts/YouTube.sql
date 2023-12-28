CREATE DATABASE IF NOT EXISTS youtube;
USE youtube;

-- 01.Tabla de usuarios: Almacena la información principal de los usuarios de la plataforma.
CREATE TABLE IF NOT EXISTS usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    nombre VARCHAR(255) NOT NULL,
    fecha_nacimento DATE NOT NULL,
    sexo VARCHAR(20) NOT NULL,
    pais VARCHAR(30) NOT NULL,
    codigo_postal VARCHAR(20) NOT NULL
);


-- 02.Tabla de etiquetas para los videos: Contiene diferentes etiquetas que pueden ser asignadas a los videos.
CREATE TABLE IF NOT EXISTS etiqueta_videos (
    id_etiqueta_video INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL 
);

-- 03.Tabla principal de videos: Incluye toda la información relevante de los videos subidos por los usuarios.
CREATE TABLE IF NOT EXISTS videos (
    id_video INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    titulo VARCHAR(100) NOT NULL,
    descripcion VARCHAR(500) NOT NULL, 
    tamaño BIGINT NOT NULL, 
    nombre_archivo VARCHAR(100) NOT NULL,
    duracion TIME NOT NULL, 
    thumbnail VARCHAR(255) NOT NULL, 
    num_reproducciones INT NOT NULL, 
    num_likes INT NOT NULL, 
    num_dislikes INT NOT NULL, 
    estado ENUM('público', 'privado', 'oculto') NOT NULL,
    fecha_publicacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL, 
    FOREIGN KEY (id_usuario) REFERENCES usuarios (id_usuario)
);

-- 04.Tabla de relaciones videos-etiquetas: Define la relación muchos-a-muchos entre videos y etiquetas.
CREATE TABLE IF NOT EXISTS videos_etiquetas (
    id_video INT NOT NULL, 
    id_etiqueta_video INT NOT NULL, 
    PRIMARY KEY (id_video, id_etiqueta_video), 
    FOREIGN KEY (id_video) REFERENCES videos (id_video),
    FOREIGN KEY (id_etiqueta_video) REFERENCES etiqueta_videos (id_etiqueta_video)
);

-- 05.Tabla de canales: Registra información de los canales creados por los usuarios.
CREATE TABLE IF NOT EXISTS canales (
    id_canal INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    nombre VARCHAR(50) NOT NULL, 
    descripcion VARCHAR(150) NOT NULL,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuarios (id_usuario)
);

-- 06.Tabla de suscripciones: Gestiona las suscripciones de los usuarios a los diferentes canales.
CREATE TABLE IF NOT EXISTS suscripciones (
    id_usuario INT NOT NULL,
    id_canal INT NOT NULL,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    PRIMARY KEY (id_usuario, id_canal),
    FOREIGN KEY (id_usuario) REFERENCES usuarios (id_usuario),
    FOREIGN KEY (id_canal) REFERENCES canales (id_canal)
);

-- 07.Tabla de likes y dislikes en videos: Registra los 'me gusta' y 'no me gusta' que los usuarios dan a los videos.
CREATE TABLE IF NOT EXISTS likes_dislikes_videos (
    id_like_dislike_video INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_video INT NOT NULL,
    tipo ENUM('like', 'dislike') NOT NULL,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuarios (id_usuario),
    FOREIGN KEY (id_video) REFERENCES videos (id_video)
);
-- 08.Tabla de listas de reproducción: Almacena las listas de reproducción creadas por los usuarios.
CREATE TABLE IF NOT EXISTS play_lists (
    id_play_list INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    estado ENUM('publica', 'privada'),
    FOREIGN KEY (id_usuario) REFERENCES usuarios (id_usuario)
  
);

-- 09.Tabla de videos en listas de reproducción: Relaciona los videos con las listas de reproducción.
CREATE TABLE IF NOT EXISTS video_play_lists (
    id_play_list INT NOT NULL,
    id_video INT NOT NULL,
    PRIMARY KEY (id_play_list, id_video),
    FOREIGN KEY (id_play_list) REFERENCES play_lists (id_play_list),
    FOREIGN KEY (id_video) REFERENCES videos (id_video)  
);

-- 10.Tabla de comentarios: Permite a los usuarios comentar en los videos.
CREATE TABLE IF NOT EXISTS comentarios (
    id_comentario INT AUTO_INCREMENT PRIMARY KEY,
    id_video INT NOT NULL,
    id_usuario INT NOT NULL,
    texto_comentario TEXT NOT NULL,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    FOREIGN KEY (id_video) REFERENCES videos (id_video),
    FOREIGN KEY (id_usuario) REFERENCES usuarios (id_usuario) 
);

-- 11.Tabla de likes y dislikes en comentarios: Registra los 'me gusta' y 'no me gusta' que los usuarios dan a los comentarios.
CREATE TABLE IF NOT EXISTS likes_dislikes_comentario (
    id_usuario INT NOT NULL,
    id_comentario INT NOT NULL,
    tipo ENUM('me_gusta', 'no_me_gusta') NOT NULL,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuarios (id_usuario),
    FOREIGN KEY (id_comentario) REFERENCES comentarios (id_comentario) 
);