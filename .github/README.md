# CI/CD Setup

This directory contains CI/CD configuration for the Terraform project.

## Files

- `terraform-ci.yml` - Main CI workflow for GitHub Actions
- `terraform.yml` - Full CI/CD pipeline (advanced)

## Local Testing

Run tests locally before pushing:

```bash
# Run simple CI tests
./scripts/test-ci.sh

# Run full validation
./scripts/ci-validation.sh
```

## GitHub Actions

The CI pipeline runs on:
- Push to `terraform-project` or `main` branches
- Pull requests to `terraform-project` or `main` branches

### Pipeline Steps

1. **Validate** - Format, init, and validate Terraform
2. **Quality** - Check structure and security
3. **Summary** - Display results

### Setup

1. Enable GitHub Actions in your repository
2. Push to trigger the pipeline
3. View results in the Actions tab

## Status

- ✅ Terraform format check
- ✅ Terraform validation
- ✅ Basic security scan
- ✅ Structure validation

## Next Steps

1. Test locally: `./scripts/test-ci.sh`
2. Push changes to trigger CI
3. Review results in GitHub Actions
4. Merge when all checks pass
