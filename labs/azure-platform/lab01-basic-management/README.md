# Lab 1: Autonomous Identity & Auditing

This repository contains the results of the first hands-on lab focused on Azure Identity and Access Management (IAM) automation.

## Project Overview

The objective of this lab was to establish a secure, automated environment for managing and auditing Azure resources using a Service Principal (SPN). It demonstrates the implementation of the **Least Privilege** principle and the configuration of subscription-level auditing.

## Included Scripts

- **`list_resources.py`**: A management plane discovery tool used to verify Resource Group access.
- **`smoke_test.py`**: A security validation script that performs both positive (authorized) and negative (unauthorized) access attempts to verify RBAC boundaries.
- **`audit_file.py`**: A specialized auditing tool designed to query Azure Activity Logs and track Service Principal movements across the subscription.

## Execution Guide

All scripts must be executed from the **project root directory** to ensure the environment configuration (`.env`) is correctly loaded.

```powershell
# Resource Discovery
py labs/lab1/list_resources.py

# Security Verification (Smoke Test)
py labs/lab1/smoke_test.py

# Identity Auditing
py labs/lab1/audit_file.py
```

## IAM Concepts Implemented
- **Service Principal Authentication**: Secure programmatic access using Client Credentials.
- **RBAC Segmentation**: Scoping permissions to specific Resource Groups.
- **Audit Trails**: Utilizing Azure Monitor Activity Logs for Control Plane visibility.
- **Error Handling & API Latency**: Managing propagation delays in cloud logging environments.
