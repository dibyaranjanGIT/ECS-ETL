
FROM python:3.9.11-alpine3.15 
RUN mkdir /app
RUN apk add librdkafka-dev build-base
WORKDIR /app
RUN apk --no-cache upgrade \
    && pip install --upgrade pip \
    && apk --no-cache add tzdata build-base gcc libc-dev g++ make git bash

RUN git clone https://github.com/edenhill/librdkafka.git && cd librdkafka \
    && git checkout tags/v2.2.0 && ./configure --clean \
    && ./configure --prefix /usr/local \
    && make && make install
    
RUN pip install flask

RUN pip install confluent-kafka====2.2.0

COPY . /app
ENTRYPOINT ["python", "-u", "main.py"]
