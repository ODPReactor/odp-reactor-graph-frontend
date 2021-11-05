# build environment
FROM node:14 as build

# clone codebase
RUN git clone https://github.com/ODPReactor/odp-reactor-browser.git /app
WORKDIR /app
# install dep
RUN yarn install
#build
RUN yarn build



# production environment
FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html
CMD ["nginx", "-g", "daemon off;"]
