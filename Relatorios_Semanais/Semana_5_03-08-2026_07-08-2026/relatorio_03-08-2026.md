## Hoje, dia 03/08/2026, implementei o servidor SearXNG no Open-WebUI para permitir busquedas na internet.

### -Primeiro fiz download da imagem do searxng com o comando **docker pull docker.io/searxng/searxng:latest**.
### -Configurei com o port 8081 e o path do container ***/etc/searxng***
### -Para permitir ao open webui fazer conexao com o searxng, criei uma rede virtual com **docker network create ai-network** e configurei ambos containers para estarem nessa mesma rede com **docker network connect ai-network open-webui** e **docker network connect ai-network searxng**.
### -Adicionei o query url em openwebui **(http://searxng:8080/search?q=<query>&format=json )**.
### -Ao nao conseguir que funcionasse, adicionei uma ferramenta de busca ao servidor mcpo criado anteriormente para utilizar no lugar do servidor de búsqueda nativo do open-webui, e verifiquei o funcionamento do mesmo.
