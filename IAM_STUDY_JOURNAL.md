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


### [2026-03-31] Resource Management & Scoping
1. **Resource Management Client**
   - **Definition:** A library component (SDK) that allows interacting with Azure Resource Manager (ARM) to perform actions like listing, creating, or deleting resources.
   - **Why it matters:** It is the primary tool for automating inventory checks and infrastructure auditing.
   - **AML Analogy:** Like a "Central Asset Registry" – a tool that lets you pull a list of all accounts or assets owned by a specific legal entity.

2. **Resource Group Scoping**
   - **Definition:** Restricting the permission of a Service Principal (SPN) to a specific container (Resource Group) rather than the whole subscription.
   - **Why it matters:** Core implementation of the **Least Privilege** principle. If the SPN is compromised, the attacker only gains access to that specific group.
   - **AML Analogy:** Like an investigator who only has access to files related to a specific "Case Number", instead of the entire bank database.

### [2026-03-31] IAM Verification & Smoke Testing
1. **Smoke Test (IAM Perspective)**
   - **Definition:** A rapid initial test to verify if the core security boundaries and operational capabilities are active.
   - **Why it matters:** It is the first line of defense in confirming that a newly created bot or identity cannot stray outside its playground.
   - **AML Analogy:** Like a "Test Transaction" – sending a small amount between internal accounts to ensure the filters and limits are correctly set before processing real volume.

2. **Least Privilege Enforcement**
   - **Definition:** The practical confirmation that an identity is restricted to the minimum set of permissions (scoping) and cannot access unauthorized resources.
   - **Why it matters:** It prevents "Lateral Movement" in case of a security breach. If the bot is hacked, the rest of the subscription (like `NetworkWatcherRG`) remains safe.
   - **AML Analogy:** Like a "Firewall" between a bank's Retail and Investment divisions – preventing data leakage between sensitive areas.
