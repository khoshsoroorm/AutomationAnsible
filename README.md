
Ansible Project Initializer

A simple yet powerful bash script to automate the creation of a standardized Ansible project and role structure. This script prompts for a project name and scaffolds the necessary directories and boilerplate files, getting you ready to write automation in seconds.

► Features

    Dynamic Project Scaffolding: Creates a complete project structure based on the name you provide.

    Standard Role Architecture: Generates the standard Ansible role directory layout (tasks, handlers, vars, templates, etc.).

    Boilerplate File Creation: Creates empty main.yml files in each role directory, along with a main playbook and an inventory file.

    Dependency Checking: Automatically checks if the tree utility is installed and, if not, attempts to install it for easy verification.

    User-Friendly: Interactive prompt and clear, step-by-step feedback during execution.

► Prerequisites

Before running the script, ensure you have the following:

    A Linux-based operating system.

    Sudo privileges are required to install the tree utility if it's not already present.

    The script uses yum for package installation, making it ideal for RHEL, CentOS, or Fedora.

        For Debian/Ubuntu-based systems, you may need to manually change the package manager command from yum to apt-get.

► Usage

Getting started is simple. Just follow these steps:

    Clone the repository:
    Bash

git clone https://your-repository-url.git
cd your-repository-directory

Make the script executable:
Bash

chmod +x setup_ansible_project.sh

Run the script:
Bash

    ./setup_ansible_project.sh

    The script will then prompt you to enter your desired project name.

► Example Output

After running the script and entering my_new_automation as the project name, you will see the following directory structure created under ~/ansible_projects/:

/home/user/ansible_projects/my_new_automation
├── inventory
│   └── hosts
├── my_new_automation.yml
└── roles
    └── my_new_automation
        ├── defaults
        │   └── main.yml
        ├── files
        ├── handlers
        │   └── main.yml
        ├── meta
        │   └── main.yml
        ├── tasks
        │   └── main.yml
        ├── templates
        └── vars
            └── main.yml

10 directories, 7 files

► License

This project is licensed under the MIT License. See the LICENSE file for details.
