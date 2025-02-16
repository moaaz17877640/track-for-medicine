FROM node:16
WORKDIR /app
COPY package*.json .

COPY . .

RUN apt-get update && apt-get install -y python3 make g++ && rm -rf /var/lib/apt/lists/*
RUN npm install
RUN npm install -g node-pre-gyp
RUN npm rebuild bcrypt --build-from-source
EXPOSE 3000
#RUN npm run build
CMD ["node", "server.js"]