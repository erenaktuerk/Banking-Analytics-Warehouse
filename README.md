# Banking Analytics Warehouse

## Overview

This repository contains a robust, scalable data warehouse solution for banking analytics, leveraging *Snowflake* as the cloud data platform and *dbt (data build tool)* for modular, maintainable, and version-controlled data transformations.

The project architecture follows best practices in modern data engineering and analytics, providing a clean, extensible foundation for credit risk analysis, compliance monitoring, and other critical banking use cases.

---

## Key Features

- **Cloud-native architecture:** Fully designed to run on Snowflake, enabling high performance, elasticity, and secure data storage.
- **Modular transformation pipelines:** dbt models structured to enforce data quality, reusability, and easy collaboration.
- **Configurable environment:** Profiles and project configurations tailored for seamless development and deployment workflows.
- **Automated testing & validation:** Schema and data tests embedded within dbt models to ensure accuracy and reliability.
- **Version control:** Git-based code management with clean commit history for auditability and team coordination.
- **Documentation:** Auto-generated, up-to-date data lineage and model documentation via dbt docs.

---

## Repository Structure

.
├── banking_dbt/                 # dbt project folder
│   ├── models/                  # dbt transformation models (SQL)
│   ├── macros/                  # reusable SQL macros
│   ├── tests/                   # custom data tests
│   ├── dbt_project.yml          # dbt project configuration
├── data/                       # raw and processed data (excluded from repo)
├── docs/                       # project documentation and diagrams
├── requirements.txt            # Python dependencies
├── README.md                   # Project overview and instructions
├── .gitignore                  # Ignored files for Git
└── profiles.yml (excluded)     # dbt connection profiles (local only)

---

## Setup & Usage

### Prerequisites

- Snowflake account with appropriate permissions
- Python 3.10+
- dbt version 1.9.x installed in a virtual environment
- Git for version control

### Installation

1. Clone the repository:

   ```bash
   git clone <repo-url>
   cd Banking-Analytics-Warehouse

	2.	Create and activate your Python virtual environment:

python -m venv venv
.\venv\Scripts\activate  # Windows
source venv/bin/activate # macOS/Linux


	3.	Install dependencies:

pip install -r requirements.txt


	4.	Configure your Snowflake connection in ~/.dbt/profiles.yml (excluded from repo):

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



Running dbt

Run the following commands inside the banking_dbt directory:

dbt debug               # Validate connection and config
dbt run                 # Execute data transformations
dbt test                # Run data quality tests
dbt docs generate       # Generate documentation site
dbt docs serve          # Serve documentation locally


⸻

Contribution Guidelines

Contributions are welcome! Please adhere to the following:
	•	Use descriptive commit messages following conventional commits.
	•	Write modular and well-documented dbt models.
	•	Add tests for any new transformations or schema changes.
	•	Keep sensitive information (e.g., credentials) out of the repository.
	•	Follow PEP8 for any Python code and maintain consistent formatting.

⸻

Contact & Support

For questions or support, please open an issue or contact:

Eren Aktürk
Email: eren.ak@example.com
GitHub: erenaktuerk

⸻

License

This project is licensed under the MIT License - see the LICENSE file for details.

⸻

Empowering banking analytics through modern, scalable, and maintainable data engineering