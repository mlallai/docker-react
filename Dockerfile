# first phase
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# /app/build ----> will contain all the stuff

# second phase
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
# /usr/share/nginx/html is specific to nginx