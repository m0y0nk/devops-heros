# AWS IAM

## What is IAM?

**IAM (Identity and Access Management)** controls **who can access AWS resources and what they can do**.

## Users

An **IAM User** represents an individual person or application.

Example: A developer who needs access to AWS.

## Groups

A **Group** is a collection of users with similar permissions.

Example:

```text
Developers → Mayank, Rahul, Priya
```

## Roles

A **Role** provides temporary permissions and can be assumed by users, applications, or AWS services.

Example:

```text
EC2 → IAM Role → S3
```

## Policies

A **Policy** is a JSON document that defines what actions are allowed or denied.

Example:

```text
Allow → s3:GetObject
```

## Permissions

**Permissions** define specific actions an identity can perform.

Examples:

```text
s3:GetObject
s3:PutObject
ec2:StartInstances
```

## Least Privilege

Give users or services **only the permissions they actually need**.

Example:

```text
Data Analyst → S3 Read Access
```

instead of giving `AdministratorAccess`.

## IAM Best Practices

- Enable MFA.
- Avoid using the root user regularly.
- Follow least privilege.
- Use roles instead of hard-coded credentials.
- Don't share credentials.
- Review and remove unused permissions.

## Common Use Cases

- Giving developers access to AWS services.
- Allowing EC2 to access S3.
- Allowing Lambda to access DynamoDB.
- Giving analysts read-only access.
- Providing temporary access through roles.