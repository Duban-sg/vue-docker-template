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