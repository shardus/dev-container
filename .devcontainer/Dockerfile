# [Choice] Node.js version (use -bullseye variants on local arm64/Apple Silicon): 18, 16, 14, 18-bullseye, 16-bullseye, 14-bullseye, 18-buster, 16-buster, 14-buster
ARG VARIANT=18-bullseye
FROM mcr.microsoft.com/vscode/devcontainers/typescript-node:0-${VARIANT}

# [AS] Install Rust and Python here; remove this when "features" bug is fixed:
# https://github.com/microsoft/vscode-remote-release/issues/6851#issuecomment-1163303463
# [Optional] Uncomment this section to install additional OS packages.
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends curl build-essential gcc make python-is-python3 python3
RUN su node -c "curl https://sh.rustup.rs -sSf | bash -s -- -y"
ENV PATH="/node/.cargo/bin:${PATH}"

# [Optional] Uncomment if you want to install an additional version of node using nvm
ARG EXTRA_NODE_VERSION=18.16.0
RUN su node -c "source /usr/local/share/nvm/nvm.sh && nvm install ${EXTRA_NODE_VERSION}"

# [Optional] Uncomment if you want to install more global node packages
# RUN su node -c "npm install -g <your-package-list -here>"
