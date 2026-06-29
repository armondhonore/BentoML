"""Minimal self-contained BentoML service for Nexlayer deployment.

Serves an HTTP API on port 3000 with an interactive Swagger UI at "/".
No trained model or external assets required.
"""
import bentoml


@bentoml.service(
    resources={"cpu": "1"},
    traffic={"timeout": 60},
)
class Greeter:
    @bentoml.api
    def hello(self, name: str = "world") -> dict:
        return {"message": f"Hello, {name}!"}

    @bentoml.api
    def healthz(self) -> dict:
        return {"status": "ok"}
