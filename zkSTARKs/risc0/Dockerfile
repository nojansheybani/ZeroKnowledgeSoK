FROM rust:latest

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install \
    -y build-essential pkg-config libssl-dev

RUN cargo install cargo-risczero
RUN cargo risczero install

RUN mkdir matmul/
WORKDIR matmul
COPY matmul/ .
RUN cargo run --release

WORKDIR ..
RUN mkdir sha256/
WORKDIR sha256
COPY sha256/ .
RUN cargo run --release
