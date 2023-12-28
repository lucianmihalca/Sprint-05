USE youtube;

INSERT INTO usuarios (email, password, nombre, fecha_nacimento, sexo, pais, codigo_postal) VALUES
('user1@example.com', 'password123', 'Juan Pérez', '1990-01-01', 'Masculino', 'España', '28001'),
('user2@example.com', 'password123', 'Ana Gómez', '1985-05-15', 'Femenino', 'España', '28002'),
('user3@example.com', 'password123', 'Luisa Martín', '1992-07-22', 'Femenino', 'España', '28003'),
('user4@example.com', 'password123', 'Carlos Rodríguez', '1988-03-30', 'Masculino', 'España', '28004');

INSERT INTO etiqueta_videos (nombre) VALUES
('Educación'),
('Entretenimiento'),
('Tecnología'),
('Viajes'),
('Comida'),
('Música'),
('Deportes'),
('Cine'),
('Videojuegos'),
('Moda');

INSERT INTO videos (id_usuario, titulo, descripcion, tamaño, nombre_archivo, duracion, thumbnail, num_reproducciones, num_likes, num_dislikes, estado) VALUES
(1, 'Aprendiendo SQL', 'Tutorial básico de SQL para principiantes', 1048576, 'video1.mp4', '00:30:00', 'thumb1.jpg', 100, 95, 5, 'público'),
(2, 'Viaje a Barcelona', 'Mi viaje a Barcelona y los lugares que visité', 2048576, 'video2.mp4', '00:45:00', 'thumb2.jpg', 200, 180, 20, 'público'),
(3, 'Receta de Paella', 'Cómo hacer una deliciosa paella española', 307200, 'video3.mp4', '00:15:00', 'thumb3.jpg', 150, 140, 10, 'privado'),
(4, 'Guitarra para principiantes', 'Lecciones básicas para empezar a tocar la guitarra', 512000, 'video4.mp4', '01:00:00', 'thumb4.jpg', 250, 230, 20, 'oculto');


INSERT INTO videos_etiquetas (id_video, id_etiqueta_video) VALUES
(1, 1),  -- Video 1 se asigna a la etiqueta 1
(1, 2),  -- Video 1 se asigna a la etiqueta 2
(2, 1),  -- Video 2 se asigna a la etiqueta 1
(2, 3),  -- Video 2 se asigna a la etiqueta 3
(3, 4),  -- Video 3 se asigna a la etiqueta 4
(4, 2),  -- Video 4 se asigna a la etiqueta 2
(4, 5);  -- Video 4 se asigna a la etiqueta 5

INSERT INTO canales (id_usuario, nombre, descripcion) VALUES
(1, 'Canal de Juan', 'Canal dedicado a tutoriales de programación y tecnología.'),
(2, 'Viajes con Ana', 'Explorando nuevas culturas y lugares alrededor del mundo.'),
(3, 'Cocina con Luisa', 'Recetas deliciosas y fáciles de preparar.'),
(4, 'Guitarra con Carlos', 'Lecciones de guitarra para principiantes y avanzados.');

INSERT INTO suscripciones (id_usuario, id_canal) VALUES
(1, 2),  -- El usuario 1 se suscribe al canal 2
(1, 3),  -- El usuario 1 se suscribe al canal 3
(2, 1),  -- El usuario 2 se suscribe al canal 1
(2, 4),  -- El usuario 2 se suscribe al canal 4
(3, 2),  -- El usuario 3 se suscribe al canal 2
(4, 3),  -- El usuario 4 se suscribe al canal 3
(4, 1);  -- El usuario 4 se suscribe al canal 1

INSERT INTO likes_dislikes_videos (id_usuario, id_video, tipo) VALUES
(1, 1, 'like'),  -- El usuario 1 da 'me gusta' al video 1
(1, 2, 'dislike'),  -- El usuario 1 da 'no me gusta' al video 2
(2, 1, 'like'),  -- El usuario 2 da 'me gusta' al video 1
(2, 3, 'like'),  -- El usuario 2 da 'me gusta' al video 3
(3, 4, 'dislike'),  -- El usuario 3 da 'no me gusta' al video 4
(4, 3, 'like'),  -- El usuario 4 da 'me gusta' al video 3
(4, 2, 'dislike');  -- El usuario 4 da 'no me gusta' al video 2

INSERT INTO play_lists (id_usuario, nombre, estado) VALUES
(1, 'Lista de Juan', 'publica'),  -- Lista de reproducción pública creada por el usuario 1
(2, 'Mis Favoritos', 'privada'),  -- Lista de reproducción privada creada por el usuario 2
(3, 'Rock Clásico', 'publica'),   -- Lista de reproducción pública creada por el usuario 3
(4, 'Música para Estudiar', 'privada'); -- Lista de reproducción privada creada por el usuario 4

INSERT INTO video_play_lists (id_play_list, id_video) VALUES
(1, 1),  -- La lista de reproducción 1 incluye el video 1
(1, 2),  -- La lista de reproducción 1 incluye el video 2
(2, 3),  -- La lista de reproducción 2 incluye el video 3
(2, 4),  -- La lista de reproducción 2 incluye el video 4
(3, 1),  -- La lista de reproducción 3 incluye el video 1
(3, 4),  -- La lista de reproducción 3 incluye el video 4
(4, 2),  -- La lista de reproducción 4 incluye el video 2
(4, 3);  -- La lista de reproducción 4 incluye el video 3

INSERT INTO comentarios (id_video, id_usuario, texto_comentario) VALUES
(1, 2, '¡Gran video, muy informativo!'),  -- Usuario 2 comenta en el video 1
(1, 3, 'Me encantó este tutorial, gracias.'),  -- Usuario 3 comenta en el video 1
(2, 1, 'Fantástico viaje, ¿cuál será tu próximo destino?'),  -- Usuario 1 comenta en el video 2
(3, 4, 'No puedo esperar para probar esta receta.'),  -- Usuario 4 comenta en el video 3
(4, 2, 'Excelentes consejos para principiantes.'),  -- Usuario 2 comenta en el video 4
(4, 3, '¿Tienes recomendaciones de guitarras para empezar?');  -- Usuario 3 comenta en el video 4

INSERT INTO likes_dislikes_comentario (id_usuario, id_comentario, tipo) VALUES
(1, 2, 'me_gusta'),  -- El usuario 1 da 'me gusta' al comentario 2
(2, 1, 'no_me_gusta'),  -- El usuario 2 da 'no me gusta' al comentario 1
(3, 3, 'me_gusta'),  -- El usuario 3 da 'me gusta' al comentario 3
(4, 4, 'me_gusta'),  -- El usuario 4 da 'me gusta' al comentario 4
(2, 3, 'no_me_gusta'),  -- El usuario 2 da 'no me gusta' al comentario 3
(1, 4, 'me_gusta'),  -- El usuario 1 da 'me gusta' al comentario 4
(3, 2, 'no_me_gusta');  -- El usuario 3 da 'no me gusta' al comentario 2
