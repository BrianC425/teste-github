## Hoje, consegui introduzir dois agentes a funcionar no RabbitMQ.

### 1- adicionei os container llama_consumer e qwen_consumer, modificando cada ficheiro .py para especificar o modelo de cada um.
### 2- modifiquei o docker-compose.yml para especificar a especialidade de cada modelo, o llama com especialidade em ciencia e o qwen com especialidade em historia
### 3- introduzi prompts em cada ficheiro .py para especificar a maneira em que os modelos iam responder (se a prompt tiver algo a ver com a tua especialidade, responde sim; senao, responde nao)
### 4- a prompt envia-se no cmd com o comando : docker run --rm --network ai-rede prompt-sender "PROMPT". se o agente responder yes, a resposta da prompt é enviada á queue result_queue do rabbitmq, a qual podemos verificar na página. se responder nao, a prompt nunca é respondida pelo agente. no entanto, ele é o que le a prompt e verifica se pode ou nao responder. outra forma de verificar as respostas é através dos logs : docker-compose logs -f llama_consumer qwen_consumer result_consumer

### assim, o funcionamento é: a prompt é enviada ao exchange de rabbitmq, que a duplica e a envia para os queues de llama e qwen respetivamente. os consumers de llama e qwen leem a prompt em cada uma das suas queues, e determinam se conseguem ou não responder. se conseguirem, o resultado é enviado para result_consumer, onde conseguimos verificar.