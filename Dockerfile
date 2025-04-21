
FROM python:3.9-alpine
RUN mkdir /app
WORKDIR /app
RUN pip install --upgrade pip
RUN pip install confluent-kafka
RUN pip install flask


COPY . /app
ENTRYPOINT ["python", "-u", "main.py"]
