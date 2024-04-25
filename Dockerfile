# Tentamos seguir as melhores práticas:
# https://docs.docker.com/develop/develop-images/dockerfile_best-practices/
# Imagem que vamos se basear do Docker Hub, foi escolhido o
# Alpine Linux por ser um sistema leve e sem bloatware
FROM node:12.22.12-alpine

# Atualiza os pacotes
RUN apk update

# Instala as dependências necessárias
RUN apk add -U curl bash ca-certificates openssl ncurses coreutils python2 make gcc g++ libgcc linux-headers grep util-linux binutils findutils npm

# Copia os arquivos e seta o diretorio /app como diretório padrão
COPY . /app
WORKDIR /app

# Adiciona o usuário netflix
RUN adduser -Ds /bin/bash netflix
RUN chown netflix /app
USER netflix

# Faz o build do website
RUN npm install
RUN npm run build

# Expõe a porta 8080
EXPOSE 8080

# Roda o comando para iniciar a aplicação web
ENTRYPOINT ["/usr/bin/npm", "run", "serve"]