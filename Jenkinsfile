pipeline {
  agent any
  environment { IMAGE = 'registry.example.com/portfolio/demo' }
  stages {
    stage('Test') { steps { sh 'python3 -m pip install -r app/requirements.txt && cd app && python3 -m unittest discover -p "test_*.py"' } }
    stage('SonarQube (optional)') { when { expression { return env.SONAR_HOST_URL?.trim() } } steps { sh 'echo "Configure SonarScanner and Jenkins credentials for your SonarQube instance"' } }
    stage('Build') { steps { sh 'docker build -t $IMAGE:$BUILD_NUMBER app' } }
    stage('Publish (manual integration)') { steps { echo 'Configure registry credentials and push the image after review; Nexus can be the registry.' } }
    stage('Deploy (manual integration)') { steps { echo 'Update Kubernetes manifest image tag, then apply to a sandbox cluster with an authorized kubeconfig.' } }
  }
}
