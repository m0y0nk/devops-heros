According to the official Kubernetes architecture docs, we can document control plane and nodes components as :

1. Control Plane — manages the cluster

ComponentJob

kube-apiserver

Entry point/API of the cluster; all components communicate through it

etcd

Stores the cluster's state/data

kube-scheduler

Decides which worker node should run a new Pod

kube-controller-manager

Continuously checks actual state vs desired state and takes corrective action

cloud-controller-manager

Handles cloud-provider-specific operations (optional)

(Kubernetes)

2. Worker Node — runs applications

ComponentJob

kubelet

Makes sure the Pods/containers assigned to the node are actually running

Container Runtime

Actually runs the containers (e.g., containerd)

kube-proxy

Handles networking/Service traffic on the node (optional with some network plugins)

(Kubernetes)

How they interact

              CONTROL PLANE
        ┌─────────────────────────┐
        │ API Server              │
        │ Scheduler               │
        │ Controller Manager      │
        │ etcd                    │
        └───────────┬─────────────┘
                    │
             Kubernetes API
                    │
        ┌───────────┴─────────────┐
        ↓                         ↓
  WORKER NODE 1             WORKER NODE 2
 ┌──────────────┐           ┌──────────────┐
 │ kubelet      │           │ kubelet      │
 │ runtime      │           │ runtime      │
 │ Pods         │           │ Pods         │
 │ kube-proxy   │           │ kube-proxy   │
 └──────────────┘           └──────────────┘

Example: When we run kubectl apply -f deployment.yaml → API Server receives it → state is stored in etcd → scheduler chooses a worker node → kubelet on that node gets the Pod specification → container runtime starts the containers. (Kubernetes)

