FROM python:3.14

WORKDIR /app
COPY sdv-operator.py .
COPY requirements.txt .
COPY config.conf .

RUN pip install --no-cache-dir --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt

CMD ["kopf", "run", "sdv-operator.py"]
