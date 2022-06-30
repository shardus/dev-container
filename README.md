# dev-container

Development container with tooling for Shardus's Node.js and Rust projects.

Container URL:
```
registry.gitlab.com/shardus/dev-container
```

# Usage

From: https://code.visualstudio.com/docs/remote/devcontainer-cli#_example-of-building-and-publishing-an-image

1. Create a source code repository.

2. Create a dev container configuration for each image you want to pre-build, customizing as you wish (including dev container features). For example, consider this `devcontainer.json` file:

```
{
  "build": {
    "dockerfile": "Dockerfile"
  },
  "features": {
    "docker-in-docker": "latest"
  }
}
```

3. Use the `devcontainer build` command to build the image. See documentation for your image registry (like the Azure Container Registry, GitHub Container Registry, or Docker Hub) for information on image naming and additional steps like authentication.

```
devcontainer build \
    --image-name ghcr.io/your-org/your-repo/your-image-name \
    change-me-to-repository-folder-with-dot-devcontainer
```

4. Next push the image to your registry.

```
docker push ghcr.io/your-org/your-image-name
```

5. Finally, for each project or repository that will use your image, craft a simplified `devcontainer.json` file that either uses the image property or references it in a Docker Compose file. Include any dev container features you added in your pre-build configuration in step 2. For example:

```
{
  "image": "ghcr.io/your-org/your-image-name",
  "features": {
    "docker-in-docker": "latest"
  }
}
```

