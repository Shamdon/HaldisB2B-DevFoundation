# HaldisB2B Development Foundation Template

**Organizational standard template for all HaldisB2B projects**

This template repository provides a standardized foundation for all HaldisB2B projects, incorporating:

- 🔧 **Spec-Kit Integration**: GitHub's specification-driven development toolkit
- 🤖 **Claude Code Ready**: Pre-configured for AI-assisted development
- 📋 **Standardized Workflows**: Consistent CI/CD and development practices
- 🔒 **Security Standards**: Enterprise-grade security configurations
- 📊 **MCP Server Integration**: Model Context Protocol server configurations

## Quick Start

1. **Use this template** to create a new repository
2. **Run setup**: `./scripts/setup.sh`
3. **Initialize Spec-Kit**: `spec-kit init`
4. **Configure Claude Code**: Review `CLAUDE.md` for project-specific settings

## Template Contents

### Core Files
- `CLAUDE.md` - Claude Code project configuration
- `DEVELOPMENT_PHILOSOPHY.md` - HaldisB2B development principles
- `RESEARCH_TEMPLATE.md` - Standardized research methodology

### Spec-Kit Integration
- `.spec-kit/` - Specification-driven development configuration
- `specs/` - Project specifications directory
- `tasks/` - Implementation task breakdown

### GitHub Workflows
- `.github/workflows/` - Standard CI/CD pipelines
- `.github/ISSUE_TEMPLATE/` - Spec-Kit integrated issue templates
- `.github/PULL_REQUEST_TEMPLATE.md` - Standardized PR template

### Development Tools
- `MCP_SERVERS.json` - Recommended MCP server configurations
- `scripts/` - Setup and utility scripts
- `docs/` - Documentation templates

## Development Philosophy

This template embodies HaldisB2B's core development principles:

1. **Specification-Driven Development**: Intent is the source of truth
2. **AI-Assisted Implementation**: Leverage Claude Code for efficient development
3. **Research-Informed Decisions**: Deep analysis before implementation
4. **Security-First Architecture**: Built-in security considerations
5. **Iterative Enhancement**: Continuous improvement through feedback

## Usage Instructions

### For New Projects
```bash
# Create new project using this template
gh repo create my-new-project --template Shamdon/HaldisB2B-DevFoundation

# Setup development environment
cd my-new-project
./scripts/setup.sh

# Initialize project specifications
spec-kit init
```

### For Existing Projects
```bash
# Add template components to existing project
curl -sSL https://raw.githubusercontent.com/Shamdon/HaldisB2B-DevFoundation/main/scripts/retrofit.sh | bash
```

## Contributing

This template is continuously improved based on lessons learned across HaldisB2B projects. 

To suggest improvements:
1. Open an issue with the `template-enhancement` label
2. Describe the improvement and its benefits
3. Include examples from actual projects where applicable

---

**Maintained by**: HaldisB2B Development Team  
**Last Updated**: September 2025  
**Template Version**: 1.0.0