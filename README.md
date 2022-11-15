# dev-container

A development container with pre-installed tooling (Node.js, Rust, Python, etc.) for working on Shardus projects.

## Use

1. Install the Remote Development extension for VSCode: https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack.

2. Open any Shardus project. (`shardeum/server` is a good one)

3. Create a `.devcontainer` folder in the project root with a `devcontainer.json` file containing:

    ```json
    {
      "image": "registry.gitlab.com/shardus/dev-container",
      "workspaceMount": "",
      "runArgs": [
        // "--userns=keep-id", // Need this if using Podman instead of Docker
        "--volume=${localWorkspaceFolder}:/workspaces/${localWorkspaceFolderBasename}:Z"
      ],
      "remoteUser": "node",
      "containerEnv": {
        "HOME": "/home/node"
      },
      // Configure tool-specific properties.
      "customizations": {
        // Configure properties specific to VS Code.
        "vscode": {
          // Add the IDs of extensions you want installed when the container is created.
          "extensions": [
            "mhutchie.git-graph",
            "dbaeumer.vscode-eslint",
            "esbenp.prettier-vscode"
          ]
        }
      }
    }
    ```


4. Open the Command Palette with `Ctrl` + `Shift` + `p` and select the `Remote-Containers: Rebuild and Reopen in Container` option. This should start pulling the dev container from Gitlab. Once it's ready, it will open a terminal into the container with `node` and `npm` in the path.

5. Run `npm install` and witness the power of containerized development 🙂.

*Note for QEMU users (this includes M1 and M2 Macs):*

  If you run into problems running `npm install` you may need to perform these additional steps:
  1. Create `.cargo/config.toml` file in the root directory of your project if it does not already exist
  2. Add the following to `.cargo/config.toml`
  ```[net]
     git-fetch-with-cli = true   # use the git executable for git operations
  ```
  3. Repeat steps 4 and 5.

## Build

From: https://code.visualstudio.com/docs/remote/devcontainer-cli#_example-of-building-and-publishing-an-image

1. Create a source code repository.

2. Create a dev container configuration for each image you want to pre-build, customizing as you wish (including dev container features). For example, consider this `devcontainer.json` file:

    ```json
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

    ```bash
    devcontainer build \
        --image-name ghcr.io/your-org/your-repo/your-image-name \
        change-me-to-repository-folder-with-dot-devcontainer
    ```

4. Next push the image to your registry.

    ```bash
    docker push ghcr.io/your-org/your-image-name
    ```

5. Finally, for each project or repository that will use your image, craft a simplified `devcontainer.json` file that either uses the image property or references it in a Docker Compose file. Include any dev container features you added in your pre-build configuration in step 2. For example:

    ```json
    {
      "image": "ghcr.io/your-org/your-image-name",
      "features": {
        "docker-in-docker": "latest"
      }
    }
    ```

