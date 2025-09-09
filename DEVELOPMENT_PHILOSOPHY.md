# HaldisB2B Development Philosophy

**Guiding principles for all HaldisB2B projects**

## Core Principles

### 1. Specification-Driven Development (SDD)

**"Intent is the source of truth"**

- Start with clear specifications before writing code
- Use GitHub Spec-Kit for structured development phases
- Maintain living documentation that evolves with the project
- Specifications guide implementation, not the reverse

### 2. Research-Informed Decision Making

**"Deep analysis prevents costly mistakes"**

- Conduct thorough research before major architectural decisions
- Learn from existing solutions and their limitations
- Document findings in RESEARCH_FINDINGS.md for each project
- Use iterative research methodology with multiple enhancement cycles

### 3. AI-Assisted Development

**"Leverage AI for efficiency, not replacement of thinking"**

- Use Claude Code as a development partner, not a code generator
- Provide clear context and constraints to AI assistants
- Maintain human oversight of all AI-generated code
- Continuously refine AI interactions through better specifications

### 4. Security-First Architecture

**"Security is not an afterthought"**

- Design security considerations from project inception
- Never commit secrets or sensitive data to repositories
- Follow secure coding practices consistently
- Regularly audit dependencies for vulnerabilities

### 5. Iterative Enhancement

**"Continuous improvement through feedback loops"**

- Break complex projects into manageable iterations
- Gather feedback early and often
- Use Chain-of-Thought methodology for complex problem solving
- Set reasonable guardrails to prevent endless iteration cycles

## Development Methodology

### Phase 1: Research & Specification

1. **Deep Research**
   - Analyze existing solutions and their limitations
   - Study target audience needs and constraints
   - Research latest technologies and best practices
   - Document findings comprehensively

2. **Specification Creation**
   - Define project purpose and user experience
   - Outline technical requirements and constraints
   - Create measurable success criteria
   - Establish project boundaries and scope

### Phase 2: Planning & Architecture

1. **Technical Planning**
   - Design system architecture with scalability in mind
   - Choose appropriate technology stack
   - Plan for security, performance, and maintainability
   - Create detailed technical specifications

2. **Task Breakdown**
   - Decompose specifications into actionable tasks
   - Prioritize tasks by impact and dependencies
   - Estimate effort and timeline realistically
   - Plan for testing and quality assurance

### Phase 3: Implementation & Iteration

1. **AI-Assisted Development**
   - Use Claude Code with clear project context
   - Implement features following established patterns
   - Maintain high code quality standards
   - Write comprehensive tests alongside features

2. **Continuous Integration**
   - Regular code reviews and quality checks
   - Automated testing and deployment pipelines
   - Performance monitoring and optimization
   - Documentation updates with each iteration

## Quality Standards

### Code Quality

- **Readability**: Code should be self-documenting
- **Maintainability**: Favor clarity over cleverness
- **Consistency**: Follow established patterns and conventions
- **Performance**: Optimize for appropriate scale and usage

### Testing Standards

- **Unit Tests**: 80%+ code coverage
- **Integration Tests**: Cover critical user journeys
- **Performance Tests**: Validate scalability requirements
- **Security Tests**: Regular vulnerability assessments

### Documentation Standards

- **Living Documentation**: Keep docs current with code
- **Multiple Audiences**: Write for different expertise levels
- **Practical Examples**: Include working code samples
- **Decision Records**: Document architectural decisions and rationale

## Technology Preferences

### Language Preferences (in priority order)

1. **Rust**: For performance-critical systems and infrastructure
2. **TypeScript**: For web applications and APIs
3. **Python**: For data processing and machine learning
4. **Go**: For microservices and CLI tools

### Framework Preferences

- **Web**: Next.js, SvelteKit, or vanilla frameworks
- **API**: FastAPI, Express.js, or Axum
- **Database**: PostgreSQL, Redis, or specialized databases
- **Infrastructure**: Kubernetes, Docker, Terraform

### Tool Preferences

- **Version Control**: Git with conventional commits
- **CI/CD**: GitHub Actions or GitLab CI
- **Monitoring**: Prometheus, Grafana, or cloud-native solutions
- **Communication**: Async-first with clear documentation

## Collaboration Guidelines

### Team Communication

- **Async First**: Respect different time zones and work styles
- **Clear Context**: Provide background and requirements upfront
- **Decision Documentation**: Record important decisions and rationale
- **Regular Sync**: Scheduled check-ins for complex projects

### Code Review Process

- **Constructive Feedback**: Focus on improvement, not criticism
- **Knowledge Sharing**: Use reviews as learning opportunities
- **Standard Checklist**: Consistent review criteria across projects
- **Timely Response**: Reviews completed within 24-48 hours

### Knowledge Management

- **Documentation First**: Write it down before you forget
- **Searchable Knowledge**: Organized and easily discoverable
- **Regular Updates**: Keep information current and relevant
- **Multiple Formats**: Videos, diagrams, and written explanations

## Continuous Improvement

### Learning Culture

- **Experimentation**: Try new technologies and approaches
- **Failure Tolerance**: Learn from mistakes without blame
- **Knowledge Sharing**: Regular technical presentations and discussions
- **External Learning**: Conferences, courses, and industry engagement

### Process Evolution

- **Regular Retrospectives**: What worked, what didn't, what to improve
- **Metric-Driven Decisions**: Use data to guide process improvements
- **Template Updates**: Evolve this foundation based on experience
- **Industry Best Practices**: Stay current with development trends

---

**Last Updated**: September 2025  
**Version**: 1.0.0  
**Next Review**: December 2025