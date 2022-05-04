pipeline {
    agent any

    stages {
        stage('kjhgf') {
            steps {
                echo 'Hello World'
                sh 'sudo apt install python -y'
                sh 'sudo apt install python3-pip -y'
                sh 'pip install django'
                sh 'python manage.py runserver & '
            }
        }
    }
}
