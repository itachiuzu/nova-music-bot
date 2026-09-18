FROM python:3.9-slim-bullseye

RUN apt-get update && \
    apt-get install -y git curl ffmpeg && \
    rm -rf /var/lib/apt/lists/*

COPY requirements.txt /requirements.txt

RUN pip install --upgrade pip && \
    pip install -U -r /requirements.txt

WORKDIR /MusicPlayer

COPY . /MusicPlayer
COPY startup.sh /startup.sh

RUN chmod +x /startup.sh

CMD ["/bin/bash", "/startup.sh"]
