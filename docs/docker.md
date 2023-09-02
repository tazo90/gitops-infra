# Build and push image

docker build -t tazo90/photon:1.0.1 .
docker image push tazo90/photon:1.0.1

# Run bash in image

docker run --rm -it --entrypoint bash tazo90/photon:1.0.1
