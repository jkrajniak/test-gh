FROM ubuntu:latest as builder

RUN apt update -y && apt install -y pip

RUN pip install -U pip setuptools wheel
RUN pip wheel -w wheels mypy

FROM ubuntu:latest as runner
RUN apt update && apt install -y pip
RUN pip install -U pip setuptools wheel --no-cache-dir
COPY --from=builder wheels wheels
RUN pip install --no-cache-dir -f wheels mypy
RUN rm -r wheels

COPY README.md /app
