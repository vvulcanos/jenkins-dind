FROM jenkins/jenkins:2.467-alpine-jdk21
USER root
RUN apk update && \
	apk add docker && \
	addgroup jenkins docker && \
	apk cache clean

USER jenkins
RUN jenkins-plugin-cli --plugins "blueocean docker-workflow"
