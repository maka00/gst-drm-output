FROM debian:bookworm

RUN apt update && apt upgrade


RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -qq -y install \
  vim \
  curl \
  mc \
  tmux \
  gstreamer1.0* \
  wget \
  less \
  build-essential \
  pkg-config \
  unzip \
  python3-pip \
  python3-venv 

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -qq -y install \
  git


RUN sh -c "$(curl --location https://taskfile.dev/install.sh)" -- -d -b /usr/local/bin

COPY start.sh /opt/app/start.sh
COPY Taskfile.yml /opt/app/Taskfile.yml

WORKDIR /opt/app

CMD ["/bin/bash", "/opt/app/start.sh"]

