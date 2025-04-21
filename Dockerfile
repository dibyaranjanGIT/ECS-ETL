
FROM python:3.12-alpine
RUN mkdir /app
WORKDIR /app
RUN pip install --upgrade pip
RUN pip install flask
RUN pip install confluent-kafka==2.7.0


COPY . /app
ENTRYPOINT ["python", "-u", "main.py"]
