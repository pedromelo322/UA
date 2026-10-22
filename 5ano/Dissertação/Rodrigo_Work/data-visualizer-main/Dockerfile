FROM python:3.12-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY dashboard_server.py .
COPY static/ static/

EXPOSE 8765

CMD ["python3", "dashboard_server.py"]
