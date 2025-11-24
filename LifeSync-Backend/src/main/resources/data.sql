CREATE EXTENSION IF NOT EXISTS "pgcrypto";

INSERT INTO usuario (id_usuario, nombre, correo, contrasenia, edad, peso, altura, objetivo_peso, genero, rol)
VALUES
  (gen_random_uuid(), 'Juan Perez', 'admin@test.com', 'Admin123!', 28, 72.5, 1.78, 70, 'masculino', 'ADMIN'),
  (gen_random_uuid(), 'Carlos Ramirez', 'user@test.com', 'User123!', 22, 65.0, 1.70, 60, 'masculino', 'USER'),
  (gen_random_uuid(), 'Milo Perez', 'catador@test.com', 'Cat123!', 30, 75.5, 1.80, 70, 'Otro', 'CATADOR');
