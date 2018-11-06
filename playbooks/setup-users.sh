#users
htpasswd -b /etc/origin/master/htpasswd admin redhat
htpasswd -b /etc/origin/master/htpasswd user1 user1
htpasswd -b /etc/origin/master/htpasswd user2 user2
htpasswd -b /etc/origin/master/htpasswd developer developer
#apply
systemctl restart atomic-openshift-master-api atomic-openshift-master-controllers
#admin
oc adm policy add-cluster-role-to-user cluster-admin admin
