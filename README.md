# 🧬 LifeSync – Aplicación Dockerizada  
Plataforma de bienestar y estilo de vida saludable

Este repositorio contiene todo lo necesario para ejecutar **LifeSync** utilizando **Docker**, incluyendo:

- Backend con Spring Boot  
- Base de datos PostgreSQL  
- Orquestación con Docker Compose  
- Instrucciones completas de ejecución  
- Usuarios de prueba con sus credenciales reales  

---

## 🚀 ¿Qué es LifeSync?

**LifeSync** es una aplicación orientada al bienestar, permitiendo a los usuarios llevar un control de:

- Información física (edad, peso, altura)  
- Objetivo de peso  
- Hidratación  
- Recetas  
- Rachas (streaks)  
- Roles especializados (ADMIN, USER, CATADOR)

Está desarrollada con **Spring Boot** + **PostgreSQL**, siguiendo arquitectura modular y limpia.

---

# 🐳 Arquitectura Docker

La aplicación utiliza los siguientes servicios:

---

### **1️⃣ Base de Datos – PostgreSQL**

- Imagen: `postgres:15`
- Puerto: `5432`
- Base creada: `LifeSyncDB`
- Usuario/contraseña definidos mediante variables de entorno
- Datos persistidos vía volumen `postgres_data`

---

### **2️⃣ Backend – Spring Boot**

- Construido desde el Dockerfile ubicado en `/LifeSync-Backend`
- Se levanta en el puerto `8082`
- Variables de entorno conectan automáticamente al contenedor de PostgreSQL
- Usa JPA + Hibernate para gestionar las tablas

---

# 📦 Archivo `docker-compose.yml`

```yaml
version: "3.9"

services:
  db:
    image: postgres:15
    container_name: lifesync-db
    restart: always
    environment:
      POSTGRES_DB: LifeSyncDB
      POSTGRES_USER: admin
      POSTGRES_PASSWORD: admin123
    ports:
      - "5432:5432"
    volumes:
      - postgres_data:/var/lib/postgresql/data
    networks:
      - lifesync-net

  backend:
    build:
      context: ./LifeSync-Backend
    container_name: lifesync-backend
    restart: always
    depends_on:
      - db
    ports:
      - "8082:8082"
    environment:
      SPRING_DATASOURCE_URL: jdbc:postgresql://db:5432/LifeSyncDB
      SPRING_DATASOURCE_USERNAME: admin
      SPRING_DATASOURCE_PASSWORD: admin123
      SPRING_JPA_HIBERNATE_DDL_AUTO: update
    networks:
      - lifesync-net

volumes:
  postgres_data:

networks:
  lifesync-net:


👥 Usuarios de prueba (credenciales)

Estos usuarios ya están listos para iniciar sesión en la aplicación:

🛡️ Administrador

Correo: admin@test.com
Contraseña: Admin123!
Rol: ADMIN

👤 Usuario estándar

Correo: user@test.com
Contraseña: User123!
Rol: USER

🧪 Catador

Correo: catador@test.com
Contraseña: Cat123!
Rol: CATADOR



▶️ Instrucciones para ejecutar el proyecto
1. Clonar el repositorio
git clone https://github.com/tu-usuario/LifeSync.git
cd LifeSync

2. Levantar los contenedores
docker compose up -d


Esto:

Construirá el backend

Levantará PostgreSQL

Conectará ambos servicios

Creará las tablas automáticamente