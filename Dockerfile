# build stage
FROM node:16.13.0 as build-stage
WORKDIR /app
RUN npm install -g pnpm
COPY package.json pnpm-lock.yaml .npmrc ./
RUN pnpm install
COPY . .
RUN pnpm build

# production stage
FROM nginx:stable-alpine as production-stage

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV TZ Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

COPY --from=build-stage /app/slides /usr/share/nginx/html

EXPOSE 80

ENTRYPOINT ["nginx", "-g", "daemon off;"]
