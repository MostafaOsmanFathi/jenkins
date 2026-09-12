pipeline {
       agent any


    parameters {
        choice(
            name: 'ENVIRONMENT',
            choices: ['dev', 'stg', 'prod'],
            description: 'Select the environment'
        )
    }

    stages {
        stage("Init") {
            steps {
                sh '''
                    terraform init
                '''
            }
        }

        stage("Workspace Create If Not Exists") {
            steps {
                sh '''
                    terraform workspace new $ENVIRONMENT || true
                '''
            }
        }

        stage("Workspace Select") {
            steps {
                sh '''
                    terraform workspace select $ENVIRONMENT
                '''
            }
        }

        stage("Plan") {
            steps {
                sh '''
                    terraform plan --var-file=$ENVIRONMENT.tfvars
                '''
            }
        }

        stage("Approval") {
            steps {
                input(
                    message: 'Do you want to continue?',
                    ok: 'Approve'
                )
            }
        }

        stage("Apply") {
            steps {
                sh '''
                    terraform init
                    terraform apply --var-file=$ENVIRONMENT.tfvars --auto-approve
                '''
            }
        }
    }

    post {
        always {
            echo "======== always ========"
        }

        success {
            echo "======== pipeline executed successfully ========"
        }

        failure {
            echo "======== pipeline execution failed ========"
        }
    }
}
