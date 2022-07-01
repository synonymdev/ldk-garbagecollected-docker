# syntax=docker/dockerfile:1
FROM ubuntu
WORKDIR /
SHELL ["/bin/bash", "-c"]
RUN apt update && apt -y install git curl build-essential clang 
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y -q
RUN source $HOME/.cargo/env
COPY ./build.sh ./entrypoint.sh
ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]
