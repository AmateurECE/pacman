node {
    stage('Build') {
        agent { label 'archlinux-agent' }
        checkout scm
        sh "pkg-builder ${REPO_PATH}"
    }
}
