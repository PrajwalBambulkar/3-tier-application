# Stage 1: Build
FROM node:16 as builder

WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build  # This will now work

# Stage 2: Run
FROM node:16-alpine
WORKDIR /app
COPY --from=builder /app .
EXPOSE 3000
CMD ["node", "dist/server.js"]  # Adjust path if needed
