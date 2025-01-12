// Personal Access token -> github_credentials: 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
pipeline {
    agent any
    stages{
        stage('========== check out =========='){
            steps{
                withCredentials([usernamePassword(credentialsId: 'github-credential', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')])
                script{
                    if(!fileExists('angular-pipeline-test')){
                        sh 'git clone https://$USERNAME:$PASSWORDgithub.com/Khongphak/angular-pipeline-test.git'
                    }else{
                        dir('angular-pipeline-test'){
                            sh 'git pull'
                        }
                    }
                }
            }
        }
        // stage('========== build docker image ==========')
        // stage('========== save docker image to .tar file ==========')
        // stage('========== copy .tar file to destination server ==========')
        // stage('========== Deploy app by using docker ==========')
    }
}