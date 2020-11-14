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
                sh 'sudo docker build -t wrimage:1.0 .'
            }
        }
        stage('Launch Container'){
            steps{
                sh 'sudo docker run -itd -p80:80 wrimage:1.0'
                sh 'java -jar app/app.jar'
            }
        }
        stage('Test2'){
            steps{
                sh 'curl http://localhost'
            }
        }



    }

}

