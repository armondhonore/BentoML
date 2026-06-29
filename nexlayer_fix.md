# Nexlayer deploy fix guidance

Pinned: true

This repo deploys a minimal self-contained BentoML HTTP service for demonstration.

- Build context: repo root.
- Use the repo's root `Dockerfile` exactly as committed. Do NOT regenerate or
  ground-check it — it is authoritative.
- The image runs `bentoml serve nexlayer_service:Greeter --host 0.0.0.0 --port 3000`.
- The service exposes an interactive Swagger UI at `/` and JSON APIs at
  `/hello` and `/healthz`, all on port 3000.
- Do not add a database or extra pods; this is a single-pod app.
