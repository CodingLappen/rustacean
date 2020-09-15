FROM ubuntu:20.04

ENV PATH "/root/.local/share/ponyup/bin:$PATH"

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    ca-certificates \
    clang \
    curl \
    g++ \
    git \
    make \
  && rm -rf /var/lib/apt/lists/*

RUN sh -c "$(curl --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/ponylang/ponyup/latest-release/ponyup-init.sh)" \
 && ponyup update ponyc release --platform=ubuntu20.04 \
 && ponyup update stable release \
 && ponyup update corral release \
 && ponyup update changelog-tool release



