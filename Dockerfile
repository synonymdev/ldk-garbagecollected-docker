# syntax=docker/dockerfile:1
FROM debian:bookworm
WORKDIR /
SHELL ["/bin/bash", "-c"]
RUN apt update && apt-get -y dist-upgrade && apt-get -y install cargo libstd-rust-dev-wasm32 lld git g++ clang curl node-typescript npm python3 wasi-libc
COPY ./build.sh ./entrypoint.sh
ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]
