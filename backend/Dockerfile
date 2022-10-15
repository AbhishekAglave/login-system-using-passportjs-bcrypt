FROM node:latest

WORKDIR /app
COPY package*.json /app
RUN npm install
COPY . /app/
RUN apt update && apt install netcat iputils-ping -y 
EXPOSE 8000
CMD ["npm", "start"]