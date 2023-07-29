FROM node:lts-bookworm

COPY index.ts package.json yarn.lock tsconfig.json ./

RUN apt-get update; \
    apt-get install python3 python3-pip unoconv libreoffice-java-common default-jre -y; \
    pip install unoserver==1.4; \
    yarn install; \
    yarn tsc; \
    rm -rf .yarn index.ts

CMD ["node", "index.js"]