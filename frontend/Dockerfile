
FROM node:10.24.1-alpine AS builder

WORKDIR /app

COPY package.json package-lock.json ./
RUN npm ci

COPY . .
RUN npm run build -- --configuration production

FROM nginx:1.27-alpine

COPY ./docker/nginx-default.conf /etc/nginx/conf.d/default.conf

COPY --from=builder /app/dist/frontend/ /usr/share/nginx/html/

EXPOSE 80

