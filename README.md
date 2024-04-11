# vue-docker-template

This template should help get you started developing with Vue 3 in Vite.

## Recommended IDE Setup

[VSCode](https://code.visualstudio.com/) + [Volar](https://marketplace.visualstudio.com/items?itemName=Vue.volar) (and disable Vetur).

## Customize configuration

See [Vite Configuration Reference](https://vitejs.dev/config/).
## prerequisites
Before you begin, make sure you have the following prerequisites installed:
-[node js end npm](https://docs.npmjs.com/downloading-and-installing-node-js-and-npm).
-[Docker](https://docs.docker.com/engine/install/).

## Project Setup

```sh
npm install
```

### Compile and Hot-Reload for Development

```sh
npm run dev
```

### Compile and Minify for Production

```sh
npm run build
```

### Run Unit Tests with [Vitest](https://vitest.dev/)

```sh
npm run test:unit
```
## Configuring the Dockerfile
-	Dockerfile
```sh
FROM node:20-alpine as build-stage

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

ARG VUE_APP_APP_NAME 
ENV VUE_APP_APP_NAME $VUE_APP_APP_NAME

RUN npm run build

# etapa de producción
FROM nginx:1.13.12-alpine as production-stage

COPY --from=build-stage /app/dist /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

```
## Distribution using Docker
-1. Build the Docker Image:
```sh
docker build --build-arg VUE_APP_APP_NAME=prueba_js -t  vue_js .
```
-2. Run the Docker container:
```sh
docker run 8080:8080 vue_js
```
--The app be available on http://localhost:8080.--
