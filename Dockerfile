FROM jenkins/jenkins:alpine
ENV JENKINS_USER admin
ENV JENKINS_PASS admin

# Skip initial setup
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false


COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN   jenkins-plugin-cli --plugin-file /usr/share/jenkins/plugins.txt --plugins delivery-pipeline-plugin:1.3.2 deployit-plugin
USER root
RUN apk add docker
RUN apk add py-pip

USER jenkins
