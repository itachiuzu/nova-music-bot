FROM python:3.11-slim-bookworm

RUN apt-get update && \
    apt-get install -y --no-install-recommends ffmpeg git curl && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /MusicPlayer

COPY requirements.txt .

RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

COPY . .

RUN chmod +x startup.sh

CMD ["./startup.sh"]
