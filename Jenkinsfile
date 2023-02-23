pipeline {
    agent any
    options {
        timestamps()
        ansiColor('xterm')
    }
    stages{
        stage('Test Check'){
            steps{
                sh './gradlew test jacocoTestReport'
                sh './gradlew check'
            }
        }
        stage('Jacoco'){
            steps{
                jacoco (
                    execPattern: './build/jacoco/*.exec',
                    runAlways: true
                    )
            }
        }
        stage('PMD'){
            steps{
                recordIssues(tools: [pmdParser(name: 'PMD', pattern: 'build/reports/pmd/*.xml')])
            }
        }
        stage('Imagen'){
            steps{
                sh '''
		        docker-compose build
                git tag 1.0.${BUILD_NUMBER}
                docker tag ghcr.io/albertosantiago-lt/hello-springrest/springrest:latest ghcr.io/albertosantiago-lt/hello-springrest/springrest:1.0.${BUILD_NUMBER}
                '''
                sshagent(['ssh-github']) {
                    sh('git push git@github.com:albertosantiago-lt/hello-springrest.git --tags')
                }
	    }	                              
        }  
        
        stage('Subir Imagen'){
            steps{ 
		withCredentials([string(credentialsId: 'github-token', variable: 'GIT_TOKEN')]){
		    sh 'echo $GIT_TOKEN | docker login ghcr.io -u albertosantiago-lt --password-stdin'
                    sh 'docker push ghcr.io/albertosantiago-lt/hello-springrest/springrest:1.0.${BUILD_NUMBER}'
		        }
            }
        }
/*        stage('eb Deploy'){
            steps{
                withAWS(credentials: 'Credentials_aws') {
                    dir(app){
                        sh 'eb deploy hello-springrest-dev --version 1.0.${BUILD_NUMBER}'
                    }
                }
          } 
        }*/
/*
        stage('Jacoco'){
            steps{
                jacoco (
                    classPattern: './app/',
                    execPattern: './app/gradlew',
                    runAlways: true,
                    sourcePattern: './app/'
                    )
            }
        }
*/
       
    }
}   

