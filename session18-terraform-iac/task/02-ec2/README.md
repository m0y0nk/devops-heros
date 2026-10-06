# AWS EC2

## What is EC2?

**EC2 (Elastic Compute Cloud)** provides virtual servers in the AWS cloud.

You can use EC2 to run:
- Applications
- Websites
- APIs
- Backend servers

## AMI

**AMI (Amazon Machine Image)** is a template used to create an EC2 instance.

It contains things like:
- Operating system
- Software
- Configuration

Example:

```text
AMI → Create EC2 Instance → Running Server
```

## Instance Types

Instance types define the **CPU, memory, storage, and network capacity** of an instance.

Examples:

```text
t3.micro → Small workloads
m7i.large → General purpose
c7i.large → CPU-intensive workloads
```

## Key Pairs

A **Key Pair** is used to securely connect to an EC2 instance.

It consists of:

```text
Public Key → Stored on EC2
Private Key → Kept by you
```

For Linux instances, the private key is commonly used with SSH.

## Security Groups

A **Security Group** acts as a virtual firewall for an EC2 instance.

It controls:
- Inbound traffic
- Outbound traffic

Example:

```text
Port 22 → SSH
Port 80 → HTTP
Port 443 → HTTPS
```

## EBS

**EBS (Elastic Block Store)** provides persistent storage for EC2 instances.

It is commonly used as the instance's disk.

```text
EC2 Instance
     ↓
    EBS
     ↓
  Data / OS
```

EBS data can persist even when an instance is stopped.

## Public vs Private IP

### Public IP

Used for communication over the internet.

```text
Internet → Public IP → EC2
```

### Private IP

Used for communication within a private network, such as a VPC.

```text
EC2 → Private IP → Other AWS Resources
```

## Instance Lifecycle

An EC2 instance commonly moves through these states:

```text
Pending → Running → Stopping → Stopped
                    ↓
                 Terminating
                    ↓
                 Terminated
```

- **Running** → Instance is active.
- **Stopped** → Instance is shut down but can usually be started again.
- **Terminated** → Instance is permanently deleted.

## Common Use Cases

- Hosting websites
- Running backend APIs
- Running databases
- Machine learning workloads
- Running development environments
- Hosting applications and services