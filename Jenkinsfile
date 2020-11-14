pipeline{

    agent any

    tools{
        maven 'm3'
        jdk 'jdk8'
    }

    stages{
        stage('Checkout'){
            steps{
                git 'http://github.com/srikarkc/nov14.git'
            }            
        }
        stage('Compile'){
            steps{
                sh 'mvn clean compile'
            }
        }
        stage('Test'){
            steps{
                sh 'mvn clean test'
            }
        }
        stage('Package'){
            steps{
                sh 'mvn clean package'
            }
        }
        stage('ArchiveArtifact'){
            steps{
                archiveArtifacts 'target/*.jar'
            }
        }
        stage('Build Image'){
            steps{
                sh 'docker build -t wrimage:1.0 .'
            }
        }
        stage('Launch Container'){
            steps{
                sh 'docker run -itd -p9090:9090 wrimage:1.0'
                sh 'java -jar app/app.jar'
            }
        }
        stage('Test2'){
            steps{
                sh 'curl http://localhost:9090'
            }
        }



    }

}

