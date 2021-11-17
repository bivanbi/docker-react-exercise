FROM node:16-alpine as builder
USER node
WORKDIR '/home/node'

COPY --chown=node:node ./package.json ./
RUN npm install
COPY --chown=node:node ./ ./
RUN npm run build

FROM nginx:alpine
COPY --from=builder /home/node/build /usr/share/nginx/html

