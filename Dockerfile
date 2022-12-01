FROM node:18-alpine AS build
WORKDIR /app
COPY . .
RUN yarn install && yarn run build


FROM nginx:stable-alpine
COPY --from=build /app/build /var/app
COPY --from=build /app/nginx.conf /etc/nginx/conf.d/default.conf