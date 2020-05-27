FROM node:8

RUN mkdir /app
ADD . /app
COPY . /app
WORKDIR /app
RUN npm install

CMD node index.js
