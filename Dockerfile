FROM mirror.gcr.io/library/python:3.11-slim

WORKDIR /app

# tini is required as PID 1 on the target cluster.
RUN apt-get update \
    && apt-get install -y --no-install-recommends tini \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir "bentoml>=1.2,<1.4"

COPY nexlayer_service.py /app/nexlayer_service.py

ENV BENTOML_HOST=0.0.0.0
EXPOSE 3000

ENTRYPOINT ["/usr/bin/tini", "-g", "--"]
CMD ["bentoml", "serve", "nexlayer_service:Greeter", "--host", "0.0.0.0", "--port", "3000"]
