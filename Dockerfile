FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
RUN mkdir node_modules/.cache && chmod -R 777 node_modules/.cache
COPY . .
# CMD ["npm", "run", "build"]
RUN npm run build


# /app/build

FROM nginx 
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html