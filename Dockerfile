# Use the Jenkins LTS image as the base
FROM jenkins/jenkins:lts

# Switch to root user to install additional software
USER root

# Update packages and install Node.js, npm, and other dependencies
RUN apt-get update && apt-get install -y \
    curl \
    gnupg \
    && curl -sL https://deb.nodesource.com/setup_16.x | bash - \
    && apt-get install -y nodejs \
    && npm install -g @angular/cli@15.1.6 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Create a directory for Jenkins to store workspace and pipelines
RUN mkdir -p /var/jenkins_home/workspace

# Set permissions for Jenkins user
RUN chown -R jenkins:jenkins /var/jenkins_home

# Switch back to Jenkins user
USER jenkins

# Expose Jenkins default port
EXPOSE 8080
