# Use official Node 22 slim image
FROM node:23-slim

ARG N8N_VERSION=1.89.2

USER root

# Install system-level dependencies
RUN apt-get update && \
    apt-get install -y \
        python3 \
        python3-pip \
        gdal-bin \
        build-essential && \
    rm -rf /var/lib/apt/lists/*

    # Optional: install Python packages (extend later)
RUN pip3 install --no-cache-dir numpy pandas

# Install n8n and global node tools
RUN npm install -g n8n lodash slugify axios


WORKDIR /data

EXPOSE $PORT

ENV N8N_USER_ID=root

CMD export N8N_PORT=$PORT && n8n start