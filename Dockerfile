FROM ubuntu:xenial

# declare variables
ENV CVER 0.3.2
ENV CREL constellation-${CVER}-ubuntu1604
ENV GOREL go1.9.3.linux-amd64.tar.gz
ENV PATH $PATH:/usr/local/go/bin

# install build dependencies
RUN apt-get update -y
RUN apt-get install -y software-properties-common unzip && \
    add-apt-repository -y ppa:ethereum/ethereum && \
    apt-get update -y && \
    apt-get install -y build-essential unzip libdb-dev libleveldb-dev libsodium-dev zlib1g-dev libtinfo-dev solc sysvbanner wrk wget git

# install constellation
RUN wget -q https://github.com/jpmorganchase/constellation/releases/download/v${CVER}/${CREL}.tar.xz
RUN tar -xJf ${CREL}.tar.xz
RUN cp $CREL/constellation-node /usr/local/bin
RUN chmod 0755 /usr/local/bin/constellation-node
RUN rm -rf ${CREL} ${CREL}.tar.xz

# install golang
RUN wget -q https://dl.google.com/go/$GOREL
RUN tar -xvzf ${GOREL}
RUN mv go /usr/local/go
RUN rm -f ${GOREL}

# make/install quorum
RUN git clone https://github.com/jpmorganchase/quorum.git
RUN cd quorum >/dev/null && git checkout tags/v2.0.1 && make all && cp build/bin/geth /usr/local/bin && cp build/bin/bootnode /usr/local/bin

# copy examples
COPY src quorum-network
WORKDIR /quorum-network

# setup/run raft network
RUN ./scripts/init.sh
CMD ["/quorum-network/scripts/start.sh"]

# done!
RUN echo "✨ The Quorum docker instance has been provisioned."
RUN echo "User 'docker run <container-id>' to create a docker container, 'docker stop <container-id>' to stop the container."
