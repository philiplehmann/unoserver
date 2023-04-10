set -x

docker buildx create --platform linux/arm64,linux/amd64,linux/ppc64le,linux/s390x --name unoserver-builder --use
docker buildx build --push --no-cache --platform=linux/arm64,linux/amd64 --tag=philiplehmann/unoserver:v0.0.1 .

docker buildx imagetools create philiplehmann/unoserver:v0.0.1 --tag philiplehmann/unoserver:latest