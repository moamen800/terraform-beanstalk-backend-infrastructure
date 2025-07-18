#!/bin/bash

# Simple Terraform CI test script
# Run this locally to test your changes

echo "🚀 Running Terraform CI tests..."

cd terraform

# Test 1: Format check
echo "📝 Checking format..."
if terraform fmt -check; then
    echo "✅ Format check passed"
else
    echo "❌ Format check failed"
    exit 1
fi

# Test 2: Init
echo "⚙️  Initializing..."
if terraform init -backend=false; then
    echo "✅ Init successful"
else
    echo "❌ Init failed"
    exit 1
fi

# Test 3: Validate
echo "✅ Validating..."
if terraform validate; then
    echo "✅ Validation successful"
else
    echo "❌ Validation failed"
    exit 1
fi

echo "🎉 All tests passed!"
echo "Ready to push to GitHub!"
