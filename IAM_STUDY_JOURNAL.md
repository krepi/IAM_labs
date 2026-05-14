# IAM Study Journal: Concepts & Keywords

This study journal is a dedicated log for tracking my professional pivot from AML to IAM. Its primary purpose is to capture, explain, and reinforce technical nomenclature and foundational concepts encountered during my hands-on labs.





---

### [2026-05-14] Delegated Administration & Granular Scoping (Advanced RBAC)

1. **User Access Administrator (Delegation)**
   - **Definition:** A specialized RBAC role that allows a user to manage role assignments for others, but *without* the full resource management powers of an 'Owner'.
   - **Why it matters:** In a secure IAM model, we separate the "What" (managing resources) from the "Who" (managing access). Giving someone `Contributor` + `User Access Administrator` is safer than giving them `Owner`.
   - **AML Analogy:** **"Authorized Signatory Management"** – an officer who is allowed to add new authorized users to a corporate account, but doesn't have the authority to actually withdraw the funds themselves.

2. **Granular Scoping (Resource-Level Scope)**
   - **Action:** Using a specific Resource ID (e.g., a single VM ID) in the `--scope` parameter of a role assignment.
   - **Why it matters:** It is the ultimate implementation of **Least Privilege**. Instead of seeing the whole resource group, the user sees only the specific "room" (resource) they are allowed to enter.
   - **AML Analogy:** **"Safe Deposit Box Access"** – a customer has access to the bank (Subscription), the vault room (Resource Group), but only their *specific* box (Resource) can be opened by their key.

3. **Azure ABAC (Role Assignment Conditions)**
   - **Concept:** Adding "If/Then" logic to a role assignment. For example: "You can assign roles, BUT only the 'Reader' role and ONLY within this specific department."
   - **Why it matters:** Prevents "Privilege Escalation". It ensures that a delegated admin cannot accidentally (or intentionally) grant someone higher permissions than they should have.
   - **AML Analogy:** **"Threshold-Based Approval"** – a junior investigator can approve transactions, but ONLY if they are below $5,000 and the customer is from a "Low Risk" category.

---

### [2026-05-13] Infrastructure Security: Network Isolation & Defense in Depth

1. **Network Isolation (Micro-segmentation)**
   - **Context:** New networking lab initialized (`labs/networking/lab01-network-security`).
   - **Why it matters:** In IAM, identity is the "new perimeter," but network isolation remains a critical secondary control. Even an authenticated identity should be restricted from reaching sensitive assets if they are not within the authorized network segment (Zero Trust principle).
   - **AML Analogy:** **"Physical Vault Isolation"** – even if you have the key (Identity), you must be physically present in the specific secure zone (Network) of the bank to open the vault. Having the key doesn't allow you to open it from the street.

2. **Defense in Depth (Layered Security)**
   - **Concept:** A security strategy that employs multiple layers of defense to protect assets. If one layer (like IAM/RBAC) fails, others (like Network Security Groups or Encryption) are still in place.
   - **Why it matters:** Relying on a single control is a "Single Point of Failure." Layering IAM policies with network boundaries significantly reduces the **Blast Radius**.
   - **AML Analogy:** **"Multi-Layered Fraud Detection"** – combining KYC at account opening, transaction limits at the point of execution, and behavioral monitoring during the session. Each layer catches what others might miss.

3. **Access Control Lists (ACLs) - File System Security**
   - **Action:** Used `icacls` to restrict `.pem` file permissions. 
   - **Why it matters:** IAM is not just about the cloud; it starts at your local machine. If your private key (your Identity) is readable by everyone on your PC, it's not a secret anymore. Windows ACLs allow for granular "Read-Only" locks.
   - **AML Analogy:** **"Dual Key Custody"** – a rule where only specific employees can physically hold the keys to the sensitive document storage.

4. **Bastion Host / Jumpbox (Choke Point)**
   - **Action:** Created a VM to act as a secure gateway (`vm-jumpbox`).
   - **Why it matters:** Instead of exposing every server to the internet, you use a "Jumpbox." This creates a single, highly audited entry point. It's much easier to monitor one gateway than 100 individual servers.
   - **AML Analogy:** **"High-Value Transaction Clearing"** – instead of letting any branch process a $1M transfer, all such transactions must pass through one specialized, high-security regional hub.

