## Hoje, configurei o meu Ollama para funcionar através do RabbitMQ.

### 1- Criei um cliente ai-consumer, editei o docker-compose.yml para apontar a "bridge"
### 2- Ao verificar que nao funcionava, tive de criar uma nova rede virtual e adicionar o container ollama com os comandos docker network create ai-rede / docker network connect ai-rede ollama. Previamente estava em 'bridge' e por tanto não conseguia ligar o rabbitmq
### 3- Iniciei os containers com docker compose, verificando que estavam a funcionar corretamente (ou seja, ollama estava ligado ao rabbitmq)
### 4- Criei um container pequeno para enviar as prompts requeridas através do rabbitmq. quando for necessário enviar uma prompt, é usado o comando docker run --rm --network ai-rede enviar-prompt "PROMPT" llama3.2:1b
### 5- Verifiquei o output da prompt em localhost:15672 (a página de rabbitmq) na parte de queues and streams e get messages. assim, o sistema fica a funcionar: producer (envia prompt) - rabbit mq - consumer IA - queue resultados - consumer resultados.