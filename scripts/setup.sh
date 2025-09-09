#!/bin/bash

# HaldisB2B Development Foundation Setup Script
# This script initializes a new project using the HaldisB2B foundation template

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if we're in a git repository
if [ ! -d ".git" ]; then
    print_error "This script must be run from the root of a git repository"
    exit 1
fi

print_status "Setting up HaldisB2B Development Foundation..."

# Get project information
echo ""
read -p "Enter project name: " PROJECT_NAME
read -p "Enter project type (web-app/library/api/database/etc): " PROJECT_TYPE
read -p "Enter primary language: " PRIMARY_LANGUAGE
read -p "Enter framework (optional): " FRAMEWORK
read -p "Enter brief description: " DESCRIPTION

print_status "Configuring project: $PROJECT_NAME"

# Update CLAUDE.md with project-specific information
if [ -f "CLAUDE.md" ]; then
    print_status "Updating CLAUDE.md with project information..."
    
    # Create a temporary file with updated content
    sed "s/\[PROJECT_NAME\]/$PROJECT_NAME/g" CLAUDE.md > temp_claude.md
    sed -i.bak "s/\[web-app\/library\/api\/database\/etc\]/$PROJECT_TYPE/g" temp_claude.md
    sed -i.bak "s/\[language\]/$PRIMARY_LANGUAGE/g" temp_claude.md
    sed -i.bak "s/\[framework if applicable\]/$FRAMEWORK/g" temp_claude.md
    sed -i.bak "s/\[Brief description of what this project does and its key objectives\]/$DESCRIPTION/g" temp_claude.md
    
    # Replace the original file
    mv temp_claude.md CLAUDE.md
    rm -f temp_claude.md.bak
    
    print_success "CLAUDE.md updated successfully"
else
    print_warning "CLAUDE.md not found"
fi

# Update .spec-kit/config.json with project information
if [ -f ".spec-kit/config.json" ]; then
    print_status "Updating Spec-Kit configuration..."
    
    # Update project name and description in spec-kit config
    if command -v jq >/dev/null 2>&1; then
        jq --arg name "$PROJECT_NAME" --arg desc "$DESCRIPTION" \
           '.project.name = $name | .project.description = $desc' \
           .spec-kit/config.json > temp_config.json
        mv temp_config.json .spec-kit/config.json
        print_success "Spec-Kit configuration updated"
    else
        print_warning "jq not found. Please manually update .spec-kit/config.json"
    fi
else
    print_warning ".spec-kit/config.json not found"
fi

# Install Spec-Kit if not already installed
print_status "Checking Spec-Kit installation..."
if ! command -v spec-kit >/dev/null 2>&1; then
    print_status "Installing Spec-Kit..."
    npm install -g spec-kit
    print_success "Spec-Kit installed globally"
else
    print_success "Spec-Kit already installed"
fi

# Initialize Spec-Kit for this project
if [ -f ".spec-kit/config.json" ]; then
    print_status "Initializing Spec-Kit for project..."
    spec-kit init --config .spec-kit/config.json || print_warning "Spec-Kit initialization failed or already initialized"
fi

# Set up MCP servers configuration
print_status "Setting up MCP servers..."
if [ -f "MCP_SERVERS.json" ]; then
    echo ""
    echo "MCP servers configuration found. Available servers:"
    if command -v jq >/dev/null 2>&1; then
        jq -r '.mcpServers | keys[]' MCP_SERVERS.json
        echo ""
        echo "Recommended servers for $PROJECT_TYPE:"
        jq -r --arg type "$PROJECT_TYPE" '.project_type_recommendations[$type][]? // empty' MCP_SERVERS.json
    fi
    echo ""
    print_warning "Please review and configure MCP_SERVERS.json with your actual credentials"
    print_warning "Never commit API keys or sensitive credentials to version control"
else
    print_warning "MCP_SERVERS.json not found"
fi

# Set up git hooks (optional)
print_status "Setting up git hooks..."
mkdir -p .git/hooks

# Pre-commit hook for security checks
cat > .git/hooks/pre-commit << 'EOF'
#!/bin/bash
# HaldisB2B pre-commit hook

# Check for potential secrets
if git diff --cached --name-only | xargs grep -l "api_key\|secret\|password\|token" >/dev/null 2>&1; then
    echo "⚠️  WARNING: Potential secrets detected in staged files"
    echo "Please review and ensure no sensitive data is being committed"
    echo ""
    git diff --cached --name-only | xargs grep -n "api_key\|secret\|password\|token"
    echo ""
    read -p "Continue with commit? (y/N): " confirm
    if [[ $confirm != [yY] ]]; then
        echo "Commit aborted"
        exit 1
    fi
fi

# Run linting if available
if [ -f "package.json" ] && npm list --depth=0 eslint >/dev/null 2>&1; then
    npm run lint
fi

exit 0
EOF

chmod +x .git/hooks/pre-commit
print_success "Git hooks configured"

# Create initial directory structure
print_status "Creating project directory structure..."
mkdir -p src tests docs scripts .spec-kit/specs .spec-kit/tasks

# Create initial documentation
if [ ! -f "docs/README.md" ]; then
    cat > docs/README.md << EOF
# $PROJECT_NAME Documentation

## Overview

$DESCRIPTION

## Getting Started

[Add getting started instructions here]

## Architecture

[Add architecture documentation here]

## API Reference

[Add API documentation here]

## Development

See [CLAUDE.md](../CLAUDE.md) for development configuration and guidelines.

## Contributing

See [DEVELOPMENT_PHILOSOPHY.md](../DEVELOPMENT_PHILOSOPHY.md) for our development principles and contribution guidelines.
EOF
    print_success "Initial documentation created"
fi

# Create .gitignore if it doesn't exist
if [ ! -f ".gitignore" ]; then
    cat > .gitignore << EOF
# Dependencies
node_modules/
__pycache__/
*.pyc
target/
dist/
build/

# Environment variables
.env
.env.local
.env.*.local

# API keys and secrets
*.key
*.pem
config/secrets.json
MCP_SERVERS_LOCAL.json

# IDE files
.vscode/settings.json
.idea/
*.swp
*.swo

# OS files
.DS_Store
Thumbs.db

# Logs
logs/
*.log

# Temporary files
tmp/
temp/
*.tmp

# Coverage reports
coverage/
*.coverage
.nyc_output/

# Spec-Kit generated files (optional - uncomment to ignore)
# .spec-kit/generated/
EOF
    print_success ".gitignore created"
fi

# Final setup steps
print_status "Finalizing setup..."

# Update README.md with project-specific information
if [ -f "README.md" ]; then
    # Update the template README with actual project information
    sed -i.bak "s/HaldisB2B Development Foundation Template/$PROJECT_NAME/g" README.md
    sed -i.bak "1s/.*/# $PROJECT_NAME/" README.md
    rm -f README.md.bak
fi

print_success "Setup completed successfully!"
echo ""
echo "Next steps:"
echo "1. Review and update CLAUDE.md with project-specific settings"
echo "2. Configure MCP servers in MCP_SERVERS.json (add your credentials)"
echo "3. Create your first specification: 'spec-kit create spec'"
echo "4. Start development: Follow the Spec-Kit workflow"
echo ""
echo "Useful commands:"
echo "  spec-kit --help          # View Spec-Kit commands"
echo "  git status               # Check repository status"
echo "  npm install              # Install dependencies (if Node.js project)"
echo ""
print_warning "Remember to configure your actual API keys and credentials in MCP_SERVERS.json"
print_warning "Never commit sensitive credentials to version control"
EOF