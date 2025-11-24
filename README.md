# LifeSync-Docker

📘 LifeSync – Entorno Dockerizado (Frontend + Backend + BD + Servidor de Imágenes)

Este proyecto contiene toda la infraestructura Docker necesaria para ejecutar:

LifeSync Backend (Spring Boot + PostgreSQL)

LifeSync Frontend (React + Vite + Nginx)

Servidor de imágenes (Node.js + Express)

Base de Datos PostgreSQL

Todo está orquestado mediante Docker Compose, sin necesidad de instalar nada localmente excepto Docker.

🚀 1. Requisitos previos

Antes de ejecutar este proyecto necesitas:

Docker Desktop
👉 https://www.docker.com/products/docker-desktop/

Git (opcional)

No necesitas instalar Node, Java, Maven ni PostgreSQL en tu máquina.

📂 2. Estructura del proyecto
LifeSync-Docker/
│
├── LifeSync/               # Frontend (React/Vite)
│   ├── src/
│   ├── uploads/            # Carpeta donde se guardan imágenes
│   ├── dockerfile          # Dockerfile del frontend
│   └── dockerfile-server   # Dockerfile del servidor de imágenes
│
├── LifeSync-Backend/       # Backend (Spring Boot)
│   ├── src/
│   └── dockerfile          # Dockerfile del backend
│
├── docker-compose.yml      # Orquestación principal
└── README.md

🐳 3. Servicios Docker incluidos
Servicio	Puerto local	Descripción
lifesync-db	5432	Base de datos PostgreSQL
lifesync-backend	8082	API REST Spring Boot
lifesync-frontend	4028	App web servida por Nginx
lifesync-images	4029	Servidor estático de imágenes
🛠 4. Cómo levantar el proyecto

Ejecuta desde la raíz del proyecto:

docker-compose up --build


Esto:

✔ Construye las imágenes
✔ Levanta los contenedores
✔ Configura redes internas
✔ Crea la base de datos
✔ Inicia el backend, frontend y servidor de imágenes

🌐 5. Accesos principales
🔵 Frontend (React + Nginx)

👉 http://localhost:4028

🟢 Backend (Spring Boot)

👉 http://localhost:8082

Ejemplos:

GET  /api/recetas/publicas
POST /api/auth/login
POST /api/usuarios/create

🟣 Servidor de imágenes

👉 http://localhost:4029/uploads/tu_imagen.png

🟡 Base de datos PostgreSQL
HOST: lifesync-db
PORT: 5432
DB: LifeSyncDB
USER: admin
PASS: admin123

🔗 6. Comunicación entre servicios en Docker

Dentro de Docker NO se usa localhost.
Cada contenedor se comunica por su nombre de servicio:

Origen	Destino	URL interna
Frontend → Backend	http://backend:8082	
Frontend → Image Server	http://images-server:4029/uploads	
Backend → PostgreSQL	jdbc:postgresql://db:5432/LifeSyncDB	

Ejemplo desde React:

axios.post("http://backend:8082/api/auth/login", data)


Ejemplo de imágenes:

<img src="http://images-server:4029/uploads/archivo.png" />

📦 7. Reconstruir todo el entorno

Si cambias código del backend, frontend o servidor:

docker-compose down
docker-compose up --build

🧹 8. Limpiar contenedores y volúmenes (borra DB)
docker-compose down -v

🖼 9. Carpeta de imágenes persistente

El directorio:

LifeSync/uploads/


se mapea dentro del contenedor:

/app/uploads


✔ Las imágenes no se pierden al reiniciar
✔ Se pueden gestionar directamente desde tu máquina

🧪 10. Inicializar usuarios de prueba

Puedes cargar usuarios automáticamente al crear la base por primera vez.

1️⃣ Crear carpeta
LifeSync-Docker/init/

2️⃣ Crear archivo dentro:
init.sql

3️⃣ Insertar datos:
INSERT INTO usuario (id_usuario, nombre, correo, contrasenia, edad, altura, peso, objetivo_peso, rol, genero)
VALUES
(uuid_generate_v4(),'Admin User','admin@test.com','Admin123!',30,1.75,70,70,'ADMIN','masculino'),
(uuid_generate_v4(),'Test User','user@test.com','User123!',25,1.80,72,70,'USER','otro'),
(uuid_generate_v4(),'Catador Pro','catador@test.com','Cat123!',40,1.70,80,75,'CATADOR','masculino');

4️⃣ Agregar volumen a db:
volumes:
  - postgres_data:/var/lib/postgresql/data
  - ./init:/docker-entrypoint-initdb.d

🛑 11. Detener el entorno
docker-compose down

📝 12. Notas importantes

No uses localhost entre contenedores.

Usa SIEMPRE los nombres: backend, db, images-server.

Si uploads no existe, Docker la crea automáticamente.

Vite necesita que las URLs al backend estén en variables de entorno o código.

✔ 13. Todo listo

Con este entorno puedes levantar LifeSync completo con un solo comando:

docker-compose up --build
