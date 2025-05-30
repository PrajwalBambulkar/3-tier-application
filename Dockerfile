# Stage 1: Build
FROM node:16 as builder

WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
# Only run build if you have a build script
RUN if [ -f package.json ] && grep -q '"build"' package.json; then npm run build; fi

# Stage 2: Run
FROM node:16-alpine
WORKDIR /app
COPY --from=builder /app .
EXPOSE 3000
CMD ["npm", "start"]
