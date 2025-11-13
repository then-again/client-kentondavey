FROM node:latest AS dependencies
WORKDIR /app
COPY package*.json ./
RUN npm ci

FROM node:latest AS builder
WORKDIR /app
COPY --from=dependencies /app/node_modules ./node_modules
COPY ./ .
RUN npm run build

FROM node:latest AS runner
WORKDIR /app
ENV NODE_ENV=production
ENV PORT=3000
COPY --from=dependencies /app/node_modules ./node_modules
COPY package*.json ./
COPY --from=builder /app/public ./public
COPY --from=builder /app/.next ./.next
EXPOSE 3000
CMD ["npm", "start"]