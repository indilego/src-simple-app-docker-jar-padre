FROM openshift/base-centos7

ENV JAVA_HOME /usr/lib/jvm/java
ENV JAVA_VERSION 1.8.0

EXPOSE 8080

LABEL io.k8s.description="Platform for building and running Spring Boot applications" \
      io.k8s.display-name="Spring Boot Maven 3" \
      io.openshift.expose-services="8080:http" \
      io.openshift.tags="builder,java,java8,maven,maven3,springboot"

RUN yum update -y && \
  yum install -y curl && \
  yum install -y java-$JAVA_VERSION-openjdk java-$JAVA_VERSION-openjdk-devel && \
  yum clean all
  
RUN git clone https://github.com/indilego/src-simple-app-docker-jar-hijo.git /myapp/
RUN cp -r /myapp/* /opt/app-root/src/
