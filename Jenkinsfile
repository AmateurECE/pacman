node('archlinux-agent') {
    stage('Build') {
        checkout scm
        sh "pkg-builder ${REPO_PATH}"
    }
}
