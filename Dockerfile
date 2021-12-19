FROM python:3.10.0-alpine3.15
WORKDIR /app
copy requirements.txt .
run pip install -r requirements.txt
copy src src
expose 5000
healthcheck --interval=30s --timeout=30s --start-period=30s --retries=5 CMD curl -f http://localhost:5000/health || exit 1
entrypoint ["python","./src/app.py"]
