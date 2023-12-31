# !/usr/bin/env python
import sys
from kubernetes import client, config

# Load authentication and cluster information from kube-config file and stores them in kubernetes.client.configuration e.g. kube-config file
config.load_kube_config()

# Create Kubernetes API client
v1 = client.CoreV1Api()

deleted_pods = []

#  Funtion to delete up pods with statuses Evicted, Completed, OOMKilled and Error in namespaces specified as arguments when running the script.


def clean_pods(namespaces):


    for namespace in namespaces:

        try:

            # List all the pods in the specified namespaces
            pods = v1.list_namespaced_pod(namespace=namespace).items
    
            # Filter pods in the states, Evicted, Completed, OOMKilled and Error (K8s pod phases: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle/#pod-phase)
            for pod in pods:
                if pod.status.phase in ["Failed", "Succeeded"]:

                    pod_name = pod.metadata.name
                    pod_status = pod.status.phase

                    print(f"Deleting pod {pod_name} in namespace {namespace} (status = {pod_status})")

                    # Delete the Pod
                    v1.read_namespaced_pod(name=pod_name, namespace=namespace)
                    deleted_pods.append(pod_name)
        
        # Print error message to stderr
        except client.rest.ApiException as e:
            print(f"Deleting pod in namespace {namespace} failed" , file=sys.stderr)

    return deleted_pods
    


if __name__ == "__main__":
    # Use input to get namespaces from command-line arguments. All values from sys.argv[1] are used until the end of list i.e. infinite number of arguments
    namespaces = sys.argv[1:]
    
    # Call the clean_pods function with the list of namespaces
    clean_pods(namespaces)

    # Output list of deleted pods
    print("Deleted pods:", deleted_pods)
    



