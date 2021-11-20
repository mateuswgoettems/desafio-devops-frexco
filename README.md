# Desafio DevOps Frexco

O desafio proposto é fazer o deploy de uma aplicação React, utilizando conceitos de DevOps

## Requisitos

1 - Aplicação deverá ser versionada e publicada para apresentação em repositório git.

2 - Instruções indispensáveis:

   - Aplicação deverá conter um arquivo Dockerfile para realizar a build (construção da aplicação);
   - O arquivo responsável por subir o container deverá ser o Docker-compose contendo as demais informações (Ex. porta, nome, imagem e etc...);
   - O container deverá rodar em uma porta diferente da 3000, pois a aplicação em React já vem pré-configurada para isso, e queremos que explore e entenda as configurações de porta do Docker.

### Instalação...
```
npx create-react-app 
cd my-app
npm start
```
#### Partindo para Containers

Depois de ja ter a aplicação em mãos, rodando em máquina local, chegou a hora de isolarmos a aplicação em um container.
Portanto, criei um arquivo chamado Dockerfile, e dentro do arquivo coloquei as seguites instruções:

#### Utiliza como base a imagem do Nodejs 14
   
```
FROM node:14-alpine3.14
```

#### Diretório de trabalho do Docker
```
WORKDIR /home/src/app
```

#### Copia o arquivo package.json para o container
```
COPY package.json .
```

#### Instala as dependencias do package.json no container
```
RUN npm install
```

#### Copia todos os arquivos do diretório atual onde esta o Dockerfile para o container

```
COPY . .
```

#### Abre a porta 3000 para comunicação com o container.
```
EXPOSE 3000
```

#### Inicia o projeto no container
```
CMD [ "npm","start" ]
```

#### Ao final, o arquivo deve ficar igual esse:
```
FROM node:14-alpine3.14

WORKDIR /home/src/app

COPY package.json .

RUN npm install

COPY . .

EXPOSE 3000

CMD [ "npm","start" ]
```

Construído o Dockerfile, vamos criar a imagem. Para isso, execute o comando:
```
docker build -t mateuswelter01/projects:reactapp-v1.0 .
```

Utilizei a flag -t seguido de um nome, para dar um nome e tag ao container.

Após terminar o build da imagem, podemos ve-la com o comando `docker images`

```
REPOSITORY                TAG             IMAGE ID       CREATED              SIZE
mateuswelter01/projects   reactapp-v1.0   dd8a03df4a65   About a minute ago   370MB
node                      14-alpine3.14   f7229193551e   7 days ago           118MB
```

Agora, vamos subir essa imagem para o DockerHub. Para isso, é necessário ter uma conta no DockerHub.

````
docker login
````
Preenchido o login com as credenciais, vamos realizar o push dessa imagem para o DockerHub.

```
docker push mateuswelter01/projects:reactapp-v1.0

```

## Usando o docker-compose e o Dockerfile

Agora, para utilizar o docker-compose, utilizamos um arquivo docker-compose de extensão .yaml (ou yml).

O arquivo ficará assim:

```
version: '3'
services:
  react-app:
    container_name: reactapp
    build:
      context: .
      dockerfile: Dockerfile
    ports:
      - "3001:3000"
```
Aqui, utilizando o docker-compose, fizemos a build da imagem, e apontamos a porta 3001 da nossa maquina para a porta 3000 do container.

Com isso, ja é possivel acessar a aplicação rodando na porta 3000 do nosso container na porta 3000 da maquina onde estamos executando o docker.


