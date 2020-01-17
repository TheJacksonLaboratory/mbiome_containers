## Containers Definition Files
### for JAX-GM Microbiome Core

Each app used in our analysis pipelines will have its own folder, containing
a `Dockerfile` and the `Docker` and converted `Singularity` images.

### Image Build Example
Build a `docker` image from a `Dockerfile`, push it to docker hub,
then use `singularity` to pull and convert it into a `.sif` image file.
```
    DockerAccount="my_username"
    ImageName="flash_assembler"
    ImageTag="1.2.11"
    docker build -t ${DockerAccount}/${ImageName}:${ImageTag} ${ImageName}/
    # test resulting image's container commands...
    docker push ${DockerAccount}/${ImageName}:${ImageTag}
    singularity pull ${ImageName}/${ImageName}.sif docker://${DockerAccount}/${ImageName}:${ImageTag}
```

