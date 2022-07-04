# syntax=docker/dockerfile:1
FROM ubuntu
WORKDIR /
SHELL ["/bin/bash", "-c"]
RUN apt update && apt -y install git curl build-essential clang wasi-libc
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y -q
RUN source $HOME/.cargo/env
RUN /root/.cargo/bin/rustup target add wasm32-wasi
RUN /root/.cargo/bin/cargo install --force cbindgen
COPY ./build.sh ./entrypoint.sh
