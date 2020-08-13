FROM python:3.7-alpine
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r /app/requirements.txt
COPY . /app/
ENTRYPOINT [ "python", "/app/run.py" ]
