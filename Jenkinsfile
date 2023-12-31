pipeline {
    agent any 
    //
    options {
        timestamps()
    }
    
    stages {
        
        stage('S1 6509183p') {
            steps {
                echo 'Stage1_6509183p : Release Environment Preparation Completed' 
            }
        }
        
        stage('S2 6509183p') {
            steps {
                // script {
                //     sh 'docker stop WebApp_6509183p || true && docker rm WebApp_6509183p || true'   
                //     sh 'docker run -d -p 31200:80 --name WebApp_6509183p wb1_image_6509183P'
                // }
                echo 'docker stop WebApp_6509183p || true && docker rm WebApp_6509183p || true' 
                echo 'docker run -d -p 31200:80 --name WebApp_6509183p wb1_image_6509183P'
                echo 'Stage2_6509183p : Release Container WebApp_6509183p Created Completed'
            }
        }
        
        stage('S3 6509183p') {
            parallel {
                stage('S3 6509183p API Test') {
                    steps {
                        echo 'Stage3_6509183p: API Test Completed'  
                    }
                }
                
                stage('S3 6509183p SCAN Test') {
                    steps {
                        echo 'Stage3_6509183p: Scan Test Completed'
                    }
                }
            }
        }
        
        stage('S4 6509183p') {
            steps {
                script {
                    def userInput = input(message: '6509183p, proceed to release the work to the next phase?', parameters: [choice(name: 'Release', choices: 'Proceed\nAbort', description: 'Choose to Proceed or Abort')])
                    
                    if (userInput == 'Proceed') {
                        echo 'Stage4_6509183p: Work Release - Proceeds to Next Phase'  
                    } else {
                        echo 'Stage4_6509183p: Work Release - Stops'
                    }
                }
            }
        }
        
        stage('S5 6509183p') {
            when {
                expression { currentBuild.getBuildCauses('UserIdCause') != null } 
            }
            steps {
                script {
                    def userInput = input(message: 'Proceed?', parameters: [choice(name: 'Proceed', choices: 'Proceed\nAbort', description: 'Choose to Proceed or Abort')])
                    
                    if (userInput == 'Proceed') {
                        echo 'Stage5_6509183p : Work Release – Proceeds to Next Phase'
                    } else {
                        echo 'Stage5_6509183p : Work Release - Stops'  
                    }
                }
            }
        }
    }
    
    triggers {
        pollSCM('* * * * *') 
    }
}
