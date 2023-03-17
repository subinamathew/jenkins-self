FROM subinamathew/jenkins-alt:0.0.7
RUN mkdir -p $JENKINS_HOME/jobs/mock/
COPY job.xml $JENKINS_HOME/jobs/mock/config.xml
