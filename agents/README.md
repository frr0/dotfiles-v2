# AI Agents & MCP Configuration

Configurations and skills for Google Antigravity and AI Agent runtimes.

## Managed Configurations

- **`mcp_config.json`**: Global Model Context Protocol (MCP) server definitions.
- **`settings.json.example`**: Reference template for Antigravity settings (`~/.gemini/settings.json`).
- **`skills/`**: Curated, reusable agent skills:
  - `agent-orchestrator`: Multi-agent orchestration and task convergence.
  - `clean-git`: Git version control management with clean branches and semantic commits.
  - `code-reviewer`: Static analysis, type checking, and automated security audit before delivery.
  - `tdd-workflow`: Test-Driven Development workflow enforcement.
  - `team-lead`: High-level task breakdown and execution coordination.

## Security & Token Management

MCP servers often require sensitive authentication tokens (e.g., GitHub Personal Access Tokens, Obsidian Local REST API tokens). To ensure security:

1. **Tokens are Redacted in Git**:
   - `GITHUB_PERSONAL_ACCESS_TOKEN` is set to `INSERISCI_QUI_IL_TUO_TOKEN_GITHUB_GRATUITO`.
   - `OBSIDIAN_API_TOKEN` is set to `Bearer INSERISCI_QUI_IL_TUO_TOKEN_OBSIDIAN`.

2. **Active Secrets Location**:
   - Antigravity reads its active configuration and secrets from `~/.gemini/settings.json`.
   - `~/.gemini/settings.json` and credentials (`oauth_creds.json`, tokens) remain strictly local and are never tracked in Git.

3. **Setting Up on a New Machine**:
   - Copy `agents/settings.json.example` to `~/.gemini/settings.json`:
     ```bash
     cp agents/settings.json.example ~/.gemini/settings.json
     ```
   - Insert your real personal tokens into `~/.gemini/settings.json`.
