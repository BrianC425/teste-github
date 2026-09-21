## Hoje, dia 18/06/2026, procurei maneiras de ter um modelo Ollama a correr num servidor web sem custo, encontrando o serviço Colab da Google. Permite criar uma notebook e instalar modelos na cloud sem nenhum tipo de custo, mas também conta com planos pago para maior capacidade de memória.

### 1 - Para ter os modelos a funcionar, é preciso criar uma nova notebook e correr os comandos "!apt-get install -y zstd" e "!curl -fsSL https://ollama.com/install.sh | sh", um depois do outro.

### 2 - Depois, é preciso instalar o modelo desejado:
#### " import subprocess, time
#### subprocess.Popen(["ollama", "serve"])
#### time.sleep(5)
#### !ollama pull MODELO
#### !ollama run MODELO "Olá" "

### 3 - Assim, o modelo fica a funcionar.