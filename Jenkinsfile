pipeline {
    agent any

    stages {
        stage('Checkout-it') {
            steps {
                git poll: true, url:'git@github.com:hermenegildoai/test-jenkins-1.git'
            }
        }
	stage('Create_env') {
            steps {
                sh '''
			python3 -m venv venv && source venv/bin/activate
		'''
            }
        }
	stage('Install_requirements') {
            steps {
                sh '''
			pip3 install -r requirements.txt
		'''
            }
        }
        stage('Test_app') {
            steps {
                sh '''
			pytest &
		'''
            }
        }
        stage('Run_App') {
            steps {
                sh '''
			python3 src/app.py &
		'''
            }
        }
	stage('Build_docker') {
            steps {
                sh '''
			docker build -t apptest:latest .
		'''
            }
        }
	stage('Push_docker') {
            steps {
                sh '''
			docker tag apptest:latest hdoai/apptest:latest	
			docker push hdoai/apptest:latest
			docker rmi apptest:latest
		'''
            }
        }
    }
}
