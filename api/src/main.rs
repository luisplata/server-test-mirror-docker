use axum::{Router, routing::get};
use std::net::SocketAddr;

#[tokio::main]
async fn main() {
    // 1. Crea el router
    let app = Router::new().route("/ping", get(|| async { "pong desde el API Rust" }));

    // 2. Define la dirección
    let addr = SocketAddr::from(([0, 0, 0, 0], 3000));
    println!("API corriendo en http://{}", addr);

    // 3. Usa hyper directamente en lugar de Server::bind
    axum::serve(
        tokio::net::TcpListener::bind(addr).await.unwrap(),
        app
    )
    .await
    .unwrap();
}