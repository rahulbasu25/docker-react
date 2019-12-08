FROM node:alpine as builder-phase

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

FROM nginx as run-phase

COPY --from=builder-phase /app/build /usr/share/nginx/html

