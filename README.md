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
## Partindo para Containers

Depois de ja ter a aplicação em mãos, rodando em máquina local, chegou a hora de isolarmos a aplicação em um container.
Portanto, criei um arquivo chamado Dockerfile, e dentro do arquivo coloquei as seguites instruções:

## Utiliza como base a imagem do Nodejs 14
   ```
   FROM node:14-alpine3.14
   ```


## Diretório de trabalho do Docker
```
WORKDIR /home/src/app
```

#Copia o arquivo package.json para o container
COPY package.json .

#Instala as dependencias do package.json no container
RUN npm install

#Copia todos os arquivos do diretório atual onde esta o Dockerfile para o container
COPY . .

Abre a porta 3000 para comunicação com o container.
EXPOSE 3000

Inicia o projeto no container
CMD [ "npm","start" ]
   ```
Runs the app in the development mode.\
Open [http://localhost:3000](http://localhost:3000) to view it in the browser.

The page will reload if you make edits.\
You will also see any lint errors in the console.

### `yarn test`

Launches the test runner in the interactive watch mode.\
See the section about [running tests](https://facebook.github.io/create-react-app/docs/running-tests) for more information.

### `yarn build`

Builds the app for production to the `build` folder.\
It correctly bundles React in production mode and optimizes the build for the best performance.

The build is minified and the filenames include the hashes.\
Your app is ready to be deployed!

See the section about [deployment](https://facebook.github.io/create-react-app/docs/deployment) for more information.

### `yarn eject`

**Note: this is a one-way operation. Once you `eject`, you can’t go back!**

If you aren’t satisfied with the build tool and configuration choices, you can `eject` at any time. This command will remove the single build dependency from your project.

Instead, it will copy all the configuration files and the transitive dependencies (webpack, Babel, ESLint, etc) right into your project so you have full control over them. All of the commands except `eject` will still work, but they will point to the copied scripts so you can tweak them. At this point you’re on your own.

You don’t have to ever use `eject`. The curated feature set is suitable for small and middle deployments, and you shouldn’t feel obligated to use this feature. However we understand that this tool wouldn’t be useful if you couldn’t customize it when you are ready for it.

## Learn More

You can learn more in the [Create React App documentation](https://facebook.github.io/create-react-app/docs/getting-started).

To learn React, check out the [React documentation](https://reactjs.org/).

### Code Splitting

This section has moved here: [https://facebook.github.io/create-react-app/docs/code-splitting](https://facebook.github.io/create-react-app/docs/code-splitting)

### Analyzing the Bundle Size

This section has moved here: [https://facebook.github.io/create-react-app/docs/analyzing-the-bundle-size](https://facebook.github.io/create-react-app/docs/analyzing-the-bundle-size)

### Making a Progressive Web App

This section has moved here: [https://facebook.github.io/create-react-app/docs/making-a-progressive-web-app](https://facebook.github.io/create-react-app/docs/making-a-progressive-web-app)

### Advanced Configuration

This section has moved here: [https://facebook.github.io/create-react-app/docs/advanced-configuration](https://facebook.github.io/create-react-app/docs/advanced-configuration)

### Deployment

This section has moved here: [https://facebook.github.io/create-react-app/docs/deployment](https://facebook.github.io/create-react-app/docs/deployment)

### `yarn build` fails to minify

This section has moved here: [https://facebook.github.io/create-react-app/docs/troubleshooting#npm-run-build-fails-to-minify](https://facebook.github.io/create-react-app/docs/troubleshooting#npm-run-build-fails-to-minify)
