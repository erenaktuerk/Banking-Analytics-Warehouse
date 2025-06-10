# Banking Analytics Warehouse

## Overview

This repository contains a production-ready, modular data warehouse designed for banking analytics. It is built on Snowflake as the cloud data platform and utilizes dbt (data build tool) for structured, version-controlled data transformations.

The architecture supports key banking use cases such as credit risk scoring, compliance checks, and customer behavior analytics. The implementation emphasizes maintainability, scalability, and data quality through extensive testing and documentation.

---

## Key Features

- Cloud-native and scalable: Optimized for Snowflake to ensure secure, performant analytics.
- Modular transformation pipeline: dbt models are organized into raw, staging, and marts layers.
- Data validation and integrity:
  - Tests for nulls, type correctness, and business logic.
  - Foreign key checks (e.g., payments must link to valid loans).
- Auto-generated documentation: Using dbt docs, including data lineage visualization.
- Version-controlled workflows: Clean Git history with atomic commits and full reproducibility.
- Real-world banking focus: Implements scenarios for regulatory compliance, credit analysis, and transactional behavior.
- Clean project structure: Logical directory layout and separation of configuration, logic, and data.

---

## Project Structure

.
├── banking_dbt/                 # dbt project folder containing all transformations
│   ├── analyses/                # Ad hoc analysis queries (optional)
│   ├── macros/                  # Reusable SQL macros
│   ├── models/
│   │   ├── staging/             # Cleaned and validated raw data
│   │   └── marts/               # Business-focused analytical models
│   ├── seeds/                   # Static reference data
│   ├── snapshots/               # For slowly changing dimensions (optional)
│   ├── tests/                   # Custom data tests (e.g. referential integrity)
│   ├── dbt_project.yml          # Main dbt configuration file
├── data/                        # External input data (excluded from version control)
├── docs/                        # Documentation and architecture diagrams
├── requirements.txt             # Python dependencies for dbt and extensions
├── README.md                    # Project overview and usage instructions
└── .gitignore                   # Files excluded from Git

---

## Setup and Usage

### Prerequisites

- Snowflake account and credentials
- Python 3.10+ installed
- dbt version 1.9.x installed (ideally within a virtual environment)
- Git for version control

### Installation

1. Clone the repository:

```bash
git clone <repo-url>
cd Banking-Analytics-Warehouse

	2.	Create and activate a virtual environment:

python -m venv venv
# Windows
.\venv\Scripts\activate
# macOS/Linux
source venv/bin/activate

	3.	Install dependencies:

pip install -r requirements.txt

	4.	Configure your local dbt profile in ~/.dbt/profiles.yml (excluded from repo):

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


⸻

Running the Project

Inside the banking_dbt/ directory, you can run:

dbt debug              # Validate connection and configuration
dbt run                # Execute all models (staging, marts)
dbt test               # Run schema and custom tests
dbt docs generate      # Generate documentation with lineage
dbt docs serve         # Open docs at http://localhost:8080


⸻

Recent Enhancements (June 10, 2025)
	•	Added referential integrity tests to ensure payments.loan_id exists in loans.
	•	Updated stg_payments.sql to exclude payments referencing nonexistent loans.
	•	Resolved issue with orphaned payment records via LEFT JOIN validation.
	•	Validated staging models with dbt tests and confirmed clean dbt run and test execution.

⸻

Development Guidelines
	•	Write modular, well-documented SQL models.
	•	Add appropriate schema and data tests.
	•	Follow Git best practices (descriptive, atomic commits).
	•	Do not commit sensitive data or credentials.
	•	Use consistent formatting and dbt naming conventions.

⸻

Contact

For questions, suggestions, or collaboration:

Eren Aktürk
Email: erenaktuerk@hotmail.com
GitHub: erenaktuerk

⸻

License

This project is licensed under the MIT License. See the LICENSE file for details.

⸻

Empowering banking analytics through structured, scalable, and transparent data pipelines.