
#checkov:skip=CKV_DOCKER_2: "health check instruction skipped"
#checkov:skip=CKV_DOCKER_3: "user creation skipped"

FROM node:20

# Set the working directory
WORKDIR /app

RUN apt-get update && apt-get install -y \
    build-essential \
    curl

# Copy the application code
COPY . .

# Download and install Yarn
RUN curl -o- -L https://yarnpkg.com/install.sh | bash

# Add Yarn to PATH
ENV PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Install project dependencies
RUN yarn install --frozen-lockfile && yarn build && ls -la
