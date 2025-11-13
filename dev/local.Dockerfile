FROM node:latest
WORKDIR /app
ENV NODE_ENV=development
COPY frontend/package*.json ./
RUN npm install
COPY frontend/ .
COPY dev/local.env .env
EXPOSE 3000
CMD ["npm", "run", "dev"]
