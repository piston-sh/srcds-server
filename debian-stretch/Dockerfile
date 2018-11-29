FROM sourceforts/steamcmd:debian-stretch
LABEL maintainer="admin@deniscraig.com"

ARG steam_username 
ARG steam_password

ENV HOSTNAME="docker-dedicated-server"
ENV SRCDS_FPSMAX=300
ENV SRCDS_TICKRATE=128
ENV SRCDS_PORT=27015
ENV SRCDS_TV_PORT=27020
ENV SRCDS_MAXPLAYERS=20
ENV SRCDS_RCONPW="changeme" 
ENV SRCDS_PW="changeme"

ENV SRCDS_AUTOUPDATE=$SOURCE_HOME_DIR/autoupdate.txt
COPY --chown=steam:steam autoupdate.txt $SRCDS_AUTOUPDATE

# Run Steamcmd and install dependencies
# - 244310      Source SDK Base 2013 Dedicated Server
# - 243750      Source SDK Base 2013 Multiplayer
RUN steamcmd.sh +login $steam_username $steam_password \
        +force_install_dir $STEAM_HOME_DIR \
        +app_update 244310 validate \
        +app_update 243750 validate \
        +quit

# We need access to i386 arch 32-bit binaries required by srcds_run
USER root
COPY sources.list /etc/apt/sources.list
RUN dpkg --add-architecture i386

RUN apt-get update && apt-get upgrade -y --allow-unauthenticated

RUN apt-get install -y --allow-unauthenticated \
    software-properties-common \
    lib32tinfo5 \
    lib32ncurses5 \
    libssl1.0.0:i386 \
    lib32stdc++6 \
    libcurl4-gnutls-dev:i386 \
    libldap-2.4-2:i386 \
    lib32z1 \
    g++-multilib \
    libc6 \
    libc6-dev-i386 \
    libopenal1:i386 \
    libfontconfig1:i386 \
    libfreetype6:i386 \
    libxtables-dev:i386 \
    libatm1:i386 \
    gdb
    
RUN apt-get clean autoclean && \
    apt-get autoremove -y && \
    rm -rf /var/lib/{apt,dpkg,cache,log}/

USER steam

# Linking libs n ting
RUN ln -s $STEAMCMD_DIR/linux32 $STEAM_HOME_DIR/.steam/sdk32
ENV LD_LIBRARY_PATH=$STEAM_HOME_DIR/bin:$STEAMCMD_DIR/linux32:/lib:/lib32:/lib64:/libx32

# Expose ports
EXPOSE 27005/udp
EXPOSE 27015/tcp
EXPOSE 27015/udp
EXPOSE 27020/udp
EXPOSE 26900/udp
EXPOSE 51840/udp

WORKDIR $STEAM_HOME_DIR
