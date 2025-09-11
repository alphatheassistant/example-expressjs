FROM node:slim

WORKDIR /app
COPY . .

# Instead of npm ci (strict), use npm install (for auto lockfile update)
RUN npm install

ARG PORT
EXPOSE ${PORT:-3000}

CMD ["npm", "run", "start"]
