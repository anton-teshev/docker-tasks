# syntax=docker/dockerfile:1
FROM node:12.18.1-alpine
ENV NODE_ENV=production
WORKDIR /app
COPY ["package.json", "package-lock.json*", "./"]
RUN ["npm", "install" ]
COPY . .
RUN npm run build && npm install -g serve
CMD ["serve", "-s", "build"]
