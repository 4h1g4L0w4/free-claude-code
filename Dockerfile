FROM python:3.14-slim

WORKDIR /app

# Copia todo el código del proyecto (incluyendo api/admin_static)
COPY . .

# Instala uv
RUN pip install --no-cache-d uv

# Sincroniza dependencias usando el Python del sistema (evita descargar otra versión)
RUN uv sync --python $(which python)

# Expone el puerto
EXPOSE 8082

# Comando para ejecutar el servidor
CMD ["sh", "-c", "echo 'Docker image by https://github.com/4h1g4L0w4 forked from https://github.com/Alishahryar1/free-claude-code' && echo '' && uv run fcc-server"]
