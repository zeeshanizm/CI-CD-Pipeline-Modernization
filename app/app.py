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
