# test to see if the cluster is ready.
```

while [ $(nodetool status | grep UN | wc --lines) -lt 3 ] ; do sleep 5 ; echo sleeping... ; done
```

# create a new project in gloud
```
gcloud projects create gke-test-myhops --name="GKE Test Project" --organization=732357599807 --set-as-default
```

# Enable billing on the project
- doe dit in de console

# Create a new gke cluster beta
```
gcloud beta container --project "gke-test-myhops" clusters create "janusgraph-cluster" --zone "europe-west4-a" --username "admin" --cluster-version "1.10.7-gke.6" --machine-type "g1-small" --image-type "COS" --disk-type "pd-standard" --disk-size "30" --scopes "https://www.googleapis.com/auth/devstorage.read_only","https://www.googleapis.com/auth/logging.write","https://www.googleapis.com/auth/monitoring","https://www.googleapis.com/auth/servicecontrol","https://www.googleapis.com/auth/service.management.readonly","https://www.googleapis.com/auth/trace.append" --num-nodes "4" --no-enable-cloud-logging --no-enable-cloud-monitoring --network "projects/gke-test-myhops/global/networks/default" --subnetwork "projects/gke-test-myhops/regions/europe-west4/subnetworks/default" --additional-zones "europe-west4-a","europe-west4-b","europe-west4-c" --addons HorizontalPodAutoscaling,HttpLoadBalancing --enable-autoupgrade --enable-autorepair
```

# Create a new gke cluster non-beta, no additional zones
```
gcloud container --project "gke-test-myhops" clusters create "janusgraph-cluster" --username "admin" --cluster-version "1.10.7-gke.6" --machine-type "n1-standard-1" --image-type "COS" --disk-type "pd-standard" --disk-size "10" --scopes "gke-default" --num-nodes "3" --no-enable-cloud-logging --no-enable-cloud-monitoring --network "projects/gke-test-myhops/global/networks/default" --subnetwork "projects/gke-test-myhops/regions/europe-west4/subnetworks/default" --zone "europe-west4-a" --addons HorizontalPodAutoscaling,HttpLoadBalancing --enable-autoupgrade --enable-autorepair
```

# Delete the cluster
```
gcloud container clusters delete "janusgraph-cluster" --zone "europe-west4-a"
```

# max_map_count check sysmap
```
sudo sysctl -a | grep vm.max_map_count
```

# Elastic fails due to insufficient access rights to the pvc
Need to find out how to fix it. Has to do with the special account that elastic is running under.

Look at this example: need to add security context to run as user 1000 `('runAsUser: 1000')` and fsgroup 100 `('fsGroup:100')`.

## Fixed
Fixed by adding an init container that checks for the existence of the data volume and then makes user 1000 the owner.


# elastic-statefulste.yaml does not start when this is added to `spec.containers.name = elastic`
```
        # readinessProbe 
        # readinessProbe:
        #   httpGet:
        #     path: /_cluster/health
        #     port: rest
        #   initialDelaySeconds: 30
        #   periodSeconds: 5
```

## Fixed
Leave it out and only use liveliness probe.

# This has been put in `elastic-daemon.yaml`
This ensures that the setting will be applied in all pods.
```
# Moved to daemon
      # initContainers:
      #   - name: set-vm-max-map-count
      #     image: busybox
      #     imagePullPolicy: IfNotPresent
      #     command: ['sysctl', '-w', 'vm.max_map_count=262144']
      #     securityContext:
      #       privileged: true
```      

