# Instruções para análise do Teste
  
## Teste de API  
  
Para uma melhor experiência, recomendo usar a IDE do Visual Studio Code (VSCode) para visualização dos arquivos. Durante as instruções, posso sugerir algumas extensões para melhorar a visualização.

### Casos de Testes  
  
Você encontrará os cenários de teste na pasta "files/Gherkin.feature". O formato .feature é usado para a sintaxe do Gherkin e é recomendável ter a extensão Blodwynn.featurehighlight instalada no VSCode.

### Relatório de BUGS  
  
O relatório está localizado na pasta "files/Relatório_BUGS.md" e deve ser aberto com a função *Open Preview*.

### Swagger  

Criei um exemplo de Swagger localizado na pasta "file/Swagger.yaml", que pode ser aberto no [Swagger Editor](https://editor.swagger.io/) copiando e colando o conteúdo.

### Testes Postman  

Os testes de API foram realizados com o Postman. É possível pegar os arquivos "Serasa.json" e "Globals.json" e importá-los como Collection e Environment, respectivamente, mas isso não é necessário.

### Teste Newman e HTML Extra  

O Newman é uma biblioteca para executar testes exportados do Postman. Ele interpreta e roda os testes via terminal. Também uso a biblioteca HTML Extra para gerar relatórios dos testes executados.  

Após baixar o projeto, execute o comando:  
 ~~~
 npm install
 ~~~
  
 Assim instalaremos as dependências. Em seguida, podemos utilizar o comando:
 ~~~
 npm run newmanextra
 ~~~  
   
Este comando executará o Newman e criará um relatório na pasta "reports/", que pode ser aberto com a função *Open Preview*.  
   
## Teste de END TO END  

### Testes Cypress  

Os testes End-to-End foram realizados com o Cypress. Para executá-los, será necessário instalar as dependências com o comando: (Obs: não é necessário executar novamente se já tiver sido feito para o Newman).
~~~
 npm install
~~~

Após instalação, é possivel executar os testes via interface com o comando:
~~~
npx cypress open
~~~

Ou diretamente pelo terminal com o comando:
~~~
npx cypress run
~~~

### Cypress mochawesome-reporter  

Foi adicionada uma biblioteca de relatório ao projeto. O relatório será criado automaticamente após a execução do comando "npx cypress run". O arquivo "index.html" será criado na pasta "cypress/reports/html/" e, caso já exista, será substituído.