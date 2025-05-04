# Usar una imagen base con Java
FROM openjdk:17-jdk-slim

# Definir directorio de trabajo dentro del contenedor
WORKDIR /app

# Descargar GraphHopper y las dependencias necesarias
COPY . /app
RUN ./mvnw clean install -DskipTests

# Exponer el puerto que usará GraphHopper
EXPOSE 8989

# Comando para iniciar el servidor de GraphHopper
CMD ["java", "-jar", "target/graphhopper-web-<version>.jar"]
