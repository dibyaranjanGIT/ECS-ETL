
FROM python:3.12-alpine
RUN mkdir /app
RUN apk add librdkafka-dev build-base
WORKDIR /app
RUN pip install --upgrade pip
RUN pip install flask


RUN pip install confluent-kafka====2.0.2


COPY . /app
ENTRYPOINT ["python", "-u", "main.py"]
