FROM node:20.2-alpine3.16 as builder
WORKDIR /app

COPY . .
RUN npm install

RUN npm run build

FROM nginx:stable-alpine
# Remove default nginx website
RUN rm -rf /usr/share/nginx/html/*

COPY --from=builder /app/dist /usr/share/nginx/html


#CMD ["nginx", "-g", "daemon off;"]
