# Usar una imagen base con Java
FROM openjdk:17-jdk-slim

# Definir directorio de trabajo dentro del contenedor
WORKDIR /app

# Copiar los archivos del proyecto al contenedor
COPY . /app

# Dar permisos de ejecución al archivo mvnw
RUN chmod +x mvnw

# Instalar dependencias con mvnw
RUN ./mvnw clean install -DskipTests

# Exponer el puerto que usará GraphHopper
EXPOSE 8989

# Comando para iniciar el servidor de GraphHopper
CMD ["java", "-jar", "target/graphhopper-web-<version>.jar"]
