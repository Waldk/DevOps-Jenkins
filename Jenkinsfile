pipeline{
    agent any
        stages{
            stage('git checkout'){
                steps{
                    git credentialsId: '1c52b8da-e7fc-4be7-87fa-ffdb02b11a05', url:'https://github.com/Waldk/DevOps-Jenkins.git'
                }
            }
            
            stage('Build the application'){
                steps{
                    sh 'mvn clean install'
                }
            }
            stage('Unit Test Execution'){
                steps{
                    sh 'mvn test'
                }
            }
            stage('Build the docker image'){
                steps{
                    sh 'docker build -t waldk/tp5:1.0.0 .'
                }
            }
            stage('Publish the docker image'){
                steps{
                    withCredentials([string(credentialsId: 'dockerhubpass', variable:'dockerHubPass')]){
                        sh "docker login -u waldk -p$dockerHubPass"
                    }
                    sh 'docker push waldk/tp5:1.0.0'
                }
            }
        }
    }
