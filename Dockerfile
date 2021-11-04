FROM ubuntu:latest

RUN apt update -y && apt install -y pip

RUN pip install mypy

COPY README.md /app
