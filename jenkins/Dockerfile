FROM jenkins/jenkins:lts

COPY jobs/ /usr/share/jenkins/ref/jobs/
COPY secrets/ /usr/share/jenkins/ref/secrets/
COPY configs/* /usr/share/jenkins/ref/

RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

USER root

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl \
    && chmod +x ./kubectl \
    && mv ./kubectl /usr/local/bin/kubectl \
    && mkdir -p /var/jenkins_home/.kube

RUN wget https://download.docker.com/linux/ubuntu/dists/bionic/pool/stable/amd64/docker-ce-cli_18.09.7~3-0~ubuntu-bionic_amd64.deb \
    && dpkg -i ./docker-ce-cli_18.09.7~3-0~ubuntu-bionic_amd64.deb \
    && apt-get update \
    && apt-get install -y awscli

COPY linux-amd64/helm /usr/local/bin/helm

COPY config /var/jenkins_home/.kube/config