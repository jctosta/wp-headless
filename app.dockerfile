FROM node:13.12.0-alpine3.10

ARG WORDPRESS_API_URL

WORKDIR /app
# COPY . .
RUN npx create-next-app --example cms-wordpress .
# RUN npm install && npm run build
RUN npm install

EXPOSE 3000

CMD ["npm", "run", "dev"]