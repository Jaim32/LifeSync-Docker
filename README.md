# 🧬 LifeSync – Aplicación Dockerizada  
Plataforma de bienestar y estilo de vida saludable

Este repositorio contiene todo lo necesario para ejecutar LifeSync utilizando Docker, incluyendo:

- Backend desarrollado en Spring Boot  
- Base de datos PostgreSQL  
- Configuración mediante Docker Compose  
- Instrucciones completas de uso  
- Usuarios de prueba con credenciales reales  

---

## 🚀 ¿Qué es LifeSync?

LifeSync es una aplicación orientada al bienestar personal, creada para ayudar a los usuarios a gestionar:

- Datos físicos (edad, peso, altura)  
- Objetivo de peso  
- Consumo de agua  
- Recetas y alimentación  
- Rachas (streaks)  
- Roles de usuario (ADMIN, USER, CATADOR)

El proyecto está construido con Spring Boot y PostgreSQL, aplicando arquitectura modular y limpia.

---

# 🐳 Arquitectura Docker

La aplicación se ejecuta mediante dos contenedores principales:

### 1. PostgreSQL – Base de Datos  
- Base de datos: LifeSyncDB  
- Usuario: admin  
- Contraseña: admin123  
- Datos persistidos en un volumen Docker  
- Ejecutado dentro de la red interna lifesync-net

### 2. Spring Boot – Backend  
- Expuesto en el puerto 8082  
- Conectado automáticamente al contenedor PostgreSQL  
- Gestiona entidades como Usuario, Hidratación, Recetas y Rachas  

---

# 👥 Usuarios de prueba

Estos usuarios están preconfigurados para realizar pruebas de autenticación dentro del sistema LifeSync.

### Administrador
- Correo: admin@test.com  
- Contraseña: Admin123!  
- Rol: ADMIN  

### Usuario general
- Correo: user@test.com  
- Contraseña: User123!  
- Rol: USER  

### Catador
- Correo: catador@test.com  
- Contraseña: Cat123!  
- Rol: CATADOR  

---

# ▶️ Instrucciones para ejecutar el proyecto

1. Clonar el repositorio en tu máquina local.  
2. Asegurarte de tener Docker Desktop instalado y funcionando.  
3. Ejecutar Docker Compose para levantar la base de datos y el backend.  
4. Una vez levantados los contenedores, acceder a los endpoints del backend mediante el puerto 8082.  
5. Puedes verificar el funcionamiento accediendo a la ruta de usuarios, por ejemplo:  
   `http://localhost:8082/api/usuario/all`

---

# 🔍 Conexión a la base de datos

Puedes conectarte manualmente a PostgreSQL utilizando herramientas como PgAdmin, TablePlus o DBeaver.  
Los valores de conexión son:

- Host: localhost  
- Puerto: 5432  
- Base de datos: LifeSyncDB  
- Usuario: admin  
- Contraseña: admin123  

---

# 🛠️ Comandos útiles

- Para detener los contenedores: usar el comando correspondiente en Docker Desktop o mediante Docker Compose.  
- Para eliminar volúmenes y datos persistentes: utilizar la opción de limpieza de Docker.  
- Para reiniciar solamente el backend: reiniciar el contenedor llamado lifesync-backend.

---

los siguiente hara:
- La base de datos PostgreSQL

- El backend Spring Boot

- La red interna lifesync-net

```bash
git clone https://github.com/tu-usuario/LifeSync.git
cd LifeSync
docker compose up -d
