FROM node:alpine
WORKDIR '/app'
COPY ./package.json ./
RUN npm install
COPY . .

# Check in package.json that start points to
# "node index.js" to start the worker process
CMD ["npm", "run", "start"]