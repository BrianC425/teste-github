## Hoje, dia 30/07/2026, instalei uma ferramenta de teste na IA local.

### -No espaço da workspace, entrei a "tools" e procurei algumas para testar
### -Encontrei uma ferramenta para fazer gráficos e tabelas, e instalei em open-webui
### -Após ativar no modelo de meteorologia, dei-me conta de que não funcionava corretamente
### -Instalei llama3.2:3b, e após confirmar que também não funcionava, tentei com outro modelo, qwen2.5:3b
### -Após confirmar que o modelo não estava a utilizar a tool e depois de pesquisar, percebi que era um erro específico do open-webui e não da tool utilizada.
### -Depois de pesquisas, consegui um método chamado mcpo, que permite ir buscar as tools a uma url especifica (self hosted neste caso) invés de utilizar o método integrado de open-webui. com ajuda de claude ai, foi criada uma ferramenta para obter a informação do clima de uma cidade específica, e descarreguei (formato .py).
### -Primeiro introduzi o comando 'pip install mcp' para instalar o serviço mcp. depois, introduzi o comando 'powershell -ExecutionPolicy ByPass -c "irm https://astral.sh/uv/install.ps1 | iex"' no powershell para instalar uvx, e de seguida 'uvx --with "mcp<2" mcpo --port 8000 -- uv run --with "mcp<2" --with requests weather_mcp_server.py' para instalar o servidor mcpo.
### -Adicionei a conexão 'http://host.docker.internal:8000' no open-webui em external tools, editei o modelo e ativei a nova conexão. foi preciso desativar as built-in tools de openwebui, pois faziam conflito com as tools instaladas manualmente.
### -Após testar, verifiquei que a ia conseguiu utilizar a ferramenta corretamente.