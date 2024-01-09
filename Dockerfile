FROM node:latest

WORKDIR /app

COPY package.json /app

RUN npm install 
#RUN npm ci
COPY . /app

EXPOSE 3030

CMD ["npm","run","start"]

