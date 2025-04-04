# **Load Balanced Web Server on Azure with CI/CD**

## **Overview**
This project provisions a **load-balanced web server** on **Linux VMs** in Azure using **Terraform**. Unlike previous implementations, this project introduces a **staging environment**, where configurations are maintained separately. The production setup is yet to be implemented.

Additionally, the project uses **GitHub Actions** for automated deployment and state management using **Azure Storage** as the remote backend. Authentication is handled securely via **Federated Authentication** instead of App Registration client secrets.

## **GitHub Actions Workflows**
This project includes **three automated workflows** for managing Terraform deployments:  

### 1️⃣ **Deploy on Push to `master`**
- Triggers on every push to the `master` branch.
- Runs `terraform init`, `plan`, and `apply`.
- Uses **Azure Storage as a remote backend** to store the Terraform state.
- All credentials are stored as **GitHub Secrets**.
- Uses **Federated Authentication** instead of App Registration secrets for enhanced security.

### 2️⃣ **Destroy on Manual Trigger**
- A **manually triggered** workflow for tearing down infrastructure.
- Runs `terraform destroy` and references the remote backend for state tracking.

### 3️⃣ **Validate on Pull Request to `master`**
- Triggers on pull requests to the `master` branch.
- Runs `terraform plan` to validate the changes **without applying them**.
- Refers to the Terraform state stored in the **remote backend**.
- The output of the plan is saved as an artifact for review.
