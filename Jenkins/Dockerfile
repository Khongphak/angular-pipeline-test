# Use the Jenkins LTS image as the base
FROM jenkins/jenkins:lts

# Expose Jenkins default port
EXPOSE 8080

# Switch to root user to install additional software
USER root

# Update packages and install Node.js, npm, and other dependencies
RUN groupadd docker && usermod -aG docker jenkins

RUN apt-get update && apt-get install -y \
    docker.io

# Switch back to Jenkins user
USER jenkins


