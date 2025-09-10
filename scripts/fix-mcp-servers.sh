#!/bin/bash

# Fix MCP Server Configuration Script
# Removes problematic servers and configures working ones

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

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

print_status "🔧 Fixing MCP Server Configuration..."
echo ""

# Check if we have a GitHub token
read -p "Enter your GitHub Personal Access Token (or press Enter to skip): " GITHUB_TOKEN

if [ -z "$GITHUB_TOKEN" ]; then
    print_warning "No GitHub token provided. You'll need to configure this later."
    GITHUB_TOKEN="YOUR_GITHUB_TOKEN"
fi

# Backup current configuration
if [ -f "/Users/peter/.claude.json" ]; then
    print_status "Backing up current Claude configuration..."
    cp /Users/peter/.claude.json /Users/peter/.claude.json.backup.$(date +%Y%m%d_%H%M%S)
    print_success "Backup created"
fi

print_status "Removing problematic MCP servers..."

# List of problematic servers to remove
PROBLEMATIC_SERVERS=(
    "code-to-tree"
    "mobile-mcp" 
    "manim"
    "desktop-commander"
)

for server in "${PROBLEMATIC_SERVERS[@]}"; do
    print_status "Removing $server..."
    # Use Claude CLI to remove the server
    claude config remove mcp.servers.$server 2>/dev/null || true
done

print_success "Problematic servers removed"

print_status "Configuring essential MCP servers..."

# Configure GitHub server (most important)
print_status "Setting up GitHub MCP server..."
claude config set mcp.servers.github.command "npx"
claude config set mcp.servers.github.args '["-y", "@modelcontextprotocol/server-github"]'
if [ "$GITHUB_TOKEN" != "YOUR_GITHUB_TOKEN" ]; then
    claude config set mcp.servers.github.env.GITHUB_PERSONAL_ACCESS_TOKEN "$GITHUB_TOKEN"
fi

# Configure filesystem server
print_status "Setting up filesystem MCP server..."
claude config set mcp.servers.filesystem.command "npx"
claude config set mcp.servers.filesystem.args '["-y", "@modelcontextprotocol/server-filesystem", "/Users/peter"]'

# Configure nodejs-sandbox (useful for development)
print_status "Setting up nodejs-sandbox MCP server..."
claude config set mcp.servers.nodejs-sandbox.command "npx"
claude config set mcp.servers.nodejs-sandbox.args '["-y", "@modelcontextprotocol/server-nodejs-sandbox"]'

print_success "Essential MCP servers configured"

print_status "Testing MCP server connections..."

# Test the servers
echo ""
print_status "Testing GitHub server..."
if claude mcp test github 2>/dev/null; then
    print_success "✅ GitHub server: Connected"
else
    print_warning "⚠️ GitHub server: Check your token configuration"
fi

print_status "Testing filesystem server..."
if claude mcp test filesystem 2>/dev/null; then
    print_success "✅ Filesystem server: Connected"
else
    print_warning "⚠️ Filesystem server: May need permission adjustment"
fi

print_status "Testing nodejs-sandbox server..."
if claude mcp test nodejs-sandbox 2>/dev/null; then
    print_success "✅ Node.js sandbox server: Connected"
else
    print_warning "⚠️ Node.js sandbox server: Check Node.js installation"
fi

echo ""
print_success "🎉 MCP server cleanup completed!"
echo ""
echo "Summary:"
echo "✅ Removed problematic servers (code-to-tree, mobile-mcp, manim, desktop-commander)"
echo "✅ Configured essential servers (github, filesystem, nodejs-sandbox)"
echo "✅ Created backup of previous configuration"
echo ""
echo "Next steps:"
if [ "$GITHUB_TOKEN" = "YOUR_GITHUB_TOKEN" ]; then
    echo "1. Configure your GitHub token: claude config set mcp.servers.github.env.GITHUB_PERSONAL_ACCESS_TOKEN YOUR_TOKEN"
fi
echo "2. Test with: claude /mcp"
echo "3. Check logs if any issues: claude --debug"
echo ""
print_warning "Note: Restart Claude Code if servers don't appear immediately connected"