---

### [2026-04-20] Lifecycle Management: Identity Provisioning & Collision Handling

1. **Identity Provisioning (Unique IDs)**
   - **Action:** Implemented a `generate_id` logic that creates account names using name/surname initials and a numeric suffix.
   - **Why it matters:** In large organizations, automated ID generation is essential to avoid manual errors and ensure that every user has a unique identifier (like `sAMAccountName` in AD).
   - **AML Analogy:** **"Unique Entity Identification"** – assigning a unique internal ID to a customer to ensure their activities across different branches are linked to the same person, even if they have a common name.

2. **Collision Handling (Incremental Suffixes)**
   - **Action:** Added a loop that scans existing IDs to find the `highest_suffix` and increments it by 1.
   - **Why it matters:** Prevents "Account Overlap" where two users (e.g., two "Jan Kowalski") would be assigned the same login. Finding the "Next Available" ID is a core requirement for automated workflow systems.
   - **AML Analogy:** **"Deduplication"** – checking if a new client is actually an existing customer trying to open multiple accounts under slightly different aliases (e.g., "Jan" vs "Janusz").

---

### [2026-04-19] Security Standards: Regex Validation & Documentation

1. **Regular Expressions (Regex) in IAM**
   - **Action:** Implemented a complex regex pattern to enforce password requirements in a single pass.
   - **Why it matters:** Regex provides a standardized, industry-wide way to define complex validation rules. In IAM, this ensures that password policies are applied consistently and are easier to update without changing the logic flow.
   - **AML Analogy:** **"Pattern Matching"** in transaction monitoring – using specific algorithms to detect "Smurfing" or "Layering" by identifying specific sequences of behavior across multiple accounts.

2. **Professional Documentation & SRP**
   - **Action:** Added English Docstrings and finalized class separation.
   - **Why it matters:** Clear documentation and Single Responsibility Principle (SRP) are critical for auditing security code. If an auditor can't understand what a piece of code does, they can't verify its security.
   - **AML Analogy:** **"Audit Trail Clarity"** – ensuring that every decision made during a KYC review is well-documented and mapped to a specific regulatory requirement.

---

### [2026-04-14] Architecture: Decoupling & Dependency Injection

1. **Decoupling (Unused Dependencies)**
   - **Action:** Removed the `user` dependency from the `Authenticator` class.
   - **Why it matters:** In security architecture, keeping components "loosely coupled" reduces the attack surface and makes the system easier to maintain. If a component doesn't need an object to perform its job, it shouldn't have access to it.
   - **AML Analogy:** An investigator only needs the "Transaction ID" to verify a payment, not the customer's entire personal history and family tree (Data Minimization).

2. **Dependency Injection (Method Injection)**
   - **Action:** Passed the `authenticator` instance into the `access_level()` method.
   - **Why it matters:** This allows the `User` class to remain independent of the *how* authentication happens. We can swap the basic `Authenticator` for an `MFA_Authenticator` without changing the `User` class.
   - **AML Analogy:** A "Due Diligence Module" that can be plugged into any "New Account" flow regardless of whether it's for a person or a company.

---

### [2026-04-13] Security Remediation: Fixing Data Leaks & Controlled Loops

1. **Security Remediation (Data Leakage)**
   - **Action:** Removed password return from the `access_level()` method.
   - **Why it matters:** Even in development, printing passwords to the console or returning them in user-facing strings is a major "Finding" in security audits. It violates the principle of **Need-to-Know**.
   - **AML Analogy:** Like a bank agent accidentally printing a customer's full SSN on a public-facing receipt instead of just the last 4 digits.

2. **Loop Control vs. Recursion**
   - **Action:** Switched `password_creator()` from recursion to a `while True` loop.
   - **Why it matters:** Recursion can lead to a `RecursionError` if not handled carefully. In security, **Predictable Termination** is important. A loop is more idiomatic for retry logic in Python.
   - **AML Analogy:** A repetitive manual check that continues until the "clean" state is reached, rather than a chain of referrals that could get lost in the hierarchy (stack overflow).

