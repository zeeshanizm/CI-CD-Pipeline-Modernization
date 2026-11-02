# Runbook

## Local validation

```bash
python3 -m venv .venv
source .venv/bin/activate
pip install -r app/requirements.txt
(cd app && python -m unittest discover -p 'test_*.py')
docker build -t portfolio-demo:local app
```

## Jenkins deployment workflow

1. Install Jenkins with a Docker-capable build agent.
2. Create a pipeline from this repository's `Jenkinsfile`.
3. Configure SonarQube scanner and Nexus registry credentials if used.
4. Replace the example registry in `Jenkinsfile` and `k8s/deployment.yaml`.
5. Run tests and build, then publish a reviewed image.
6. Deploy to a sandbox Kubernetes cluster with `kubectl apply -f k8s/`.
7. Verify `kubectl rollout status deployment/portfolio-demo`.
8. Roll back with `kubectl rollout undo deployment/portfolio-demo`.

**Note:** SonarQube analysis, registry push and Kubernetes deploy are intentionally integration placeholders, not fully configured production stages.
