FROM node:20-bullseye

COPY index.ts package.json yarn.lock tsconfig.json ./

RUN apt-get update; \
    apt-get install python3 python3-pip unoconv libreoffice-java-common default-jre -y; \
    pip install unoserver; \
    yarn install; \
    yarn tsc

CMD ["node", "index.js"]