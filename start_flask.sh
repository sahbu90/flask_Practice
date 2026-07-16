#!/bin/bash

echo "========== Deploying Flask Application =========="

# Go to Jenkins workspace
cd "$WORKSPACE" || exit 1

# Activate virtual environment
source venv/bin/activate

# Stop old Flask process (if running)
pkill -f "python.*app.py" || true

# Start Flask app in background
nohup python app.py > flask.log 2>&1 &

sleep 5

echo "========== Deployment Successful =========="
