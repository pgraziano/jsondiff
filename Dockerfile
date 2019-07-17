FROM node:latest
RUN npm install -g json-diff
ENTRYPOINT ["json-diff"]
