FROM node:12-alpine

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN npm install

RUN npm install --save @opentelemetry/api
RUN npm install --save @opentelemetry/node
RUN npm install --save @opentelemetry/tracing
RUN npm install --save @google-cloud/opentelemetry-cloud-trace-exporter

# Bundle app source
COPY . .

EXPOSE 8080
CMD [ "node", "server.js" ]
