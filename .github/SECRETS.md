# GitHub Secrets Setup Guide

## Required Secrets

To run the CI/CD pipeline, you need to set up the following GitHub secrets:

### AWS Credentials
- `AWS_ACCESS_KEY_ID` - Your AWS Access Key ID
- `AWS_SECRET_ACCESS_KEY` - Your AWS Secret Access Key  
- `AWS_REGION` - AWS region (e.g., `eu-north-1`)

## How to Add Secrets

1. Go to your GitHub repository
2. Click on **Settings** tab
3. Click on **Secrets and variables** → **Actions**
4. Click **New repository secret**
5. Add each secret with the exact name and value

## Example Values

```
AWS_ACCESS_KEY_ID=AKIAIOSFODNN7EXAMPLE
AWS_SECRET_ACCESS_KEY=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
AWS_REGION=eu-north-1
```

## Testing

After adding secrets, push a commit to trigger the CI pipeline:

```bash
git add .
git commit -m "test: trigger CI pipeline"
git push origin terraform-project
```

## Security Notes

- Never commit these values to your repository
- Use strong, unique passwords
- Rotate credentials regularly
- Monitor AWS CloudTrail for access logs
