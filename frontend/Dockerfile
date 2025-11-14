FROM node:latest AS builder
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build

FROM node:latest AS runner
WORKDIR /app
ENV NODE_ENV=production
ENV PORT=3000
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/payload ./payload
COPY --from=builder /app/server.js ./server.js
COPY --from=builder /app/collections ./collections
COPY --from=builder /app/uploads ./uploads
EXPOSE 3000
CMD ["npm", "start"]
