#!/bin/bash

# Check for existing environment directories
if [ -d "env" ]; then
  ENV_DIR="env"
elif [ -d "venv" ]; then
  ENV_DIR="venv"
elif [ -d ".env" ]; then
  ENV_DIR=".env"
elif [ -d ".venv" ]; then
  ENV_DIR=".venv"
else
  # Create a new virtual environment if none exist
  ENV_DIR="env"
  python3 -m venv $ENV_DIR
  echo "Created new virtual environment in $ENV_DIR"
fi

# Activate the virtual environment
source $ENV_DIR/bin/activate
echo "Activated virtual environment in $ENV_DIR"

# Install requirements if requirements.txt exists
if [ -f "requirements.txt" ]; then
  pip install -r requirements.txt
  echo "Installed packages from requirements.txt"
else
  echo "No requirements.txt file found"
fi