---

### [2026-04-12] Secure Development: ABAC & Sensitive Data Handling

1. **ABAC (Attribute-Based Access Control)**
   - **Applied Concept:** In `playground.py`, access levels (Admin/User) and email domains are determined by the `department` attribute.
   - **Why it matters:** Unlike RBAC (roles), ABAC allows for very granular policies based on user, resource, and environmental attributes.
   - **AML Analogy:** **"Jurisdictional Risk"** – giving a customer a different risk profile automatically because their `country` attribute is on a sanctioned list.

2. **Sensitive Data Exposure (The "Plaintext Leak")**
   - **Critical Lesson:** Never include passwords or secrets in return strings or logs (like in `access_level()`). 
   - **IAM Best Practice:** Use "Write-Only" patterns for secrets. Once a password is set, it should only be compared as a hash, never retrieved or displayed.
   - **AML Analogy:** **"Tipping Off"** – accidentally revealing sensitive investigation details in a public report or to the customer themselves.

3. **Refactoring Strategy: Separation of Concerns**
   - **Goal:** Split the `User` class into specialized components (Identity, Authenticator, Authorizer).
   - **Key Concepts:** Single Responsibility Principle (SRP), Dependency Injection.
   - **Why it matters:** In large-scale IAM (like Azure Entra), these are separate services. Decoupling them makes the system scalable and easier to audit.

4. **CSPRNG vs. PRNG (Security Context)**
   - **IAM Choice:** Always use `secrets` for passwords, tokens, and session IDs instead of `random`.
   - **AML Analogy:** **"Random Sampling for Audit"** (PRNG) vs. **"Sealed Evidence Bags"** (CSPRNG).

---

### [2026-04-11] IAM Logic: Password Validation & Role-Based Access

1. **Password Validation (Length & Confirmation)**
   - **Definition:** A process of checking if a user-supplied password meets minimum security criteria (e.g., length) and matches a confirmation input.
   - **Why it matters:** Prevents typos during password setting and ensures a baseline level of complexity before the password is even hashed or stored.
   - **AML Analogy:** **"Customer Identification Program (CIP)"** – ensuring that the data provided (like an ID number) matches the required format and is confirmed across multiple documents before opening an account.

2. **Access Control Logic (Department-Based)**
   - **Definition:** Determining the level of permission (Admin vs. User) based on specific attributes of the identity (like the `department` attribute).
   - **Why it matters:** Foundational for **Attribute-Based Access Control (ABAC)**. Automated decisions based on user metadata reduce manual management overhead.
   - **AML Analogy:** **"Risk Rating"** – assigning a specific level of monitoring or transaction limits based on the customer's "Department" (e.g., industry or geographic location). High-risk departments get "Admin" (Enhanced Due Diligence) level scrutiny.

---

### [2026-04-08] Identity Protection: MFA & Passwordless Authentication

1. **Multi-Factor Authentication (MFA)**
   - **Definition:** A security mechanism that requires the user to provide two or more verification factors to gain access to a resource.
   - **Factors:** Something you know (password), something you have (token/phone), something you are (biometrics).
   - **Why it matters:** Even if a password is "securely generated" and has "high entropy", it can still be stolen (phishing). MFA provides the critical second line of defense.
   - **AML Analogy:** A **"Dual Control"** or **"Four-Eyes Principle"** – where a single person cannot authorize a high-risk transaction alone; a second, independent verification is required.

2. **Passwordless Authentication**
   - **Definition:** A method of verifying identity without using a password. Instead, it uses biometrics, FIDO2 security keys, or certificates.
   - **Typical Method:** Microsoft Authenticator app (Push notification), Windows Hello.
   - **Why it matters:** Eliminates the "human factor" of weak passwords and the "storage factor" of leaked credentials.
   - **AML Analogy:** A **"Biometric Safe"** – that only opens upon scanning the facial features or fingerprints of an authorized officer, rather than relying on a code that could be written down or coerced.

