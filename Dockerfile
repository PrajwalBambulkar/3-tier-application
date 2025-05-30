# Stage 1: Install dependencies
FROM node:16 as builder

WORKDIR /app

# Install dependencies
COPY package*.json ./
RUN npm install

# Copy rest of the code
COPY . .

# Stage 2: Run the app
FROM node:16-alpine

WORKDIR /app

# Copy built app from builder
COPY --from=builder /app ./

EXPOSE 3000

CMD ["node", "presentation/server.js"]
