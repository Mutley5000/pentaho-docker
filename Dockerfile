FROM alpine:3.7

ADD https://downloads.sourceforge.net/project/pentaho/Pentaho%208.1/client-tools/pdi-ce-8.1.0.0-365.zip?r=https%3A%2F%2Fsourceforge.net%2Fprojects%2Fpentaho%2Ffiles%2Flatest%2Fdownload%3Fsource%3Dfiles&ts=1528415481 /usr/lib/pentaho/pdi-ce-8.1.0.0-365.zip
RUN mkdir /usr/lib/pentaho/pdi-ce-8.1.0.0-365 && \
    unzip -q /usr/lib/pentaho/pdi-ce-8.1.0.0-365.zip -d /usr/lib/pentaho/pdi-ce-8.1.0.0-365 && \
    apk add --update openjdk8-jre

WORKDIR /usr/lib/pentaho/pdi-ce-8.1.0.0-365/data-integration

CMD ["./carte.sh $(hostname -i) 8080 -u cluster -p cluster"]
