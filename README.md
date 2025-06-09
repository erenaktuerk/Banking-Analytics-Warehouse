# Banking Analytics Warehouse

## Overview

This repository contains a production-ready, scalable data warehouse solution tailored for banking analytics, built on Snowflake as the cloud data platform and dbt (data build tool) for robust, modular, and version-controlled data transformations.

The project follows industry best practices in modern data engineering, focusing on maintainability, testability, and automation to support critical banking use cases such as credit risk analysis, compliance monitoring, and customer analytics.

By leveraging dbt’s model dependency graph and automated documentation, this solution ensures transparent data lineage, easy collaboration, and fast onboarding for analytics and data engineering teams.

---

## Key Features

- *Cloud-native & scalable:* Designed for Snowflake to deliver high performance, elastic compute, and secure, governed data storage.
- *Modular transformation pipelines:* Well-structured dbt models with clear staging and marts layers, enabling reuse, flexibility, and maintainability.
- *Comprehensive testing & validation:* Embedded schema and data quality tests guarantee reliability and data accuracy before downstream consumption.
- *Auto-generated documentation & lineage:* Up-to-date data lineage and detailed model documentation generated automatically with dbt docs.
- *Version-controlled development:* Git-based workflows with clean commit history and CI/CD readiness.
- *Real-world banking focus:* Implements concrete use cases around credit risk scoring, regulatory compliance checks, and customer transaction analytics.
- *Configurable environment:* Profiles and project configurations adapted for local development, testing, and production deployments.
- *Clear project structure:* Logical separation of raw, staging, and marts layers aligned with best practices in data warehouse design.

---

## Repository Structure

.
├── banking_dbt/                 # dbt project folder containing transformations and tests
│   ├── analyses/                # Analytical queries for ad-hoc exploration
│   ├── macros/                  # Reusable SQL macros to simplify transformations
│   ├── models/                  # SQL models (staging, marts, snapshots)
│   ├── seeds/                   # Static seed data for reference tables
│   ├── snapshots/               # Snapshots to capture slowly changing dimensions
│   ├── tests/                   # Custom tests and assertions
│   ├── dbt_project.yml          # dbt project configuration file
├── data/                       # Raw and processed data (excluded from repo)
├── docs/                       # Project documentation, diagrams, and architecture
├── requirements.txt            # Python dependencies for dbt and utilities
├── README.md                   # Project overview and instructions
├── .gitignore                  # Files and folders ignored by Git
└── profiles.yml (excluded)     # Local dbt connection profiles (not committed)

---

## Setup & Usage

### Prerequisites

- Snowflake account with proper roles and permissions for data warehouse access
- Python 3.10+ installed locally
- dbt version 1.9.x installed within a Python virtual environment
- Git for version control and collaboration

### Installation

1. Clone the repository:

   ```bash
   git clone <repo-url>
   cd Banking-Analytics-Warehouse

	2.	Create and activate a Python virtual environment:

python -m venv venv
# Windows
.\venv\Scripts\activate
# macOS/Linux
source venv/bin/activate


	3.	Install project dependencies:

pip install -r requirements.txt


	4.	Configure your Snowflake connection profile locally in ~/.dbt/profiles.yml (excluded from repo):

banking_analytics_profile:
  target: dev
  outputs:
    dev:
      type: snowflake
      account: <account_name>
      user: <username>
      password: <password>
      role: ACCOUNTADMIN
      database: BANKING_ANALYTICS
      warehouse: COMPUTE_WH
      schema: RAW
      threads: 1



Running the Project

All dbt commands should be run inside the banking_dbt directory:

dbt debug               # Validate Snowflake connection and dbt config
dbt run                 # Execute data transformation models
dbt test                # Run automated data quality tests
dbt docs generate       # Generate documentation site including data lineage graph
dbt docs serve          # Serve the documentation locally at http://localhost:8080


⸻

Development & Contribution Guidelines

Contributions and improvements are welcome! Please follow these guidelines:
	•	Use clear, descriptive commit messages following conventional commit standards.
	•	Write modular, maintainable, and well-documented dbt models.
	•	Add appropriate schema and data tests for any new transformations or model changes.
	•	Exclude any sensitive information such as passwords or personal data from commits.
	•	Follow consistent code formatting and PEP8 standards for any Python scripts or macros.
	•	Document architectural decisions and rationale to support team knowledge sharing.

⸻

Contact & Support

For questions, feature requests, or support, please open an issue or contact:

Eren Aktürk
Email: eren.ak@example.com
GitHub: erenaktuerk

⸻

License

This project is licensed under the MIT License. See the LICENSE file for details.

⸻

Empowering banking analytics through pragmatic, scalable, and maintainable data engineering solutions.

---