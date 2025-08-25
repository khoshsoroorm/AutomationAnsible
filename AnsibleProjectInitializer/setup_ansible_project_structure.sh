#!/bin/bash

# ==============================================================================
# Script Name: setup_ansible_project.sh
# Description: This script sets up a standard Ansible project and role
#              directory structure. It prompts for a project name, creates
#              the necessary directories and files, and installs the 'tree'
#              utility for verification.
# Author:      Gemini
# ==============================================================================

# --- Prompt for Project Name ---
# Ask the user for a project name and store it in the PROJECT_NAME variable.
read -p "Please enter your Ansible project name: " PROJECT_NAME

# Check if the project name is empty. If it is, print an error and exit.
if [ -z "$PROJECT_NAME" ]; then
    echo "Error: Project name cannot be empty. Aborting."
    exit 1
fi

# --- Define Project Paths ---
# Define the base directory inside the user's home folder.
# All projects will be created under ~/ansible_projects/
BASE_DIR="$HOME/ansible_projects/$PROJECT_NAME"
# Define the path for the role, which will have the same name as the project.
ROLE_DIR="$BASE_DIR/roles/$PROJECT_NAME"

echo
echo "--- Starting Ansible Project Setup for '$PROJECT_NAME' ---"
echo "Project will be created in: $BASE_DIR"
echo

# --- Create Directory Structure ---
# Create the main project directories and the standard role sub-directories.
# The '-p' flag ensures that parent directories are created if they don't exist.
echo "[1/4] Creating project and role directories..."
mkdir -p "$ROLE_DIR"/{files,vars,defaults,templates,handlers,tasks,meta}
mkdir -p "$BASE_DIR"/inventory
echo "Directories created successfully."
echo

# --- Create Initial Files ---
# Create the main playbook file and the default main.yml files for the role.
# 'touch' creates empty files if they do not already exist.
echo "[2/4] Creating initial playbook and role files..."
touch "$BASE_DIR/$PROJECT_NAME.yml"
touch "$ROLE_DIR"/{defaults,handlers,meta,tasks,vars}/main.yml
touch "$BASE_DIR"/inventory/hosts
echo "Files created successfully."
echo

# --- Install 'tree' Utility ---
# Check if the 'tree' command is available. If not, install it.
echo "[3/4] Checking for 'tree' utility..."
if ! command -v tree &> /dev/null; then
    echo "'tree' command not found. Attempting to install it..."
    # This command requires superuser (sudo) privileges.
    # The '-y' flag automatically answers 'yes' to any confirmation prompts.
    # Note: This uses 'yum'. For Debian/Ubuntu, you would use 'sudo apt-get install -y tree'.
    sudo yum install -y tree
else
    echo "'tree' is already installed."
fi
echo

# --- Display Final Structure ---
# Run the 'tree' command on the base directory to show the final structure.
echo "[4/4] Displaying the final project structure:"
tree "$BASE_DIR"
echo
echo "--- Ansible project '$PROJECT_NAME' created successfully! ---"
