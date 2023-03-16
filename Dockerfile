FROM subinamathew/jenkins-alt:0.0.5
ENV JENKINS_USER admin
ENV JENKINS_PASS admin

# Skip initial setup
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

COPY jenkinsplugins.zip /tmp/
#COPY plugins.txt /usr/share/jenkins/plugins.txt
#RUN  jenkins-plugin-cli --plugin-file /usr/share/jenkins/plugins.txt --plugins delivery-pipeline-plugin:1.3.2 deployit-plugin
USER root
#RUN yum install -y zip unzip
USER jenkins
RUN ls /tmp
RUN mkdir $JENKINS_HOME/plugins && unzip /tmp/jenkinsplugins.zip -d $JENKINS_HOME/plugins && cp $JENKINS_HOME/plugins/new/* $JENKINS_HOME/plugins
#USER root

#RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" \
#    && sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
#RUN apt-get update
#RUN yes | apt-get install wget jq unzip
#RUN wget https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 -O /usr/bin/yq \
#    && chmod +x /usr/bin/yq
#RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
#RUN install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
#USER jenkins
