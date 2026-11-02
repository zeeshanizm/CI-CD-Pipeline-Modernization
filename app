from flask import Flask, jsonify
app = Flask(__name__)
@app.get("/")
def index():
    return jsonify(service="portfolio-demo", status="ok")
@app.get("/healthz")
def health():
    return jsonify(status="healthy")
@app.get("/metrics")
def metrics():
    return "demo_requests_total 1\n", 200, {"Content-Type": "text/plain; version=0.0.4"}
if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080)

FROM python:3.12-slim
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt && useradd -u 10001 -m appuser
COPY app.py .
USER appuser
EXPOSE 8080
CMD ["python", "app.py"]

Flask==3.1.1

import unittest
from app import app
class Tests(unittest.TestCase):
    def test_health(self):
        response = app.test_client().get('/healthz')
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.json['status'], 'healthy')
if __name__ == '__main__': unittest.main()
