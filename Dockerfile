FROM node:8

RUN mkdir /app
ADD . /app
COPY . /app
WORKDIR /app

CMD node index.js