# Agentic Boiler Governance Delta

## ADDED Requirements

### Requirement: The roadmap command reuses prior context when no parameter is supplied

The canonical `/roadmap` command MUST use the immediately preceding user request as its capability context
when invoked without a parameter. Explicit user arguments MUST override prior conversational context. The
command MUST still inspect repository state and ask one concise question when phase position or dependencies
remain genuinely ambiguous.

#### Scenario: Empty roadmap invocation continues the prior request

- GIVEN the preceding user request describes a concrete repository capability
- WHEN the contributor invokes `/roadmap` without a parameter
- THEN the command uses that request as the capability description
- AND it determines phase position and dependencies from the request and repository evidence when possible

#### Scenario: Explicit roadmap arguments override prior context

- GIVEN the preceding conversation discusses one capability
- WHEN the contributor invokes `/roadmap` with a different explicit capability parameter
- THEN the command uses the explicit parameter
- AND it does not silently substitute the earlier conversation
