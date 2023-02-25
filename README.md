# mixin-builder

## Usage

The official images are hosted at Github and signed by Cosign:
- https://github.com/thinkmassive/mixin-builder/pkgs/container/mixin-builder

```shell
docker pull ghcr.io/thinkmassive/mixin-builder:main
```

Additional images are published to
[DockerHub](https://hub.docker.com/u/thinkmassive/mixin-builder)
for convenience, although using the GHCR images is recommended.

Any of the bundled tools can be run the same as if they were installed natively:
```shell
IMG=thinkmassive/mixin-builder:main

# mixtool
docker run -v $(pwd):/mixin mixtool $IMG

# jsonnet & jsonnetfmt
docker run -v $(pwd):/mixin jsonnet $IMG
docker run -v $(pwd):/mixin jsonnetfmt $IMG

# jb
docker run -v $(pwd):/mixin jb $IMG"
```

## Building the image

```shell
IMG_REPO=thinkmassive/mixin-builder
IMG_TAG=dev

docker build -t $IMG_REPO:$IMG_TAG .
```
