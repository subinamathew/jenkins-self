FROM jenkins/jenkins:alpine
ENV JENKINS_USER admin
ENV JENKINS_PASS admin

# Skip initial setup
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false


COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN  jenkins-plugin-cli --plugin-file /usr/share/jenkins/plugins.txt --plugins delivery-pipeline-plugin:1.3.2 deployit-plugin
USER root
RUN apk add docker
RUN apk add py-pip
#RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" \
#    && sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

RUN wget https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 -O /usr/bin/yq \
    && chmod +x /usr/bin/yq

USER jenkins
