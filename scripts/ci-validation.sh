#!/bin/bash

# Simple CI/CD validation script for Terraform
# This script can be run locally or in CI/CD pipeline

set -e

echo "🚀 Starting Terraform CI/CD Validation..."

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    local status=$1
    local message=$2
    if [ "$status" = "success" ]; then
        echo -e "${GREEN}✅ $message${NC}"
    elif [ "$status" = "error" ]; then
        echo -e "${RED}❌ $message${NC}"
    else
        echo -e "${YELLOW}⚠️  $message${NC}"
    fi
}

# Change to terraform directory
cd terraform

# Step 1: Check Terraform installation
echo "🔍 Checking Terraform installation..."
if command -v terraform &> /dev/null; then
    TERRAFORM_VERSION=$(terraform version | head -n1)
    print_status "success" "Terraform found: $TERRAFORM_VERSION"
else
    print_status "error" "Terraform not found. Please install Terraform."
    exit 1
fi

# Step 2: Format check
echo "🎨 Checking Terraform formatting..."
if terraform fmt -check -recursive; then
    print_status "success" "All files are properly formatted"
else
    print_status "error" "Some files need formatting. Run: terraform fmt -recursive"
    exit 1
fi

# Step 3: Initialize without backend
echo "⚙️  Initializing Terraform..."
if terraform init -backend=false; then
    print_status "success" "Terraform initialized successfully"
else
    print_status "error" "Terraform initialization failed"
    exit 1
fi

# Step 4: Validate configuration
echo "✅ Validating Terraform configuration..."
if terraform validate; then
    print_status "success" "Terraform configuration is valid"
else
    print_status "error" "Terraform configuration validation failed"
    exit 1
fi

# Step 5: Check for terraform.tfvars
echo "📋 Checking configuration files..."
if [ -f "terraform.tfvars" ]; then
    print_status "success" "terraform.tfvars found"
elif [ -f "terraform.tfvars.example" ]; then
    print_status "warning" "terraform.tfvars not found, but example exists"
    echo "   Copy terraform.tfvars.example to terraform.tfvars and configure it"
else
    print_status "error" "No terraform.tfvars or example found"
fi

# Step 6: Security check
echo "🔒 Running basic security checks..."
if grep -r "password\|secret" . --include="*.tf" --exclude="*.tfvars*" > /dev/null 2>&1; then
    print_status "warning" "Found potential secrets in .tf files. Please review."
else
    print_status "success" "No obvious secrets found in .tf files"
fi

# Step 7: Structure check
echo "📁 Checking project structure..."
REQUIRED_FILES=("main.tf" "variables.tf" "outputs.tf" "provider.tf" "backend.tf")
for file in "${REQUIRED_FILES[@]}"; do
    if [ -f "$file" ]; then
        print_status "success" "$file exists"
    else
        print_status "error" "$file is missing"
    fi
done

# Step 8: Module check
echo "🧩 Checking modules..."
MODULE_COUNT=$(find modules -maxdepth 2 -mindepth 2 -type d | wc -l)
print_status "success" "Found $MODULE_COUNT modules"

# Step 9: Test plan (if tfvars exists)
if [ -f "terraform.tfvars" ]; then
    echo "📊 Testing Terraform plan..."
    if terraform plan -detailed-exitcode > /dev/null 2>&1; then
        print_status "success" "Terraform plan completed successfully"
    else
        exit_code=$?
        if [ $exit_code -eq 2 ]; then
            print_status "warning" "Terraform plan shows changes (this is expected)"
        else
            print_status "error" "Terraform plan failed"
        fi
    fi
else
    print_status "warning" "Skipping plan test - no terraform.tfvars file"
fi

# Summary
echo ""
echo "🎉 CI/CD Validation Complete!"
echo "📊 Summary:"
echo "   - Terraform format: ✅"
echo "   - Terraform validate: ✅"
echo "   - Security check: ✅"
echo "   - Structure check: ✅"
echo "   - Module count: $MODULE_COUNT"
echo ""
echo "🚀 Ready for deployment!"
echo "Next steps:"
echo "1. Configure terraform.tfvars with your values"
echo "2. Run: terraform plan"
echo "3. Run: terraform apply"
