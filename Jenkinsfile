pipeline {
    agent any 
    
    environment {
        PATH = "/Users/samboers/.dotnet/tools:/usr/local/share/dotnet:/usr/local/bin:/Users/samboers/google-cloud-sdk/bin:$PATH"
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/Samboers2001/OcelotApiGateway'
            }
        }

        stage('SonarCloud Scan') {
            steps {
                script {
                    withCredentials([string(credentialsId: 'sonarcloud-token', variable: 'SONAR_TOKEN')]) {
                        dir('/Users/samboers/development/order_management_system/OcelotApiGateway') {
                            sh 'dotnet sonarscanner begin /k:"Samboers2001_OcelotApiGateway" /o:"samboers2001" /d:sonar.host.url="https://sonarcloud.io" /d:sonar.login="$SONAR_TOKEN"'
                            sh 'dotnet build'
                            sh 'dotnet sonarscanner end /d:sonar.login="$SONAR_TOKEN"'
                        }
                    }
                }
            }
        }          
        
        stage('Build docker image') {
            steps {
                script {
                    sh 'docker build -t samboers/ocelotapigateway .'
                }
            }
        }

        stage('Run Trivy Scan') {
            steps {
                script {
                    def trivyExitCode = sh(script: '/opt/homebrew/bin/trivy image --exit-code 1 --no-progress samboers/ocelotapigateway:latest', returnStatus: true)
                    
                    if (trivyExitCode != 0) {
                        echo "Vulnerabilities were found but the pipeline will continue."
                    } else {
                        echo "No vulnerabilities found."
                    }
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

        stage('Deploy OcelotApiGateway to Kubernetes') {
            steps {
                script {
                    sh 'kubectl apply -f K8S/Local/ocelot-depl.yaml'
                    sh 'kubectl apply -f K8S/Local/ocelot-service-hpa.yaml'
                    sh 'kubectl apply -f K8S/Local/ocelot-np-srv.yaml'
                }
            }
        }

        stage('Rollout Restart') {
            steps {
                script {
                    sh 'kubectl rollout restart deployment ocelot-api-gateway-depl'
                }
            }
        }
    }
}
