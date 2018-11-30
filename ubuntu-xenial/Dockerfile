FROM sourceforts/steamcmd:ubuntu-xenial
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
ENV SRCDS_PW=""

ENV SRCDS_AUTOUPDATE=$SOURCE_HOME_DIR/autoupdate.txt
COPY --chown=steam:steam autoupdate.txt $SRCDS_AUTOUPDATE

# Run Steamcmd and install dependencies
# - 244310      Source SDK Base 2013 Dedicated Server
# - 243750      Source SDK Base 2013 Multiplayer
RUN steamcmd.sh +login $steam_username $steam_password \
        +force_install_dir $STEAM_USER_DIR \
        +app_update 244310 validate \
        +app_update 243750 validate \
        +quit

# Link fix for some libraries
RUN ln -s $STEAMCMD_DIR/linux32 $STEAM_USER_DIR/.steam/sdk32
RUN ln -s $STEAM_USER_DIR/bin/steamclient.so $STEAMCMD_DIR/linux32/steamclient.so

# Expose ports
EXPOSE 27005/udp
EXPOSE 27015/tcp
EXPOSE 27015/udp
EXPOSE 27020/udp
EXPOSE 26900/udp
EXPOSE 51840/udp

WORKDIR $STEAM_USER_DIR
