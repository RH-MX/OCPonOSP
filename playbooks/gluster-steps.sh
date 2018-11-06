#You can remove logging and metrics resources by re-running the deployment playbooks like this:

ansible-playbook -i <path_to_inventory_file> -e
"openshift_logging_install_logging=false"
/usr/share/ansible/openshift-ansible/playbooks/openshift-logging/config.yml

ansible-playbook -i <path_to_inventory_file> -e
"openshift_logging_install_metrics=false"
/usr/share/ansible/openshift-ansible/playbooks/openshift-metrics/config.yml
#Make sure to manually remove any logging or metrics PersistentVolumeClaims. The associated PersistentVolumes will be deleted automatically.

#If you have the registry using a glusterfs PersistentVolume, remove it with the following command:

oc delete deploymentconfig docker-registry
oc delete pvc registry-claim
oc delete pv registry-volume
oc delete service glusterfs-registry-endpoints
#If running the uninstall.yml because a deployment failed, run the uninstall.yml playbook with the following variables to wipe the storage devices for both glusterfs and glusterfs_registry before trying the OCS installation again.

ansible-playbook -i <path_to_inventory file> -e
"openshift_storage_glusterfs_wipe=True" -e
"openshift_storage_glusterfs_registry_wipe=true"
/usr/share/ansible/openshift-ansible/playbooks/openshift-glusterfs/uninstall.yml


#OCS 3.10 post installation for applications, registry, logging and metrics

#You can add OCS clusters and resources to an existing OCP install using the following command. This same process can be used if OCS has been uninstalled due to errors.

ansible-playbook -i <path_to_inventory_file>
/usr/share/ansible/openshift-ansible/playbooks/openshift-glusterfs/config.yml

#After the new cluster(s) is created and validated, you can deploy the registry using a newly created glusterfs ReadWriteMany volume. Run this playbook to create the registry resources:

ansible-playbook -i <path_to_inventory_file>
/usr/share/ansible/openshift-ansible/playbooks/openshift-hosted/config.yml

#You can now deploy logging and metrics resources by re-running these deployment playbooks:

ansible-playbook -i <path_to_inventory_file>
/usr/share/ansible/openshift-ansible/playbooks/openshift-logging/config.yml

ansible-playbook -i <path_to_inventory_file>
/usr/share/ansible/openshift-ansible/playbooks/openshift-metrics/config.yml



#example values for inventory:

[OSEv3:vars]
...
openshift_hosted_registry_storage_kind=glusterfs 
openshift_hosted_registry_storage_volume_size=5Gi
openshift_hosted_registry_selector='node-role.kubernetes.io/infra=true'

openshift_metrics_install_metrics=true
openshift_metrics_hawkular_nodeselector={"node-role.kubernetes.io/infra": "true"} 
openshift_metrics_cassandra_nodeselector={"node-role.kubernetes.io/infra": "true"} 
openshift_metrics_heapster_nodeselector={"node-role.kubernetes.io/infra": "true"} 
openshift_metrics_storage_kind=dynamic
openshift_metrics_storage_volume_size=10Gi
openshift_metrics_cassandra_pvc_storage_class_name="glusterfs-registry-block" 

openshift_logging_install_logging=true
openshift_logging_kibana_nodeselector={"node-role.kubernetes.io/infra": "true"} 
openshift_logging_curator_nodeselector={"node-role.kubernetes.io/infra": "true"} 
openshift_logging_es_nodeselector={"node-role.kubernetes.io/infra": "true"} 
openshift_logging_storage_kind=dynamic
openshift_logging_es_pvc_size=10Gi                        
openshift_logging_es_pvc_storage_class_name="glusterfs-registry-block"       

openshift_storage_glusterfs_namespace=app-storage
openshift_storage_glusterfs_storageclass=true
openshift_storage_glusterfs_storageclass_default=false
openshift_storage_glusterfs_block_deploy=true
openshift_storage_glusterfs_block_host_vol_size=100
openshift_storage_glusterfs_block_storageclass=true
openshift_storage_glusterfs_block_storageclass_default=false

openshift_storage_glusterfs_registry_namespace=infra-storage
openshift_storage_glusterfs_registry_block_deploy=true
openshift_storage_glusterfs_registry_block_host_vol_size=100
openshift_storage_glusterfs_registry_block_storageclass=true
openshift_storage_glusterfs_registry_block_storageclass_default=false