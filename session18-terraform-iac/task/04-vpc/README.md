# AWS VPC

## What is VPC?

**VPC (Virtual Private Cloud)** is a logically isolated network in AWS where you can launch and control AWS resources.

## CIDR

**CIDR** defines the IP address range of a VPC or subnet.

Example:

```text
10.0.0.0/16
```

A smaller prefix means a larger IP address range.

## Subnets

A **Subnet** is a smaller network inside a VPC.

```text
VPC
├── Public Subnet
└── Private Subnet
```

Subnets are associated with a specific **Availability Zone**.

## Route Tables

A **Route Table** contains rules that determine where network traffic should go.

Example:

```text
10.0.0.0/16 → Local
0.0.0.0/0   → Internet Gateway
```

## Internet Gateway

An **Internet Gateway (IGW)** allows resources in a public subnet to communicate with the internet.

```text
EC2 → Internet Gateway → Internet
```

## NAT Gateway

A **NAT Gateway** allows resources in a private subnet to **access the internet without allowing inbound internet connections**.

```text
Private EC2
    ↓
NAT Gateway
    ↓
Internet Gateway
    ↓
Internet
```

## Security Groups

A **Security Group** is a virtual firewall attached to resources such as EC2.

It controls **inbound and outbound traffic**.

Security Groups are **stateful**.

## Network ACLs

A **Network ACL (NACL)** is a firewall that operates at the **subnet level**.

It controls inbound and outbound traffic using rules.

NACLs are **stateless**.

## Public vs Private Subnet

### Public Subnet

A subnet whose route table has a route to an **Internet Gateway**.

```text
EC2 → IGW → Internet
```

### Private Subnet

A subnet that does not have a direct route to an Internet Gateway.

For outbound internet access, it can use a NAT Gateway.

```text
EC2 → NAT Gateway → IGW → Internet
```

## Quick Comparison

| Feature | Security Group | NACL |
|---|---|---|
| Works at | Resource level | Subnet level |
| Stateful | Yes | No |
| Rules | Allow only | Allow and Deny |
| Applies to | Resources | Subnets |