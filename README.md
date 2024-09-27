# Kir-Dev Automations.

This repository contains all automation scripts, reusable GitHub Actions, and build pipelines used across our projects. The repository is structured as a monorepo to streamline management and collaboration across multiple projects and tools.

## Table of Contents

- [Overview](#overview)
- [Repository structure](#repository-structure)
- [Contribution Guidelines](#contribution-guidelines)

## Overview

This monorepo hosts the automation logic for various projects, covering different tech stacks including Node.js, Rails, Spring Boot, and static site generators. The automation includes CI/CD workflows, build pipelines, deployment scripts, and reusable components aimed at improving efficiency across all projects.

The [@kir-dev/infra](https://github.com/orgs/kir-dev/teams/infra) team maintains the repository, while external contributions are welcome through pull request from forks.

## Repository Structure

```sh
/
├── actions/           # Reusable GitHub Action modules for workflows
├── workflows/         # Ready to use workflows
├── projects/          # Project-specific workflows and configurations
│   ├── pek-infinity/  # Example project-specific automation
│       │-- deploy.sh           # Script that deploys the project
│       │── docker-compose.yml  # If deployed via docker compose
│       │-- charts/             # If deployed via helm
```

## Contribution Guidelines

**Fork-Only Contributions:** All non-infra team contributors must fork the repository and submit a pull request. Direct commits to this repository are restricted to the infra team.

### Contribution Workflow

1. Fork the repository
2. Make changes in your fork
3. Submit a pull request to the main repository
4. Await review and approval from the infra team
5. Once approved, the infra team will merge the pull request
