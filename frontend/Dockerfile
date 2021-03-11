FROM node:14.16-alpine AS builder

WORKDIR /frontend

COPY . .
RUN npm install
RUN npm run build

FROM nginx:1.18-alpine

WORKDIR /usr/share/nginx/html

RUN rm -rf ./*
COPY --from=builder /frontend/dist .
EXPOSE 8080

ENTRYPOINT ["nginx", "-g", "daemon off;"]