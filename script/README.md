# Kubernetes Pod Cleaner
This Python script, kubernetes_clean.py, uses the kubernetes python client library to clean up Completed/Failed pods from given namespaces. It removes all pods in the states, Evicted, Completed, OOMKilled and Error
then output the pod name and state.


## Prerequisites
1. Python installed on your system
2. Kubernetes python client library installed. Can be installed using pip.
```pip install kubernetes```
3. `kubectl` configured

## Usage
```python kubernetes_pod_cleaner.py namespace1 namespace2 namespace3 ...```

## Import as Module
```python
from kubernetes_pod_cleaner import clean_pods

namespaces = ["namespace1", "namespace2", "namespace3"]
clean_pods(namespaces)
```