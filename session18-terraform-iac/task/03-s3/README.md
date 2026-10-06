# AWS S3

## What is S3?

**S3 (Simple Storage Service)** is AWS object storage used to store and retrieve data such as files, images, videos, and backups.

## Buckets

A **Bucket** is a container that stores objects.

```text
S3
└── Bucket
    ├── file1.csv
    ├── image.jpg
    └── data.json
```

## Objects

An **Object** is a file stored in an S3 bucket.

An object consists of:
- Data
- Key (name/path)
- Metadata

Example:

```text
Bucket: my-data
Object: datasets/train.csv
```

## Storage Classes

Storage classes determine the **cost and access pattern** of stored data.

Common classes:

- **S3 Standard** → Frequently accessed data
- **S3 Standard-IA** → Infrequently accessed data
- **S3 One Zone-IA** → Infrequent access, single AZ
- **S3 Glacier** → Long-term archival

## Versioning

**Versioning** keeps multiple versions of an object.

Example:

```text
data.csv
├── Version 1
├── Version 2
└── Version 3
```

Useful for recovering accidentally deleted or overwritten files.

## Lifecycle Policies

**Lifecycle policies** automatically move or delete objects based on rules.

Example:

```text
Standard
   ↓ 30 days
Standard-IA
   ↓ 90 days
Glacier
   ↓
Delete
```

This helps reduce storage costs.

## Encryption

Encryption protects data stored in S3.

Two common approaches:

- **SSE-S3** → AWS-managed encryption
- **SSE-KMS** → Encryption using AWS KMS keys

Encryption can be applied to data **at rest**.

## Bucket Policies

A **Bucket Policy** is a JSON-based resource policy that controls access to an S3 bucket and its objects.

Example:

```text
Bucket
  ↓
Bucket Policy
  ↓
Allow / Deny access
```

It can control access based on users, roles, accounts, IP addresses, and other conditions.

## Common Use Cases

- Storing datasets
- Storing images and videos
- Website hosting
- Backups
- Data lakes
- Log storage
- Long-term archival