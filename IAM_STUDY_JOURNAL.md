# IAM Study Journal: Concepts & Keywords

This study journal is a dedicated log for tracking my professional pivot from AML to IAM. Its primary purpose is to capture, explain, and reinforce technical nomenclature and foundational concepts encountered during my hands-on labs.

---

### [2026-03-29] Foundations: Python & Azure Authentication

1. **Python Virtual Environment (venv)**
   - **Definition:** A isolated directory containing a specific Python installation and a set of additional packages.
   - **Why it matters:** Prevents version conflicts between different projects and ensures a clean, reproducible environment for security tools.
   - **AML Analogy:** Like a "Clean Room" or a dedicated sandbox for a specific investigation where you don't want to mix evidence from other cases.

2. **pip (Python Package Index)**
   - **Definition:** The standard package manager for Python, used to install and manage software packages (libraries).
   - **Why it matters:** Essential for installing core IAM libraries like `msal` or `azure-identity`.
   - **AML Analogy:** Like a "Certified Tool Inventory" – you only use approved, specific versions of tools for your compliance audit.

3. **Azure CLI (az login)**
   - **Definition:** A set of commands used to create and manage Azure resources via the terminal.
   - **Why it matters:** The primary way to verify your identity to Azure from your local machine before running scripts.
   - **AML Analogy:** Your "KYC (Know Your Customer)" process for the cloud. The login token is your "Authorized Personnel" badge.

4. **MSAL (Microsoft Authentication Library)**
   - **Definition:** A library that enables developers to acquire security tokens from the Microsoft identity platform to authenticate users and access secured web APIs.
   - **Why it matters:** The "engine" that handles tokens, sessions, and multi-factor authentication in your Python scripts.
   - **AML Analogy:** The "Token Dispenser" at a secure vault that issues a temporary pass after verifying your credentials.

5. **Microsoft Entra ID (formerly Azure AD)**
   - **Definition:** A cloud-based identity and access management service that helps your employees sign in and access resources.
   - **Why it matters:** It is the central database where you define roles (RBAC), users, and access policies.
   - **AML Analogy:** The "Master Registry" of all accounts and transaction limits within a financial institution.


---

### [2026-03-30] Authentication Patterns: Interactive vs. Automated

1. **Interactive Login (User-Led Auth)**
   - **Definition:** An authentication flow that requires a real person to interact with a UI (e.g., a browser or pop-up) to provide credentials or MFA.
   - **Typical Command:** `az login`
   - **Use Case:** Local development, administrative tasks by a human.
   - **AML Analogy:** Presenting a physical ID card at a bank branch; the officer sees *you* and verifies your identity.

2. **Non-Interactive Login (Programmatic Auth)**
   - **Definition:** Authentication that uses stored secrets, certificates, or managed identities to verify identity without human presence.
   - **Typical Method:** Service Principals with `ClientSecretCredential`.
   - **Use Case:** CI/CD pipelines, background scripts, microservices.
   - **AML Analogy:** A **SWIFT-style secure gateway** where two systems exchange encrypted keys to authorize a large transfer without a teller's manual sign-off.

3. **Service Principal (SPN)**
   - **Definition:** An identity created for use with applications, hosted services, and automated tools to access Azure resources.
   - **Why it matters:** It is the core of "App Identity" in IAM, allowing you to apply **Least Privilege** policies specifically to a script rather than a user.
   - **AML Analogy:** A **Corporate Power of Attorney** (PoA) granted to a specific entity or department to perform high-value transactions within defined limits.

4. **Authentication (AuthN) vs. Authorization (AuthZ)**
   - **Definition:** AuthN is *who* you are (login); AuthZ is *what* you can do (permissions/RBAC).
   - **Why it matters:** In IAM, a successful login (`az login`) only covers AuthN. You still need AuthZ (Roles) to actually manage resources.
   - **AML Analogy:** AuthN is the **KYC check** (Yes, you are Przemek); AuthZ is your **Account Limit** (No, you cannot transfer more than $10,000 without extra approval).

---
*Note: Repetition of concepts is encouraged for reinforcement (spaced repetition approach).*

