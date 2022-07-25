# ldk-garbagecollected-docker

Docker container for building the LDK garbagesollected bindings and WASM. 

## Build 

```
docker build . -t ldk-wasm
```

## Run

```
docker run wasm-ldk
```

## Interactive Shell

Remove the Entrypoint from the Dockerfile, currently used for debugging

```
docker run -ti -v /tmp:/tmp wasm-ldk bash
```

Freshly baked bindings are now located in your local /tmp mount point.
