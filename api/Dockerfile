FROM rust:1.86-slim

WORKDIR /usr/src/app

# Instalar dependencias necesarias
RUN apt-get update && apt-get install -y pkg-config libssl-dev build-essential && rm -rf /var/lib/apt/lists/*

# Copiar archivos del proyecto
COPY Cargo.toml ./
COPY ./src ./src

# Compilar en release
RUN cargo build --release

EXPOSE 3000

CMD ["./target/release/api"]
