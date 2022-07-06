# dev-container

Development container with pre-installed tooling (Node.js, Rust, Python, etc.) for working on Shardus projects.

## Use

1. Install the Remote Development extension for VSCode: https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack

2. Open any shardus project (shardeum/server is a good one)

3. Create a .devcontainer folder in the project root with a devcontainer.json file containing:
{
  "image": "registry.gitlab.com/shardus/dev-container",
  "workspaceMount": "",
  "runArgs": ["--userns=keep-id", "--volume=${localWorkspaceFolder}:/workspaces/${localWorkspaceFolderBasename}:Z"],
  "remoteUser": "node",
  "containerEnv": {
    "HOME": "/home/node"
  }
}


4. Hit Ctrl +Shift+p, type Remote-Containers: Rebuild and Reopen in Container , and hit Enter

This should start pulling the dev container from Gitlab, and once it's setup, give you a terminal into the container with node and npm in the path

5. Run npm install and try out containerized development 🙂

## Build

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

