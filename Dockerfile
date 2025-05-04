# Usar una imagen base con OpenJDK 17 y Maven
FROM maven:latest

# Definir directorio de trabajo dentro del contenedor
WORKDIR /app

# Copiar los archivos del proyecto al contenedor
COPY . /app

# Asegurarse de que mvnw tenga permisos de ejecución
RUN find . -name mvnw -exec chmod +x {} \;

# Instalar dependencias con mvnw
RUN ./mvnw clean install -DskipTests

# Exponer el puerto que usará GraphHopper
EXPOSE 8989

# Comando para iniciar el servidor de GraphHopper
CMD ["java", "-jar", "target/graphhopper-web-<version>.jar"]
