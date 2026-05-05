# Microsite — Claude Code Guide

## Project Overview
A Slim Framework 3 PHP microsite that connects to the MediaSilo API. Users log in with MediaSilo credentials, browse projects, and view assets.

## Stack
- **Language**: PHP ≥ 5.5
- **Framework**: Slim 3 (`slim/slim ~3.0`)
- **Templates**: Twig (`slim/twig-view`)
- **Logging**: Monolog
- **Entry point**: `public/index.php`
- **Routes**: `src/routes.php`
- **API wrapper**: `src/api.php` (MediaSilo REST API calls via cURL)
- **Settings**: `src/settings.php`

## Key Directories
```
public/       # Web root (index.php, static assets)
src/          # Application code (routes, api, settings, dependencies, middleware)
templates/    # Twig HTML templates
logs/         # Application logs
```

## GitLab MCP Integration

This project is configured to use the **GitLab MCP server**, enabling Claude to interact with GitLab repositories directly.

### Configuration
Located in `.claude/settings.json`:
```json
{
  "mcpServers": {
    "gitlab": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-gitlab"],
      "env": {
        "GITLAB_PERSONAL_ACCESS_TOKEN": "${GITLAB_PERSONAL_ACCESS_TOKEN}",
        "GITLAB_API_URL": "https://gitlab.com"
      }
    }
  }
}
```

### Setup
1. Generate a GitLab Personal Access Token at **GitLab → User Settings → Access Tokens**
   - Required scopes: `api`, `read_user`, `read_repository`, `write_repository`
2. Export the token in your shell:
   ```bash
   export GITLAB_PERSONAL_ACCESS_TOKEN=your_token_here
   ```
3. (Optional) For self-hosted GitLab, also set:
   ```bash
   export GITLAB_API_URL=https://your-gitlab-instance.com
   ```
4. Restart Claude Code — the GitLab MCP server will be available automatically.

### What the GitLab MCP Enables
Once connected, Claude can:
- Search and browse GitLab repositories, issues, and merge requests
- Create/update files and branches
- Open and manage issues and MRs
- Read CI/CD pipeline status
- Fork repositories and manage project settings
