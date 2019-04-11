REMOTE_REGISTRY="docker-registry-default.apps.example.com"


oc login
oc whoami -t
docker login -u user -p token registry.redhat.io
docker login -u user -p token ${REMOTE_REGISTRY}


#mongodbdb
docker pull registry.redhat.io/openshift3/mongodb-24-rhel7:latest
docker pull registry.redhat.io/rhscl/mongodb-26-rhel7:latest
docker pull registry.redhat.io/rhscl/mongodb-32-rhel7:latest
docker pull registry.redhat.io/rhscl/mongodb-34-rhel7:latest
docker pull registry.redhat.io/rhscl/mongodb-36-rhel7:latest

docker tag registry.redhat.io/openshift3/mongodb-24-rhel7:latest ${REMOTE_REGISTRY}/openshift/mongodb:2.4
docker tag registry.redhat.io/rhscl/mongodb-26-rhel7:latest ${REMOTE_REGISTRY}/openshift/mongodb:2.6
docker tag registry.redhat.io/rhscl/mongodb-32-rhel7:latest ${REMOTE_REGISTRY}/openshift/mongodb:3.2
docker tag registry.redhat.io/rhscl/mongodb-34-rhel7:latest ${REMOTE_REGISTRY}/openshift/mongodb:3.4
docker tag registry.redhat.io/rhscl/mongodb-36-rhel7:latest ${REMOTE_REGISTRY}/openshift/mongodb:3.6
docker tag registry.redhat.io/rhscl/mongodb-36-rhel7:latest ${REMOTE_REGISTRY}/openshift/mongodb:latest

docker push ${REMOTE_REGISTRY}/openshift/mongodb:2.4
docker push ${REMOTE_REGISTRY}/openshift/mongodb:2.6
docker push ${REMOTE_REGISTRY}/openshift/mongodb:3.2
docker push ${REMOTE_REGISTRY}/openshift/mongodb:3.4
docker push ${REMOTE_REGISTRY}/openshift/mongodb:3.6
docker push ${REMOTE_REGISTRY}/openshift/mongodb:latest


#httpd

docker pull registry.redhat.io/rhscl/httpd-24-rhel7

docker tag registry.redhat.io/rhscl/httpd-24-rhel7 ${REMOTE_REGISTRY}/openshift/httpd:2.4
docker tag registry.redhat.io/rhscl/httpd-24-rhel7 ${REMOTE_REGISTRY}/openshift/httpd:latest

docker push ${REMOTE_REGISTRY}/openshift/httpd:2.4
docker push ${REMOTE_REGISTRY}/openshift/httpd:latest


#mysql
docker pull registry.redhat.io/openshift3/mysql-55-rhel7:latest
docker pull registry.redhat.io/rhscl/mysql-56-rhel7:latest
docker pull registry.redhat.io/rhscl/mysql-57-rhel7:latest

docker tag registry.redhat.io/openshift3/mysql-55-rhel7:latest ${REMOTE_REGISTRY}/openshift/mysql:5.5
docker tag registry.redhat.io/rhscl/mysql-56-rhel7:latest ${REMOTE_REGISTRY}/openshift/mysql:5.6
docker tag registry.redhat.io/rhscl/mysql-57-rhel7:latest ${REMOTE_REGISTRY}/openshift/mysql:5.7
docker tag registry.redhat.io/rhscl/mysql-57-rhel7:latest ${REMOTE_REGISTRY}/openshift/mysql:latest

docker push ${REMOTE_REGISTRY}/openshift/mysql:5.5
docker push ${REMOTE_REGISTRY}/openshift/mysql:5.6
docker push ${REMOTE_REGISTRY}/openshift/mysql:5.7
docker push ${REMOTE_REGISTRY}/openshift/mysql:latest

#nginx
docker pull registry.redhat.io/rhscl/nginx-110-rhel7:latest
docker pull registry.redhat.io/rhscl/nginx-18-rhel7:latest
docker pull registry.redhat.io/rhscl/nginx-112-rhel7:latest

docker tag registry.redhat.io/rhscl/nginx-110-rhel7:latest ${REMOTE_REGISTRY}/openshift/nginx:1.10
docker tag registry.redhat.io/rhscl/nginx-18-rhel7:latest ${REMOTE_REGISTRY}/openshift/nginx:1.8
docker tag registry.redhat.io/rhscl/nginx-112-rhel7:latest ${REMOTE_REGISTRY}/openshift/nginx:1.12
docker tag registry.redhat.io/rhscl/nginx-112-rhel7:latest ${REMOTE_REGISTRY}/openshift/nginx:latest

docker push ${REMOTE_REGISTRY}/openshift/nginx:1.10
docker push ${REMOTE_REGISTRY}/openshift/nginx:1.8
docker push ${REMOTE_REGISTRY}/openshift/nginx:1.12
docker push ${REMOTE_REGISTRY}/openshift/nginx:latest

#nodejs
docker pull registry.redhat.io/openshift3/nodejs-010-rhel7:latest
docker pull registry.redhat.io/rhoar-nodejs/nodejs-10
docker pull registry.redhat.io/rhscl/nodejs-4-rhel7:latest
docker pull registry.redhat.io/rhscl/nodejs-6-rhel7:latest
docker pull registry.redhat.io/rhscl/nodejs-8-rhel7:latest
docker pull registry.redhat.io/rhoar-nodejs/nodejs-8

