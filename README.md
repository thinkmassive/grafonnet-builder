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
# mixtool
alias mixtool='docker run --rm -v $(pwd):/mixin --entrypoint=mixtool ghcr.io.thinkmassive/mixin-builder:main'

# jsonnet & jsonnetfmt
alias jsonnet='docker run --rm -v $(pwd):/mixin --entrypoint=jsonnet ghcr.io.thinkmassive/mixin-builder:main'
alias jsonnetfmt='docker run --rm -v $(pwd):/mixin --entrypoint=jsonnetfmt ghcr.io.thinkmassive/mixin-builder:main'

# jb
alias jb='docker run --rm -v $(pwd):/mixin --entrypoint=jb ghcr.io.thinkmassive/mixin-builder:main'
```

## Building the image

```shell
IMG_REPO=mixin-builder
IMG_TAG=dev

docker build -t $IMG_REPO:$IMG_TAG .
```
