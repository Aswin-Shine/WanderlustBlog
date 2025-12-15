# WanderlustBlog

[![Repo size](https://img.shields.io/github/repo-size/Aswin-Shine/WanderlustBlog)](https://github.com/Aswin-Shine/WanderlustBlog)
[![Languages](https://img.shields.io/github/languages/top/Aswin-Shine/WanderlustBlog)](https://github.com/Aswin-Shine/WanderlustBlog)
[![License](https://img.shields.io/github/license/Aswin-Shine/WanderlustBlog)](https://github.com/Aswin-Shine/WanderlustBlog/blob/main/LICENSE)

A modern, fast, and content-focused travel blog starter — WanderlustBlog. Built with TypeScript and JavaScript with infrastructure-as-code support (HCL) and an optional Docker deployment. Designed for easy writing, SEO, and fast page loads.

Table of Contents
- [Features](#features)
- [Tech stack](#tech-stack)
- [Demo](#demo)
- [Getting started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Clone and install](#clone-and-install)
  - [Environment variables](#environment-variables)
  - [Run locally](#run-locally)
  - [Build & run production](#build--run-production)
- [Docker](#docker)
- [Infrastructure](#infrastructure)
- [Testing & linting](#testing--linting)
- [Deployment](#deployment)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

Features
- Clean, responsive blog layout optimized for travel content and photography
- TypeScript-first codebase with progressive enhancement using JavaScript where needed
- SEO-friendly structure and fast builds
- Support for local markdown/MDX content (or headless CMS integration)
- Infrastructure-as-code examples (Terraform / HCL) for deploying cloud resources
- Dockerfile included for containerized deployments

Tech stack
- Primary: TypeScript, JavaScript
- Infrastructure examples: HCL (Terraform)
- Shell scripts for automation
- Optional: HTML/CSS for styling; Dockerfile for container builds

Demo
You can add a deployed demo link here (e.g., Netlify, Vercel, or your domain):
https://your-demo-url.example.com

Getting started

Prerequisites
- Node.js >= 16 (recommend latest LTS)
- npm >= 8 or yarn
- Optional: Docker if you plan to run the containerized app
- Optional: Terraform/other IaC tooling if using the infra examples

Clone and install
```bash
git clone https://github.com/Aswin-Shine/WanderlustBlog.git
cd WanderlustBlog
npm install
# or
# yarn install
```

Environment variables
Create a .env.local (or .env) file in the project root. Example variables the app may expect:
```bash
# Example values — replace with your own
NODE_ENV=development
PORT=3000
NEXT_PUBLIC_BASE_URL=http://localhost:3000
# If using a CMS or DB:
# CMS_API_URL=
# DATABASE_URL=
```
Note: adjust the names above to match the actual variables used in the repo (search for process.env references).

Run locally
```bash
# Start development server (watch mode)
npm run dev

# Build for production
npm run build

# Start production server
npm run start
```

Common npm scripts
- npm run dev — start development server
- npm run build — build production assets
- npm run start — run built app
- npm run lint — run linters (eslint, etc.)
- npm run format — code formatting (prettier)
- npm run test — run tests (if present)

Build & run production (node)
```bash
npm run build
npm run start
```

Docker
A Dockerfile is included for container-based deployment. Example:
```bash
# build image
docker build -t wanderlustblog:latest .

# run container
docker run -p 3000:3000 --env-file .env local wanderlustblog:latest
```
Adjust port, env, and runtime options for your environment.

Infrastructure
This repository includes HCL files (Terraform) for basic infrastructure examples (e.g., hosting, CDN, storage). Inspect the `/infra` or `/terraform` directory (if present) and follow the README inside that directory to provision resources. Always review and adjust resources before applying.

Testing & linting
- Linting: ESLint + Prettier (if configured)
- Tests: Jest / Vitest (if configured)
Run:
```bash
npm run lint
npm run test
npm run format
```

Deployment
Recommended platforms:
- Vercel (zero-config for many JS/TS frameworks)
- Netlify
- Docker on any cloud provider (ECS, GCE, DigitalOcean, etc.)
- Use the included Terraform examples to provision resources and CD pipelines.

Contributing
Contributions are welcome! To contribute:
1. Fork the repository
2. Create a feature branch: git checkout -b feature/your-feature
3. Make changes and add tests where appropriate
4. Run linting and tests: npm run lint && npm run test
5. Open a Pull Request describing your change

Please follow the existing code style and add documentation for any public-facing changes.

Code of conduct
This project follows a Code of Conduct. Be kind, respectful, and collaborative. If no CODE_OF_CONDUCT.md exists, default to the Contributor Covenant.

License
This project is provided under the MIT License — see the [LICENSE](https://github.com/Aswin-Shine/WanderlustBlog/blob/main/LICENSE) file for details.

Acknowledgements
- Thanks to the open-source community, and any libraries or templates used in this project.
- Replace this section with any specific attributions (design, images, libraries).

Contact
Repository: https://github.com/Aswin-Shine/WanderlustBlog
Author / Maintainer: Aswin-Shine

If you want, I can:
- Generate a tailored README with details pulled directly from the code (scripts, actual env vars, framework detection).
- Add badges (CI, coverage, latest release) once you provide links or CI setup.
- Create CONTRIBUTING.md, CODE_OF_CONDUCT.md, or a PR template.
