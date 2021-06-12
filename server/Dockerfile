FROM node:alpine
WORKDIR '/app'
COPY ./package.json ./
RUN npm install
COPY . .

# Check in package.json that dev points to
# nodemon which is a utility tool to reload
# the app if a file changes on disk.
CMD ["npm", "run", "start"]