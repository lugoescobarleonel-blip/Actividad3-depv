# 🚀 Proyecto CI/CD con Jenkins, Docker y AWS

## 📌 Descripción
Este proyecto implementa un pipeline de Integración Continua y Despliegue Continuo (CI/CD) utilizando Jenkins, Docker y AWS EC2.  
La aplicación se construye automáticamente desde un repositorio en GitHub y se despliega en un contenedor Docker accesible desde internet.

---

## 🧠 Arquitectura del Proyecto

GitHub → Jenkins → Docker → AWS EC2 → Navegador

---

## 🛠️ Tecnologías utilizadas

- Jenkins
- Docker
- AWS EC2
- GitHub
- Linux (Ubuntu)
- Nginx (dentro del contenedor)

---

## ☁️ Infraestructura (AWS)

Se utilizó una instancia EC2 con las siguientes configuraciones:

| Puerto | Uso |
|--------|-----|
| 22     | SSH |
| 80     | HTTP |
| 443    | HTTPS |
| 5001   | Aplicación |
| 8080   | Jenkins |

---

## 🐳 Ejecución manual con Docker

### Construir la imagen
```bash
docker build -t mi-app .

Ejecutar contenedor
docker run -d -p 5001:80 --name mi-app mi-app
⚙️ Configuración de Jenkins

Jenkins se ejecuta en Docker con:

docker run -d \
  -p 8080:8080 \
  -p 50000:50000 \
  --name jenkins \
  -v /var/run/docker.sock:/var/run/docker.sock \
  jenkins/jenkins:lts

Acceso:

http://98.88.29.149:8080
🔄 Pipeline CI/CD
pipeline {
    agent any

    stages {

        stage('Clone') {
            steps {
                git branch: 'main', url: 'https://github.com/lugoescobarleonel-blip/Actividad3-depv.git'
            }
        }

        stage('Clean Docker') {
            steps {
                sh 'docker stop mi-app || true'
                sh 'docker rm mi-app || true'
            }
        }

        stage('Build Docker') {
            steps {
                sh 'docker build -t mi-app .'
            }
        }

        stage('Run Container') {
            steps {
                sh 'docker run -d -p 5001:80 --name mi-app mi-app'
            }
        }
    }
}
🌐 Despliegue

La aplicación está disponible en:

http://98.88.29.149:5001
⚠️ Problemas y soluciones
❌ Jenkins no encontraba la rama
✔ Se cambió de master a main
❌ Error docker: not found
✔ Se montó /var/run/docker.sock
❌ Puerto bloqueado
✔ Se configuraron reglas en AWS
📈 Mejoras futuras
Webhooks con GitHub (auto deploy)
Uso de dominio y HTTPS
Integración con Docker Hub
Uso de Docker Compose o Kubernetes
👨‍💻 Autor

Leonel Lugo Escobar


