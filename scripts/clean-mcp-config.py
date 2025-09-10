#!/usr/bin/env python3

import json
import os
import shutil
from datetime import datetime

# Configuration paths
CLAUDE_CONFIG_PATH = "/Users/peter/.claude.json"
BACKUP_PATH = f"/Users/peter/.claude.json.backup.{datetime.now().strftime('%Y%m%d_%H%M%S')}"

# Problematic servers to remove
PROBLEMATIC_SERVERS = [
    "code-to-tree",
    "mobile-mcp", 
    "manim",
    "desktop-commander"
]

# Essential servers to keep/add
ESSENTIAL_SERVERS = {
    "github": {
        "command": "npx",
        "args": ["-y", "@modelcontextprotocol/server-github"],
        "env": {
            "GITHUB_PERSONAL_ACCESS_TOKEN": "YOUR_GITHUB_TOKEN_HERE"
        }
    },
    "filesystem": {
        "command": "npx", 
        "args": ["-y", "@modelcontextprotocol/server-filesystem", "/Users/peter"]
    },
    "nodejs-sandbox": {
        "command": "npx",
        "args": ["-y", "@modelcontextprotocol/server-nodejs-sandbox"]
    }
}

def clean_mcp_configuration():
    print("🔧 Cleaning MCP Server Configuration...")
    
    # Backup current config
    if os.path.exists(CLAUDE_CONFIG_PATH):
        shutil.copy2(CLAUDE_CONFIG_PATH, BACKUP_PATH)
        print(f"✅ Backup created: {BACKUP_PATH}")
    
    # Load current configuration
    with open(CLAUDE_CONFIG_PATH, 'r') as f:
        config = json.load(f)
    
    # Clean global MCP servers
    if 'global' in config and 'mcpServers' in config['global']:
        print("🧹 Removing problematic global MCP servers...")
        for server in PROBLEMATIC_SERVERS:
            if server in config['global']['mcpServers']:
                del config['global']['mcpServers'][server]
                print(f"  ❌ Removed: {server}")
        
        # Add essential servers
        print("➕ Adding essential MCP servers...")
        for name, server_config in ESSENTIAL_SERVERS.items():
            config['global']['mcpServers'][name] = server_config
            print(f"  ✅ Added: {name}")
    
    # Clean project-specific configurations
    if 'projects' in config:
        for project_path, project_config in config['projects'].items():
            if 'mcpServers' in project_config:
                print(f"🧹 Cleaning project config: {project_path}")
                for server in PROBLEMATIC_SERVERS:
                    if server in project_config['mcpServers']:
                        del project_config['mcpServers'][server]
                        print(f"  ❌ Removed from {project_path}: {server}")
    
    # Save cleaned configuration
    with open(CLAUDE_CONFIG_PATH, 'w') as f:
        json.dump(config, f, indent=2)
    
    print("✅ MCP configuration cleaned successfully!")
    print("")
    print("Summary:")
    print("  ❌ Removed: code-to-tree, mobile-mcp, manim, desktop-commander")
    print("  ✅ Configured: github, filesystem, nodejs-sandbox")
    print("")
    print("Next steps:")
    print("  1. Run: claude /mcp")
    print("  2. Verify servers are connected")
    print("  3. Test with a simple command")

if __name__ == "__main__":
    clean_mcp_configuration()