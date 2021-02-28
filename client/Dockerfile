# BUILD PHASE
FROM node:14.14.0-alpine as builder
WORKDIR '/app'
COPY ./package.json ./
RUN npm install
COPY . .
RUN npm run build

# RUN PHASE
FROM nginx
EXPOSE 3000
COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf
# we care only about /app/build folder
# Nginx has it's own command to start
COPY --from=builder /app/build /usr/share/nginx/html
