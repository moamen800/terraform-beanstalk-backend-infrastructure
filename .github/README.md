# CI/CD Setup

This directory contains CI/CD configuration for the Terraform Beanstalk Backend Infrastructure project.

## 📁 Project Structure

### GitHub Actions Workflows
- `terraform-ci.yml` - Main CI workflow for GitHub Actions with environment secrets
- `terraform.yml` - Full CI/CD pipeline (advanced deployment)

### Documentation
- `README.md` - This file
- `SECRETS.md` - Documentation for GitHub secrets and environment setup

## 🔧 Local Testing

Run tests locally before pushing to ensure quality:

```bash
# Run simple CI tests
./scripts/test-ci.sh

# Run full validation with security checks
./scripts/ci-validation.sh
```

## 🚀 GitHub Actions

### Trigger Events
The CI pipeline runs on:
- Push to `main` branch
- Pull requests to `main` branch

### Environment Configuration
- **Environment**: `terraform-beanstalk-secrets`
- **Required Secrets**: AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY, AWS_REGION

### Pipeline Steps

1. **Checkout** - Get repository code
2. **Setup Terraform** - Install Terraform v1.6.0
3. **Format Check** - Validate Terraform formatting
4. **Initialize** - Initialize Terraform (backend=false)
5. **Validate** - Validate Terraform configuration
6. **Test Plan** - Generate execution plan (with secrets)

## 📋 Project Configuration

### Git Ignore
The project includes a comprehensive `.gitignore` configuration:
- **Terraform**: State files, plans, variables
- **IDE**: VS Code, IntelliJ settings
- **OS**: macOS, Windows, Linux temp files
- **AWS**: Credentials, keys, certificates
- **vprofile-project**: Excluded as embedded repository

### Security
- Secrets managed through GitHub Environments
- AWS credentials stored securely
- Terraform state files ignored from version control
- SSH keys and certificates excluded

## ✅ Status

- ✅ Terraform format check
- ✅ Terraform validation  
- ✅ Basic security scan
- ✅ Structure validation
- ✅ Environment secrets integration
- ✅ Modular architecture

## 🎯 Next Steps

1. **Local Testing**: `./scripts/test-ci.sh`
2. **Configure Secrets**: Set up GitHub environment secrets
3. **Push Changes**: Trigger CI pipeline
4. **Review Results**: Check GitHub Actions tab
5. **Deploy**: Run `terraform apply` after validation
