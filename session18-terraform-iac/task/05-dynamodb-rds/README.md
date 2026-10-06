# DynamoDB

## NoSQL

**DynamoDB** is a fully managed **NoSQL database** designed for fast and scalable applications.

## Tables

A **Table** stores data in DynamoDB.

Example:

```text
Users
Products
Orders
```

## Items

An **Item** is a single record in a DynamoDB table.

```text
UserID: 101
Name: Mayank
Age: 20
```

## Attributes

**Attributes** are the individual data fields of an item.

```text
UserID → 101
Name   → Mayank
Age    → 20
```

## Partition Key

The **Partition Key** uniquely identifies and determines where an item is stored.

Example:

```text
UserID → 101
```

DynamoDB uses the partition key to distribute data across partitions.

## Sort Key

A **Sort Key** is an optional key used with a partition key to organize and query related items.

```text
Partition Key: UserID
Sort Key: OrderID
```

## Use Cases

- High-scale web applications
- E-commerce
- Gaming
- Real-time applications
- Session storage
- Serverless applications

---

# RDS

## Relational Database

**RDS (Relational Database Service)** is a managed service for running relational databases in AWS.

It uses **SQL** and supports structured tables with relationships.

## Supported Engines

Common supported engines include:

- PostgreSQL
- MySQL
- MariaDB
- Oracle
- SQL Server
- Amazon Aurora

## DB Instances

A **DB Instance** is the compute environment that runs the database engine.

You choose its:

- CPU
- Memory
- Storage
- Database engine

## Security

RDS security can include:

- VPC and private subnets
- Security Groups
- Encryption
- IAM authentication for supported engines

## Backups

RDS provides **automated backups** and **manual snapshots**.

These can be used to restore a database to an earlier state.

## Multi-AZ

**Multi-AZ** maintains a standby database in another Availability Zone for **high availability**.

```text
Primary DB
    ↓
Standby DB
```

If the primary fails, RDS can automatically fail over to the standby.

## Read Replicas

**Read Replicas** are copies of a database used to handle **read traffic**.

```text
Application
   ↓
Primary DB → Writes
   ↓
Read Replica → Reads
```

They help scale read-heavy applications.

## Use Cases

- Web applications
- E-commerce systems
- Business applications
- Transactional workloads
- Applications requiring SQL and relational data