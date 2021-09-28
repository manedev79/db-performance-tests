FROM mcr.microsoft.com/mssql/server:2019-latest

USER root 

RUN mkdir -p /usr/src/perftest
WORKDIR /usr/src/perftest

COPY . /usr/src/perftest

RUN chmod +x /usr/src/perftest/init.sh

EXPOSE 1433

CMD /bin/bash ./entrypoint.sh