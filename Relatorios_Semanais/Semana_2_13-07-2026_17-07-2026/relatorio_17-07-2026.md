## No dia 17/07/2026, mudei a URL do localhost para utilizar o protocolo HTTPS invés do HTTP.

### -Primeiro, procurei os passos necessários online. Para realizar a mudança da maneira mais simples, era necessário um programa chamado Chocolatey, o qual instalei.
### -Após a instalação do chocolatey, fiz a instalação do mkcert com o comando *choco install mkcert*, e depois a instalação do certificado local *mkcert -install*. Com estes dois comandos, o Windows vai confiar em todos os certificados que sejam criados no computador,
### -De seguida, fui à pasta **teste** e criei uma subpasta chamada **certs**, onde abri uma janela cmd e fiz a criação de um certificado seguro para localhost com o comando *mkcert localhost 127.0.0.1 ::1*. Foram criados os ficheiros ***localhost.pem***, o certificado público, e o ***localhost-key.pem***, a chave privada.
### -Na pasta **backend**, editei o ficheiro ***server.js*** para adicionar duas livrarias importantes: https e fs. Adicionalmente, editei as últimas linhas do ficheiro e adicionei outras duas, para utilizar as chaves geradas e mudar o port do servidor a https.
### -Na pasta **frontend**, criei um ficheiro ***nginx.conf***, que serve para mudar o port de 80 a 443, utilizando os ficheiros criados com o comando *mkcert* anteriormente. Editei também o dockerfile para copiar o ficheiro novo ao container do frontend.
### -Depois, no ***index.html***, mudei os URL de http para https.
### -Finalmente, no ***docker-compose.yml***, editei o ficheiro para considerar a pasta /certs nos containers.