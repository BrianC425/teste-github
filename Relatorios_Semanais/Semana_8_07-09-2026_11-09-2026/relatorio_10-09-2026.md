## Hoje, verifiquei novamente o container criado no dia anterior, para confirmar o seu funcionamento.

### Dei me conta de que não estava a funcionar, pois ambos modelos recusavam-se a responder às perguntas feitas. Criei um novo container "sender" e o problema ficou resolvido. O novo comando para enviar prompts passou a ser : docker run --rm --network ai-rede prompt-sender-v2 "PROMPT"