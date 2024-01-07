pipeline {
    agent any 
    
    environment {
        PATH = "/usr/local/bin:/Users/samboers/google-cloud-sdk/bin:$PATH"
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/Samboers2001/OcelotApiGateway'
            }
        }
        
        stage('Build docker image') {
            steps {
                script {
                    sh 'docker build -t samboers/ocelotapigateway .'
                }
            }
        }
        
        stage('Push to dockerhub') {
            steps {
                script {
                    withCredentials([string(credentialsId: 'dockerhubpasswordcorrect', variable: 'dockerhubpwd')]) {
                        sh 'docker login -u samboers -p ${dockerhubpwd}'
                        sh 'docker push samboers/ocelotapigateway'
                    }
                }
            }
        }

        stage('Deploy AccountMicroservice to Kubernetes') {
            steps {
                script {
                    sh 'kubectl apply -f K8S/Local/ocelot-depl.yaml'
                    sh 'kubectl apply -f K8S/Local/ocelot-loadbalancer-srv.yaml'
                    sh 'kubectl apply -f K8S/Local/ocelot-service-hpa.yaml'
                }
            }
        }

        stage('Rollout Restart') {
            steps {
                script {
                    sh 'kubectl rollout restart deployment ocelot-depl'
                }
            }
        }
    }
}
