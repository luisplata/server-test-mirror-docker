# Imagen base de Ubuntu
FROM ubuntu:22.04

# Evitar prompts en apt
ENV DEBIAN_FRONTEND=noninteractive

# Instalar dependencias necesarias para ejecutables de Unity en modo headless
RUN apt-get update && apt-get install -y \
    libglib2.0-0 \
    libx11-6 \
    libxcursor1 \
    libnss3 \
    libxrandr2 \
    libxss1 \
    libxtst6 \
    libgtk-3-0 \
    libxdamage1 \
    libxcomposite1 \
    libasound2 \
    libxi6 \
    libdbus-1-3 \
    && rm -rf /var/lib/apt/lists/*


RUN apt-get update && apt-get install -y \
    libglu1 \
    libsm6 \
    libxext6 \
    libxinerama1 \
    libfontconfig1 \
    libgconf-2-4 \
    libatomic1 \
    wget \
    && rm -rf /var/lib/apt/lists/*
# Copiar el build de Unity (compilado como servidor) a /app
COPY ./ServidorBuild/ /app/
WORKDIR /app

# Dar permisos de ejecución al binario principal (ajusta el nombre si es distinto)
RUN chmod +x ./Servidor.x86_64

# Exponer el puerto que usa Mirror (por defecto es 7777)
EXPOSE 7777

# Comando que ejecuta el servidor
CMD ["./Servidor.x86_64", "-batchmode", "-nographics", "-logFile", "-port", "7777"]
