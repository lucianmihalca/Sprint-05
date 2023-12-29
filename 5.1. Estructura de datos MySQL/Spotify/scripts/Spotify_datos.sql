USE spotify;

-- 01. Insertar datos en la tabla de usuarios.
-- Los campos incluyen el tipo de usuario (premium o free), email, contraseña encriptada, nombre, fecha de nacimiento, género, país y código postal.
INSERT INTO usuarios (tipo_usuario, email, password, nombre, fecha_nacimiento, genero, pais, codigo_postal) VALUES 
('premium', 'usuario1@correo.com', 'passwordEncriptada1', 'Usuario Uno', '1990-01-01', 'Masculino', 'España', '28001'),
('free', 'usuario2@correo.com', 'passwordEncriptada2', 'Usuario Dos', '1992-02-02', 'Femenino', 'México', '06700'),
('premium', 'usuario3@correo.com', 'passwordEncriptada3', 'Usuario Tres', '1993-03-03', 'No Binario', 'Argentina', 'C1073'),
('free', 'usuario4@correo.com', 'passwordEncriptada4', 'Usuario Cuatro', '1994-04-04', 'Masculino', 'Estados Unidos', '10001');

-- 02. Insertar datos en la tabla de artistas.
-- Los campos incluyen el nombre del artista y el nombre del archivo de su imagen, almacenado en un sistema externo como Google Cloud Storage.
INSERT INTO artistas (nombre, imagen_artista) VALUES 
('Artista Uno', 'imagen_artista1.jpg'),
('Artista Dos', 'imagen_artista2.jpg'),
('Artista Tres', 'imagen_artista3.jpg'),
('Artista Cuatro', 'imagen_artista4.jpg');

-- 03. Insertar datos en la tabla de álbumes.
-- Incluye información sobre cada álbum como el ID del artista asociado, título del álbum, año de publicación y el nombre del archivo de la imagen de portada.
INSERT INTO albumes (id_artista, titulo, fecha_publicacion, imagen_portada) VALUES 
(1, 'Álbum Uno', 2020, 'portada_album1.jpg'),
(2, 'Álbum Dos', 2019, 'portada_album2.jpg'),
(3, 'Álbum Tres', 2021, 'portada_album3.jpg'),
(1, 'Álbum Cuatro', 2022, 'portada_album4.jpg');

-- 04. Insertar datos en la tabla de canciones.
-- Registra detalles de cada canción como el ID del álbum al que pertenece, título, duración y la cantidad de veces que ha sido reproducida.
INSERT INTO canciones (id_album, titulo, duracion, veces_reproducida) VALUES 
(1, 'Canción Uno', 210, 100),
(2, 'Canción Dos', 180, 50),
(1, 'Canción Tres', 200, 150),
(3, 'Canción Cuatro', 230, 75);


-- 05. Insertar datos en la tabla de métodos de pago.
-- Incluye información sobre el método de pago de cada usuario, especificando si es tarjeta de crédito o PayPal.
INSERT INTO metodos_pago (id_usuario, tipo_metodo_pago) VALUES 
(1, 'tarjeta'),
(2, 'PayPal'),
(3, 'tarjeta'),
(4, 'PayPal');

-- 06. Insertar datos en la tabla de datos de tarjetas.
-- Almacena información detallada de las tarjetas de crédito utilizadas por los usuarios, como el número de tarjeta, fecha de caducidad y CVV.
INSERT INTO datos_tarjetas (id_metodo_pago, numero_tarjeta, mes_caducidad, anio_caducidad, CVV) VALUES 
(1, '1234567890123456', 12, 2025, '123'),
(3, '6543210987654321', 6, 2024, '321');

-- 07. Insertar datos en la tabla de datos de PayPal.
-- Contiene detalles específicos de las cuentas de PayPal de los usuarios, como el nombre de la cuenta.
INSERT INTO datos_paypal (id_metodo_pago, nombre_cuenta_paypal) VALUES 
(2, 'usuario2paypal'),
(4, 'usuario4paypal');

-- 08. Insertar datos en la tabla de suscripciones.
-- Registra información sobre las suscripciones de los usuarios premium, incluyendo fechas de inicio y renovación.
INSERT INTO suscripciones (id_usuario, id_metodo_pago, fecha_inicio_suscripcion, fecha_renovacion) VALUES 
(1, 1, '2023-01-01 00:00:00', '2024-01-01 00:00:00'),
(3, 3, '2023-02-01 00:00:00', '2024-02-01 00:00:00');


-- 09. Insertar datos en la tabla de pagos.
-- Incluye detalles de los pagos realizados por los usuarios, como la fecha, el número de orden y el total.
INSERT INTO pagos (id_metodo_pago, numero_orden, total) VALUES 
(1, 'ORD001', 9.99),
(3, 'ORD002', 19.99);

-- 10. Insertar datos en la tabla de playlists.
-- Almacena información sobre las playlists creadas por los usuarios, incluyendo el título y el número de canciones.
INSERT INTO playlists (id_usuario, titulo, numero_canciones, estado) VALUES 
(1, 'Playlist Uno', 5, 'activa'),
(2, 'Playlist Dos', 8, 'activa'),
(3, 'Playlist Tres', 3, 'borrada'),
(4, 'Playlist Cuatro', 10, 'activa');

-- 11. Insertar datos en la tabla de playlists compartidas.
-- Gestiona el acceso compartido a playlists, indicando qué usuario tiene acceso a qué playlist.
INSERT INTO playlists_compartidas (id_playlist, id_usuario) VALUES 
(1, 2),
(2, 3),
(3, 4),
(4, 1);

-- 12. Insertar datos en la tabla de artistas relacionados.
-- Establece relaciones entre diferentes artistas para sugerir conexiones y descubrimientos musicales.
INSERT INTO artistas_relacionados (id_artista, id_artista_relacionado) VALUES 
(1, 2),
(2, 3),
(3, 4),
(4, 1);

-- 13. Insertar datos en la tabla de canciones favoritas.
-- Permite a los usuarios marcar canciones específicas como sus favoritas.
INSERT INTO canciones_favoritas (id_usuario, id_cancion) VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4);

-- 14. Insertar datos en la tabla de álbumes favoritos.
-- Los usuarios pueden marcar álbumes enteros como favoritos.
INSERT INTO albumes_favoritos (id_usuario, id_album) VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4);

-- 15. Insertar datos en la tabla de canciones en playlists.
-- Gestiona qué canciones han sido añadidas a qué playlist y por qué usuario.
INSERT INTO canciones_playlist (id_playlist, id_cancion, id_usuario_agrego) VALUES 
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4);
