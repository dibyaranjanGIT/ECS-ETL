
FROM python:3.12-alpine
RUN mkdir /app
WORKDIR /app
RUN pip install --upgrade pip
RUN pip install flask
RUN apt-get update && \
  apt-get install -y --no-install-recommends gcc git libssl-dev g++ make && \
  cd /tmp && git clone https://github.com/edenhill/librdkafka && \
  cd librdkafka && git checkout tags/v2.0.2 && \
  ./configure && make && make install && \
  ldconfig &&\
  cd ../ && rm -rf librdkafka

RUN pip install confluent-kafka====2.0.2


COPY . /app
ENTRYPOINT ["python", "-u", "main.py"]
