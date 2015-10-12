# Pull base image.
FROM quay.io/eris/base
MAINTAINER Eris Industries <support@erisindustries.com>

# configure install
ENV NAME         toadserver
ENV REPO 	eris-ltd/toadserver
ENV ALIAS 	$REPO
ENV BRANCH       master
ENV BINARY_PATH  ./cmd/$NAME
ENV CLONE_PATH   $GOPATH/src/github.com/$ALIAS
ENV INSTALL_PATH $INSTALL_BASE/$NAME
ENV INSTALL_BASE /usr/local/bin

# install
WORKDIR $CLONE_PATH
RUN git clone -q https://github.com/$REPO $CLONE_PATH && go get github.com/eris-ltd/eris-cli/cmd/eris && go build && go install  # update201510112326

# start script
COPY start.sh $INSTALL_BASE/start

# set user
USER $USER
WORKDIR $ERIS

# boot
VOLUME $ERIS
EXPOSE 11113
CMD ["start"]

