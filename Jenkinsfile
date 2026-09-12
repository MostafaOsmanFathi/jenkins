pipeline{
    agent any
    
     environment {
        IMAGE_NAME='hello_backend'
    }

    stages{
        stage("checkout task3 branch"){
            steps{

                sh '''
                git checkout task3
                '''
            }

        }
        stage("login"){
            steps{
                
                withCredentials([
                    usernamePassword(
                        credentialsId: 'docker',
                        usernameVariable: 'DOCKER_USERNAME',
                        passwordVariable: 'DOCKER_PASSWORD'
                    )
                ]) 

                {
                     sh '''
                        echo "$DOCKER_PASSWORD" | docker login \
                                            -u "$DOCKER_USERNAME" \
                                            --password-stdin                    
                                            
                        '''
                }

               
            }
         
        }

        stage("build image"){
            steps{
            sh '''
                docker build -t mostafaosmanfathi/${IMAGE_NAME}:${BUILD_NUMBER} .

            '''
            }
           

        }
        stage("push image"){
            steps{
            sh '''
                docker push mostafaosmanfathi/${IMAGE_NAME}:${BUILD_NUMBER}

            '''
            } 

        }
    }
    post{
        always{
            echo "========always========"
        }
        success{
           steps{
                sh '''
                    docker run -d \
                    --name test-container \
                    -p 5000:5000 \
                    mostafaosmanfathi/${IMAGE_NAME}:${BUILD_NUMBER}
                '''

                sh '''
                    sleep 3
                '''

                sh '''
                    curl -f -I http://localhost:5000
                '''

                sh '''
                    docker stop test-container
                '''

                sh '''
                    docker rm test-container
                '''
           }
        }
        failure{
            echo "========pipeline execution failed========"
        }
    }
}