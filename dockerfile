FROM node:13-alpine

WORKDIR ./

COPY package*.json ./

COPY . .

RUN npm install 

EXPOSE 8080

CMD node index.js