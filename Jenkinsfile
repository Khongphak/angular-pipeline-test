// Personal Access token -> github_credentials: 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
pipeline {
    agent any
    stages{
        stage('========== check out =========='){
            steps{
                withCredentials([usernamePassword(credentialsId: 'github-credential', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]){
                    script{
                        if(!fileExists('angular-pipeline-test')){
                            sh 'git clone https://$USERNAME:$PASSWORD@github.com/Khongphak/angular-pipeline-test.git'
                        } else {
                            dir('angular-pipeline-test'){
                                sh 'git pull'
                            }
                        }
                    }
                } 
            }
        }
        stage('========== build docker image =========='){
            steps {
                script {
                    sh '''
                        cd angular-pipeline-test
                        docker-compose build angular-pipeline-test
                    '''
                }
            }
        }
        stage('========== save docker image to .tar file =========='){
            steps {
                script {
                    sh '''
                        docker --version
                        mkdir -p my-test-images
                        docker save -o angular-pipeline-test-client.tar develop/angular-pipeline-test-client:latest
                    '''
                }
            }
        }
        stage('========== copy .tar file to destination server =========='){
            steps {
                script {
                    // sshpass -p Legeneration_01 scp -o StrictHostKeyChecking=no /my-test-images/angular-pipeline-test-client.tar root@116.206.127.166:/srv/client-angular-pipeline-test
                    sh '''
                        sshpass -p 'Legeneration_01' scp -o StrictHostKeyChecking=no /my-test-images/angular-pipeline-test-client.tar root@116.206.127.166:/srv/client-angular-pipeline-test
                    '''
                }
            }
        }
        // stage('========== Deploy app by using docker ==========')
    }
}