3. **Branching Strategies (Future Concept)**
   - **Definition:** A set of rules for how developers use Git branches (e.g., GitFlow, Trunk-based Development).
   - **Why it matters:** Essential for **CI/CD** pipelines and infrastructure-as-code (IaC). It ensures that changes to security policies or automation scripts are reviewed before being applied.
   - **AML Analogy:** **"Environment Segregation"** – keeping the vault (Production) separate from the training area (Development) so that any mistakes made during training don't lead to a real loss of assets.

---

### [2026-04-07] IAM Security: Character Diversity & Password Policies

1. **Character Group Requirements**
   - **Definition:** A set of rules mandating that a password contains at least one character from various categories (uppercase, lowercase, digits, symbols).
   - **Why it matters:** Increases the **search space** for brute-force attacks by forcing the use of multiple character sets.
   - **IAM Analogy:** A **"Multi-Factor Requirement"** for the password itself. Just like MFA requires multiple pieces of evidence, a diverse password requires multiple types of characters to be valid.

2. **Cryptographic Shuffling**
   - **Definition:** Reordering a set of elements using a secure randomness source (CSPRNG) so that the final position of each element is unpredictable.
   - **Python Tool:** `secrets.SystemRandom().shuffle()`.
   - **Why it matters:** Prevents "Pattern Identification". If a password generator always puts the symbol at the end or the digit at the start, it drastically reduces the effective entropy.
   - **AML Analogy:** **"Layering"** in the laundering process – intentionally mixing and shuffling assets across multiple accounts and jurisdictions to break the audit trail and make the original source impossible to predict from the final destination.

3. **Validation vs. Generation**
   - **Definition:** Validation checks if an *existing* password meets criteria; Generation creates a password that is *guaranteed* to meet them.
   - **Shift in Mindset:** Modern IAM systems (like Azure AD/Entra ID) use sophisticated password protection and global ban lists that go beyond simple character requirements.
   - **AML Analogy:** **"Negative Screening"** (checking against a list of bad actors) vs. **"Safe Guarding"** (only allowing transactions that meet strict, pre-defined safety patterns).

---

### [2026-04-03] Account Security: Password Generation & Entropy

1. **CSPRNG (Cryptographically Secure Pseudo-Random Number Generator)**
   - **Definition:** A random number generator with properties that make it suitable for use in cryptography. It is unpredictable even if part of its state is known.
   - **Python Tool:** The `secrets` module (instead of `random`).
   - **Why it matters:** In IAM, if tokens or passwords are predictable, the entire authentication system is compromised. 
   - **AML Analogy:** Like a **"Secure Key Infrastructure"** for bank vaults – you need a process that ensures no two keys are ever the same and cannot be guessed.

2. **Password Entropy**
   - **Definition:** A measurement of how unpredictable a password is. It depends on the size of the character set and the length of the password.
   - **Modern Standard:** Length usually trumps complexity. A long passphrase is often harder to crack than a short, complex password.
   - **AML Analogy:** The difficulty of a **"Money Laundering Scheme"** to be detected – the more "random" and disconnected the steps (high entropy), the harder it is for investigators to reconstruct the path.

3. **Brute-force Attack (IAM Context)**
   - **Definition:** An attempt to crack a password or username by systematically trying every possible combination.
   - **Defense:** Throttling, Account Lockout, and MFA.
   - **AML Analogy:** **"Structuring" (Smurfing)** – an attacker trying many small combinations/transactions to find a gap in the system's defenses without triggering a major alert.

---

### [2026-04-02] Cryptography Basics: Symmetric Ciphers
1. **Symmetric Encryption**
   - **Definition:** A type of encryption where the same key is used for both encrypting and decrypting the information.
   - **Example:** Caesar Cipher (Shift Cipher).
   - **Why it matters:** Foundational concept for understanding how data at rest and in transit is secured in Azure (e.g., BitLocker, TLS).
   - **AML Analogy:** Like a **"Shared Secret"** or a physical key to a safe that both the bank and the customer possess.

2. **Plaintext vs. Ciphertext**
   - **Definition:** Plaintext is the original, readable message; Ciphertext is the encrypted, unreadable version.
   - **Why it matters:** In IAM, sensitive data (like `Client Secret`) should never be stored as plaintext.
   - **AML Analogy:** A **Clean Bill of Lading** (Plaintext) vs. a **Redacted Transaction Report** (Ciphertext) where sensitive PI is hidden.

