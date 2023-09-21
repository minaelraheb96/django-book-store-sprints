FROM python:3.8-slim-buster

EXPOSE 8000

# Turns off generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE=1

# Turns off buffering
ENV PYTHONUNBUFFERED=1

#install requirements
COPY requirements.txt .
RUN python -m pip install -r requirements.txt

WORKDIR /app

COPY . /app

# Creates a non-root user
RUN adduser -u 5678 --disabled-password --gecos "" appuser && chown -R appuser /app
USER appuser