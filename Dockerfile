FROM dockette/debian:buster

# INSTALLATION
RUN apt update && apt full-upgrade -y && \
    # DEPENDENCIES #############################################################
    apt install -y wget curl apt-transport-https ca-certificates gnupg2 && \
    # NodeJS NodeSource ##########################################################
    curl -sSL https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - && \
    VERSION=node_12.x && \
    echo "deb https://deb.nodesource.com/$VERSION buster main" | tee /etc/apt/sources.list.d/nodesource.list && \
    apt update && \
    apt install -y --no-install-recommends  nodejs && \
    npm install -g csslint && \
    # CLEAN UP #################################################################
    apt clean -y && \
    apt autoclean -y && \
    apt autoremove -y && \
    rm -rf /var/lib/apt/lists/* /var/lib/log/* /tmp/* /var/tmp/*

# COMMAND
CMD ["node"]
