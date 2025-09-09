# Claude Code Configuration

**Project-specific settings for AI-assisted development**

## Project Context

<!-- Update this section for each project -->
**Project Name**: [PROJECT_NAME]  
**Project Type**: [web-app/library/api/database/etc]  
**Primary Language**: [language]  
**Framework**: [framework if applicable]  

**Project Description**: 
[Brief description of what this project does and its key objectives]

## Development Philosophy

This project follows HaldisB2B's specification-driven development approach:

1. **Research First**: Deep analysis of domain and existing solutions
2. **Specify Intent**: Clear specifications before implementation
3. **Plan Architecture**: Technical design with constraints and requirements  
4. **Task Breakdown**: Actionable, testable implementation tasks
5. **AI-Assisted Implementation**: Use Claude Code for efficient development

## Claude Code Instructions

### Project Standards

**Code Style**: 
- Follow existing patterns in the codebase
- Use consistent naming conventions
- Prioritize readability and maintainability
- Include comprehensive error handling

**Security Requirements**:
- Never expose secrets or API keys
- Follow secure coding practices
- Validate all inputs
- Use parameterized queries for database operations

**Testing Standards**:
- Write unit tests for new functionality
- Maintain test coverage above 80%
- Include integration tests for API endpoints
- Test error conditions and edge cases

### Preferred Technology Stack

**Languages**: [List preferred languages in order]
**Frameworks**: [List frameworks and versions]
**Databases**: [List database preferences]
**Tools**: [List development tools and utilities]

### Commands to Run

**Setup**: 
```bash
# Initial project setup
[setup commands]
```

**Development**:
```bash
# Start development server
[dev server command]

# Run tests
[test command]

# Type checking
[typecheck command]

# Linting
[lint command]
```

**Build & Deploy**:
```bash
# Build for production
[build command]

# Deploy
[deploy command]
```

### MCP Servers

**Recommended MCP Servers for this project**:
- [List relevant MCP servers for the project type]
- [Include configuration instructions]

### File Structure Conventions

```
project-root/
├── src/                    # Source code
├── tests/                  # Test files
├── docs/                   # Documentation
├── scripts/                # Utility scripts
├── .spec-kit/             # Specification files
├── RESEARCH_FINDINGS.md   # Research documentation
└── CLAUDE.md              # This file
```

### Common Patterns

**API Routes**: [Describe API routing patterns]
**Component Structure**: [Describe component organization]
**State Management**: [Describe state management approach]
**Error Handling**: [Describe error handling patterns]

### Project-Specific Instructions

<!-- Add any project-specific instructions here -->

### Important Notes

- Always check existing code patterns before implementing new features
- Use the project's existing dependency management approach
- Follow the established testing patterns
- Refer to RESEARCH_FINDINGS.md for technical decisions and rationale

### Useful Resources

- [Link to project documentation]
- [Link to API documentation]
- [Link to design system/style guide]
- [Link to deployment instructions]

---

**Last Updated**: [Date]  
**Claude Code Version**: [Version when last tested]