FROM python:3
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt
COPY . /app/
ENTRYPOINT [ "python", "/app/run.py" ]
