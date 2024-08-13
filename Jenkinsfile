pipeline{
    agent any
    
    environment{
        REPO_URL="https://github.com/Hashemjr/DXL.git"
        CLONE_DIR="dxl1"
        BRANCHES_FILE="branches"
        TARGET_BRANCH="Black"
        COMMIT_MSG="Hello"
        FILE_NAME="Black_file.txt"
        GITHUB_CREDENTIALS = credentials('github-token')

    }
    
    stages{
        stage('Cloning the repo'){
            steps{
                script{
                    sh "git clone ${env.REPO_URL} ${CLONE_DIR}"
                }
            }
        }
        
        stage('Listing Branches'){
            steps{
                script{
                    dir(env.CLONE_DIR){
                        sh "git branch > ${env.BRANCHES_FILE}"
                    }
                }
                
            }
        }
        
        stage("Making Branches file executable"){
            steps{
                script{
                    dir(env.CLONE_DIR) {
                        sh "chmod +x ${env.BRANCHES_FILE}"
                    }
                }
            }
            
        }
        
        stage("Get Hello Commit from Red branch"){
            steps{
                script{
                     dir(env.CLONE_DIR) {
                        def commitLog = sh(script: "git log origin/Red --grep='${env.COMMIT_MSG}'", returnStdout: true).trim()
                        echo "Commit Log: ${commitLog}"
                    }
                }
            }
        }
        
        stage('Switch to Black Branch and Update File') {
            steps {
                script {
                    dir(env.CLONE_DIR) {
                        sh "git checkout ${env.TARGET_BRANCH}"
                        sh "git config --global user.email 'marwanreda22@gmail.com'"
                        sh "git config --global user.name 'hashemjr'"
                        sh "echo 'hello again' >> ${env.FILE_NAME}"
                        sh "echo 'I need a cup of coffee' >> ${env.FILE_NAME}"
                        sh "git add ${env.FILE_NAME}"
                        sh "git commit -m 'New Lines added'"
                        withCredentials([string(credentialsId: 'github-token', variable: 'GITHUB_TOKEN')]) {
                            sh """
                                git push https://x-oauth-basic:${GITHUB_TOKEN}@github.com/Hashemjr/DXL ${TARGET_BRANCH}
                            """
                        }
                    }
                }
            }
        }
    }
    
}
