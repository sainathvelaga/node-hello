FROM node:alpine3.18 AS build
WORKDIR /app
COPY package.json ./
COPY package-lock.json ./
RUN npm install

FROM node:alpine3.18
WORKDIR /app
COPY --from=build /app/ .
EXPOSE 3000
CMD ["npm", "start"]
