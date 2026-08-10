# Vikunja – Custom Docker Build for `/vikunja/`

This document describes the minimal changes required to build Vikunja so it can be served behind the `/vikunja/` subpath.

## Repository

The Vikunja source code is available at:

[Vikunja GitHub Repository](https://github.com/go-vikunja/vikunja?utm_source=chatgpt.com)

The Dockerfile is located in the root of the repository:

```text
Dockerfile
```

## 1. Build the frontend with `/vikunja/`

The frontend must be built with `VIKUNJA_FRONTEND_BASE` set to `/vikunja/`.

Change the frontend build step to:

```dockerfile
RUN echo "{\"VERSION\": \"${RELEASE_VERSION/-g/-}\"}" > src/version.json \
    && VIKUNJA_FRONTEND_BASE=/vikunja/ pnpm run build
```

This makes the generated frontend use `/vikunja/` as its base path.

## 2. Move frontend assets under `/vikunja/`

After building the frontend, move the assets into the `/vikunja/` directory:

```dockerfile
RUN mkdir -p ./frontend/dist/vikunja \
    && mv ./frontend/dist/assets ./frontend/dist/vikunja/assets
```

The resulting structure should be approximately:

```text
frontend/dist/
├── index.html
└── vikunja/
    └── assets/
```

## 3. Set the Vikunja version

The build should generate `src/version.json` from `RELEASE_VERSION`:

```dockerfile
RUN echo "{\"VERSION\": \"${RELEASE_VERSION/-g/-}\"}" > src/version.json
```

This is important because otherwise the build may fall back to the development version (`dev`).

Make sure `RELEASE_VERSION` is defined during the Docker build, for example:

```bash
docker build --build-arg RELEASE_VERSION=0.24.6 -t vikunja-custom .
```

## 4. Result

The custom image should contain:

```text
Frontend base: /vikunja/
API:           /api/v1/
Public URL:    https://example.com/vikunja/
```

The reverse proxy should expose the application as:

```text
https://example.com/vikunja/
```

while API requests remain accessible through:

```text
https://example.com/vikunja/api/v1/
```

