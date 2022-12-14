FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    autoconf \
    build-essential \
    cmake \
    git \
    libfuse-dev \
    libtool \
    libxml2-dev \
    pkg-config \
    python3-dev