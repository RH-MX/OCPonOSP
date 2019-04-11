REMOTE_REGISTRY="docker-registry-default.apps.example.com"


oc login
oc whoami -t
docker login -u user -p token registry.redhat.io
docker login -u user -p token ${REMOTE_REGISTRY}


#jenkins
docker pull registry.redhat.io/openshift3/jenkins-2-rhel7:latest
docker pull registry.redhat.io/openshift3/jenkins-1-rhel7:latest
docker tag registry.redhat.io/openshift3/jenkins-2-rhel7:latest ${REMOTE_REGISTRY}/openshift/jenkins:2
docker tag registry.redhat.io/openshift3/jenkins-1-rhel7:latest ${REMOTE_REGISTRY}/openshift/jenkins:1
docker tag registry.redhat.io/openshift3/jenkins-2-rhel7:latest ${REMOTE_REGISTRY}/openshift/jenkins:latest
docker push ${REMOTE_REGISTRY}/openshift/jenkins:2
docker push ${REMOTE_REGISTRY}/openshift/jenkins:latest
docker push ${REMOTE_REGISTRY}/openshift/jenkins:1


#nexus
oc delete is nexus3 -n openshift
docker pull sonatype/nexus3:3.13.0
docker tag sonatype/nexus3 ${REMOTE_REGISTRY}/openshift/nexus3:3.13.0
docker push ${REMOTE_REGISTRY}/openshift/nexus3:3.13.0

#postgresql
oc delete is postgresql
docker pull registry.redhat.io/rhscl/postgresql-96-rhel7:latest
docker tag registry.redhat.io/rhscl/postgresql-96-rhel7:latest ${REMOTE_REGISTRY}/openshift/postgresql:9.6
docker push ${REMOTE_REGISTRY}/openshift/postgresql:9.6

docker pull registry.redhat.io/rhscl/postgresql-95-rhel7:latest
docker tag registry.redhat.io/rhscl/postgresql-95-rhel7:latest ${REMOTE_REGISTRY}/openshift/postgresql:9.5
docker push ${REMOTE_REGISTRY}/openshift/postgresql:9.5

docker pull registry.redhat.io/rhscl/postgresql-96-rhel7:latest
docker tag registry.redhat.io/rhscl/postgresql-96-rhel7:latest ${REMOTE_REGISTRY}/openshift/postgresql:latest
docker push ${REMOTE_REGISTRY}/openshift/postgresql:latest

#gogs
oc delete is gogs
docker pull openshiftdemos/gogs:0.11.34
docker tag openshiftdemos/gogs:0.11.34 ${REMOTE_REGISTRY}/openshift/gogs:0.11.34
docker push ${REMOTE_REGISTRY}/openshift/gogs:0.11.34


#sonarqube
oc delete is sonarqube
docker pull siamaksade/sonarqube:latest
docker tag siamaksade/sonarqube:latest ${REMOTE_REGISTRY}/openshift/sonarqube:latest
docker push ${REMOTE_REGISTRY}/openshift/sonarqube:latest




#jenkins-agent-maven-35-centos7
oc delete is jenkins-agent-maven-35-centos7
docker pull openshift/jenkins-agent-maven-35-centos7
docker tag openshift/jenkins-agent-maven-35-centos7 ${REMOTE_REGISTRY}/openshift/jenkins-agent-maven-35-centos7
docker push ${REMOTE_REGISTRY}/openshift/jenkins-agent-maven-35-centos7

#jenkins-slave-skopeo-centos7
oc delete is jenkins-slave-skopeo-centos7
docker pull siamaksade/jenkins-slave-skopeo-centos7
docker tag siamaksade/jenkins-slave-skopeo-centos7 ${REMOTE_REGISTRY}/openshift/jenkins-slave-skopeo-centos7
docker push ${REMOTE_REGISTRY}/openshift/jenkins-slave-skopeo-centos7


#wildfly-120-centos7
oc delete is wildfly-120-centos7
docker pull openshift/wildfly-120-centos7
docker tag openshift/wildfly-120-centos7 ${REMOTE_REGISTRY}/openshift/wildfly-120-centos7
docker push ${REMOTE_REGISTRY}/openshift/wildfly-120-centos7