docker tag registry.redhat.io/openshift3/nodejs-010-rhel7:latest ${REMOTE_REGISTRY}/openshift/nodejs:0.10
docker tag registry.redhat.io/rhscl/nodejs-4-rhel7:latest ${REMOTE_REGISTRY}/openshift/nodejs:4
docker tag registry.redhat.io/rhscl/nodejs-6-rhel7:latest ${REMOTE_REGISTRY}/openshift/nodejs:6
docker tag registry.redhat.io/rhscl/nodejs-8-rhel7:latest ${REMOTE_REGISTRY}/openshift/nodejs:8
docker tag registry.redhat.io/rhoar-nodejs/nodejs-8 ${REMOTE_REGISTRY}/openshift/nodejs:8-RHOAR
docker tag registry.redhat.io/rhoar-nodejs/nodejs-10 ${REMOTE_REGISTRY}/openshift/nodejs:10
docker tag registry.redhat.io/rhoar-nodejs/nodejs-10 ${REMOTE_REGISTRY}/openshift/nodejs:latest

docker push ${REMOTE_REGISTRY}/openshift/nodejs:0.10
docker push ${REMOTE_REGISTRY}/openshift/nodejs:4
docker push ${REMOTE_REGISTRY}/openshift/nodejs:6
docker push ${REMOTE_REGISTRY}/openshift/nodejs:8
docker push ${REMOTE_REGISTRY}/openshift/nodejs:8-RHOAR
docker push ${REMOTE_REGISTRY}/openshift/nodejs:10
docker push ${REMOTE_REGISTRY}/openshift/nodejs:latest


#perl

docker pull registry.redhat.io/openshift3/perl-516-rhel7:latest
docker pull registry.redhat.io/rhscl/perl-520-rhel7:latest
docker pull registry.redhat.io/rhscl/perl-524-rhel7:latest
docker pull registry.redhat.io/rhscl/perl-526-rhel7:latest

docker tag registry.redhat.io/openshift3/perl-516-rhel7:latest ${REMOTE_REGISTRY}/openshift/perl:5.16
docker tag registry.redhat.io/rhscl/perl-520-rhel7:latest ${REMOTE_REGISTRY}/openshift/perl:5.20
docker tag registry.redhat.io/rhscl/perl-524-rhel7:latest ${REMOTE_REGISTRY}/openshift/perl:5.24
docker tag registry.redhat.io/rhscl/perl-526-rhel7:latest ${REMOTE_REGISTRY}/openshift/perl:5.26
docker tag registry.redhat.io/rhscl/perl-526-rhel7:latest ${REMOTE_REGISTRY}/openshift/perl:latest

docker push ${REMOTE_REGISTRY}/openshift/perl:5.16
docker push ${REMOTE_REGISTRY}/openshift/perl:5.20
docker push ${REMOTE_REGISTRY}/openshift/perl:5.24
docker push ${REMOTE_REGISTRY}/openshift/perl:5.26
docker push ${REMOTE_REGISTRY}/openshift/perl:latest


#php

docker pull registry.redhat.io/openshift3/php-55-rhel7:latest
docker pull registry.redhat.io/rhscl/php-56-rhel7:latest
docker pull registry.redhat.io/rhscl/php-70-rhel7:latest
docker pull registry.redhat.io/rhscl/php-71-rhel7:latest

docker tag registry.redhat.io/openshift3/php-55-rhel7:latest ${REMOTE_REGISTRY}/openshift/php:5.5
docker tag registry.redhat.io/rhscl/php-56-rhel7:latest ${REMOTE_REGISTRY}/openshift/php:5.6
docker tag registry.redhat.io/rhscl/php-70-rhel7:latest ${REMOTE_REGISTRY}/openshift/php:7.0
docker tag registry.redhat.io/rhscl/php-71-rhel7:latest ${REMOTE_REGISTRY}/openshift/php:7.1
docker tag registry.redhat.io/rhscl/php-71-rhel7:latest ${REMOTE_REGISTRY}/openshift/php:latest

docker push ${REMOTE_REGISTRY}/openshift/php:5.5
docker push ${REMOTE_REGISTRY}/openshift/php:5.6
docker push ${REMOTE_REGISTRY}/openshift/php:7.0
docker push ${REMOTE_REGISTRY}/openshift/php:7.1
docker push ${REMOTE_REGISTRY}/openshift/php:latest




#mariadb
docker pull registry.redhat.io/rhscl/mariadb-101-rhel7:latest
docker pull registry.redhat.io/rhscl/mariadb-102-rhel7:latest

docker tag registry.redhat.io/rhscl/mariadb-101-rhel7:latest ${REMOTE_REGISTRY}/openshift/mariadb:10.1
docker tag registry.redhat.io/rhscl/mariadb-102-rhel7:latest ${REMOTE_REGISTRY}/openshift/mariadb:10.2
docker tag registry.redhat.io/rhscl/mariadb-102-rhel7:latest ${REMOTE_REGISTRY}/openshift/mariadb:latest

docker push ${REMOTE_REGISTRY}/openshift/mariadb:10.2
docker push ${REMOTE_REGISTRY}/openshift/mariadb:latest
docker push ${REMOTE_REGISTRY}/openshift/mariadb:10.1

