#build
FROM node:alpine as build

WORKDIR /usr/app

COPY package.json .

RUN npm install

COPY . .

#apparently these aren't needed now
#RUN chown -R node /usr/app/node_modules

#USER node

RUN npm run build
#end build

#deploy
FROM nginx

COPY --from=build /usr/app/build /usr/share/nginx/html
