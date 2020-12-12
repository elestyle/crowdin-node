FROM node:10-alpine3.9

RUN apk add curl git openssh
RUN apk --no-cache add sudo openjdk11-jre --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community
ADD https://downloads.crowdin.com/cli/v3/crowdin-cli.zip /usr/
RUN unzip -j /usr/crowdin-cli.zip && \
	sh install-crowdin-cli.sh && \
    rm /usr/crowdin-cli.zip && \
    rm *.* && \
    echo -e '#!/bin/sh\njava -jar /usr/local/bin/crowdin-cli.jar $@' > /usr/local/bin/crowdin && \
    chmod +x /usr/local/bin/crowdin

CMD ["sh"]
