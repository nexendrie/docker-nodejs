FROM dockette/debian:buster

# INSTALLATION
RUN apt update && apt full-upgrade -y && \
    # DEPENDENCIES #############################################################
    apt install -y wget curl apt-transport-https ca-certificates snapd && \
    # NodeJS ##########################################################
    snap install node --classic --channel=12 && \
    npm install -g csslint && \
    # CLEAN UP #################################################################
    apt clean -y && \
    apt autoclean -y && \
    apt autoremove -y && \
    rm -rf /var/lib/apt/lists/* /var/lib/log/* /tmp/* /var/tmp/*

# COMMAND
CMD ["node"]
