from flask import Flask, jsonify
from datetime import datetime, timezone

app = Flask(__name__)


@app.route("/")
def index():
    return jsonify({"service": "deploy-watch", "status": "running"})


@app.route("/health")
def health():
    return jsonify({
        "status": "healthy",
        "timestamp": datetime.now(timezone.utc).isoformat(),
    })


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5001)
