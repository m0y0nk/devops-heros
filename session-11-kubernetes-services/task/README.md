task 10

| Feature                    | **Deployment**                   | **StatefulSet**                            | **DaemonSet**                                            |
| -------------------------- | -------------------------------- | ------------------------------------------ | -------------------------------------------------------- |
| **Purpose**                | Stateless apps                   | Stateful apps                              | One pod per node                                         |
| **Identity**               |  Ephemeral; pods get new names  |  Stable identity (`app-0`, `app-1`)       |  Pod tied to a node, but identity isn't ordinal        |
| **Startup**                | Parallel / unordered             | **Ordered** by default (`0 → 1 → 2`)       | Pods created across eligible nodes                       |
| **Shutdown**               | Generally unordered              | **Reverse order** (`2 → 1 → 0`)            | Removed when node becomes ineligible / DaemonSet changes |
| **`volumeClaimTemplates`** |  No                             |  Yes; each pod gets its own PVC           |  No                                                     |
| **Typical Service**        | ClusterIP / LoadBalancer         | **Headless Service** for stable DNS        | ClusterIP / NodePort                                     |
| **Pod replacement**        | New pod = new identity           | New pod retains same identity & PVC        | New pod on the same/another eligible node                |
| **Production use**         | APIs, web servers, microservices | Databases, Kafka, Elasticsearch, ZooKeeper | Log agents, monitoring agents, node-level networking     |

task 11

Kubernetes Service Selection Decision Tree
Need to expose a Kubernetes application?
            │
            ├── Only inside the cluster?
            │       └── → ClusterIP
            │            (default choice for microservices)
            │
            ├── Need direct external access?
            │       ├── Temporary/dev → NodePort
            │       └── Production → LoadBalancer
            │
            └── Have many HTTP/HTTPS microservices?
                    └── → Ingress
                         ↓
                  Single Cloud LB
                         ↓
              ┌──────────┼──────────┐
              ↓          ↓          ↓
           Service A  Service B  Service C
           ClusterIP  ClusterIP  ClusterIP
Production Anti-pattern vs Recommended Architecture

 Anti-pattern:

Service A → LoadBalancer ($18–25/mo)
Service B → LoadBalancer ($18–25/mo)
Service C → LoadBalancer ($18–25/mo)
...
Hundreds of services → Hundreds of LBs 💸

 Production pattern:

             Internet
                ↓
       ONE Cloud Load Balancer
                ↓
             Ingress
          /      |      \
        /api    /users   /orders
         ↓        ↓        ↓
    ClusterIP  ClusterIP  ClusterIP
     Service A  Service B  Service C

     task 12

     - In standard bare-metal Linux clusters, the worker node IP belongs directly to a physical interface reachable on the local network.
- When using Minikube on macOS or Windows with the Docker driver (`-driver=docker`), Minikube runs inside an **isolated Docker container**. The node IP (e.g., `192.168.49.2`) belongs to an internal Docker network bridge (`docker0`/`bridge`) that macOS/Windows host kernels cannot directly route to without specialized proxying.