3. **The Caesar Cipher (Shift Cipher)**
   - **Definition:** One of the simplest and most widely known encryption techniques where each letter in the plaintext is replaced by a letter some fixed number of positions down the alphabet.
   - **Why it matters:** Demonstrates the importance of **Key Management**. If the "shift" (key) is known, the security is compromised.
   - **AML Analogy:** A simple **substitution code** used in old-school ledger entries to hide client names from casual observers.

---

### [2026-04-01] Auditing & Visibility: Control Plane vs. Data Plane

1. **Control Plane (Management Plane)**
   - **Definition:** The layer of Azure responsible for management operations, such as creating, deleting, or modifying resources (e.g., creating a Storage Account).
   - **Protocol:** Azure Resource Manager (ARM).
   - **AML Analogy:** Like the **"Authorized Signatory Register"** – verifying who is legally permitted to open a new bank account or update a customer's risk profile.

2. **Data Plane**
   - **Definition:** The layer responsible for interacting with the actual data *within* a resource (e.g., reading a blob file inside a Storage Account).
   - **Monitoring:** Requires Diagnostic Settings and a Log Analytics Workspace.
   - **AML Analogy:** Like **"Transaction Monitoring"** – tracking the actual flow of funds (the data) between accounts to detect suspicious movement, rather than just who opened the account.


3. **Log Analytics Workspace (LAW)**
   - **Definition:** A centralized repository in Azure for collecting, storing, and analyzing telemetry and log data using KQL (Kusto Query Language).
   - **Why it matters:** It serves as the single source of truth for security forensics and IAM auditing.
   - **AML Analogy:** The **"Centralized Compliance Data Lake"** – where all global transaction records are stored for multi-year auditing and regulatory reporting (e.g., to FINCEN).

4. **The "Silent 403" (Silent Enumeration)**
   - **Definition:** Failed "Read/List" operations (GET) are typically NOT logged in the Azure Activity Log to reduce noise.
   - **Fact:** Failed "Write/Delete/Action" (PUT/DELETE/POST) ARE logged as "Failed" with an "AuthorizationFailed" status.
   - **IAM Strategy:** To detect reconnaissance (silent enumeration), you need **Log Analytics Workspace** or **Microsoft Sentinel**.
    
### [2026-04-01] Lab 1 - Final Reflection
- **Complexity Management:** As the scripts grow, it is important to pause and map the code blocks back to the business / IAM logic.
- **The "Big Picture":** Our Python code is simply a **messenger** that carries identity tokens (`AuthN`) and requests actions (`AuthZ`) to the Azure API.
- **Consolidation Plan:** The next phase will focus on "Reading the Code" rather than writing new modules, ensuring deep comprehension of the `try...except` and `OData filter` constructs.

---

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

### [2026-04-22] Data Normalization & Formatting in Identity

1. **Identity Data Normalization**
   - **Action:** Refactored `generate_id` to enforce uppercase IDs, pad surnames with 'X' to 3 characters (`.ljust(3, 'X')`), and standardize the numeric suffix to 5 digits (`.zfill(5)`).
   - **Why it matters:** IAM systems (like AD/Entra) require strict data conventions. Normalizing data prevents sync errors and formatting mismatches downstream.
   - **AML Analogy:** **"Data Cleansing"** – Ensuring names and addresses are formatted identically before running them through a screening engine to prevent false negatives.

---
*Note: Repetition of concepts is encouraged for reinforcement (spaced repetition approach).*

- Secrets Management: Secure storage and handling of sensitive information (APIs, tokens, passwords) in automation.
- Service Account: A special type of account intended to represent a non-human user that needs to authenticate and be authorized to access resources.
- Machine-to-Machine (M2M) Authentication: The process by which two automated systems authenticate with each other without human intervention.
- Blast Radius: The impact that a security incident can have on an organization. Limiting the blast radius is a key strategy in IAM to ensure that a compromise of one part of the system does not lead to total collapse.
