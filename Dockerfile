# Usar una imagen base con Maven y Java
FROM maven:3.8.6-openjdk-17-slim

# Definir directorio de trabajo dentro del contenedor
WORKDIR /app

# Copiar los archivos del proyecto al contenedor
COPY . /app

# Instalar dependencias con mvnw
RUN ./mvnw clean install -DskipTests

# Exponer el puerto que usará GraphHopper
EXPOSE 8989

# Comando para iniciar el servidor de GraphHopper
CMD ["java", "-jar", "target/graphhopper-web-<version>.jar"]
