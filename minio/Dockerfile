FROM ubuntu:20.04

# Definir a variável de ambiente para desativar interações
ENV DEBIAN_FRONTEND=noninteractive

# Atualizar os repositórios e instalar curl, bash e wget sem interação
RUN apt-get update && \
    apt-get install -y --no-upgrade curl bash wget && \
    # Baixar e instalar o MinIO Client (mc)
    wget https://dl.min.io/client/mc/release/linux-amd64/mc -O /usr/local/bin/mc && \
    chmod +x /usr/local/bin/mc && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copiar arquivos necessários para a inicialização
COPY docker-entrypoint-initdb.d/ /docker-entrypoint-initdb.d/
COPY entrypoint.sh /entrypoint.sh

# Tornar o script de inicialização executável
RUN chmod +x /entrypoint.sh

# Definir o entrypoint
ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]