FROM node:16 as build
WORKDIR /frontend
COPY package.json package-lock.json ./
RUN npm install
COPY . .
RUN npm run build

# Stage 2: Serve the application using Nginx
FROM nginx:alpine
COPY --from=build /frontend/dist/summer-workshop-angular /usr/share/nginx/html
