FROM node:latest

WORKDIR /app

COPY package.json /app

#RUN npm install 
RUN npm ci. ci
COPY . /app

EXPOSE 3030

CMD ["npm","run","start"]

