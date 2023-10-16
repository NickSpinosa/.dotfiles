FROM ubuntu:focal AS base
WORKDIR /usr/local/bin
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y software-properties-common curl git build-essential && \
    apt-add-repository -y ppa:ansible/ansible && \
    apt-get update && \
    apt-get install -y curl git ansible build-essential sudo && \
    apt-get clean autoclean && \
    apt-get autoremove --yes

FROM base AS morel 
RUN addgroup --gid 1000 morel
RUN adduser --gecos morel --uid 1000 --gid 1000 --disabled-password morel
RUN adduser morel sudo
RUN echo "morel:pass" | chpasswd
USER morel
WORKDIR /home/morel

FROM morel 
COPY . .
CMD ["sh", "-c", "sudo ./install.sh"]
# CMD ["sh", "-c", "ansible-playbook ./ansible/local.yml"]
