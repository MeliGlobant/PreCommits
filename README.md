# AWS Infrastructure Modules

This repository uses **pre-commit** to ensure code quality, security standards, and consistent commit messages before any code is committed and pushed to our CI/CD pipelines.

---

## 1. Initial Setup (One-time)

To contribute to this repository, you must install the pre-commit framework and the required security tools on your local machine.

### Prerequisites (MacOS)
Install the framework and the Terraform validation suite using Homebrew:

# 1. Install the pre-commit framework using Homebrew
brew install pre-commit

# 2. Verify the installation to ensure the command is available
pre-commit --version

# 3. Navigate to your repository folder
cd your-repo-name

# 4. Initialize the local git hooks (this links git commit with pre-commit)
pre-commit install

# 5. Initialize the specific hook for commit messages (to enable commitlint)
pre-commit install --hook-type commit-msg

# 6. (Optional) Run the hooks against all files to ensure everything is clean
pre-commit run --all-files

### Prerequisites (Linux)
Install the framework using pip with a virtual environment:

# 1. Create a virtual environment
python3 -m venv .venv

# 2. Activate the virtual environment
source .venv/bin/activate

# 3. Install dependencies from requirements file
pip install -r requirements-dev.txt

# 4. Verify the installation to ensure the command is available
pre-commit --version

# 5. Navigate to your repository folder
cd your-repo-name

# 6. Initialize the local git hooks (this links git commit with pre-commit)
pre-commit install

# 7. Initialize the specific hook for commit messages (to enable commitlint)
pre-commit install --hook-type commit-msg

# 8. (Optional) Run the hooks against all files to ensure everything is clean
pre-commit run --all-files

## Commit Message Format

This repository uses **commitlint** with Conventional Commits format. All commit messages must follow this structure:

<type>(<scope>): <subject>

<body>

<footer>

### Commit Types

- `feat`: A new feature
- `fix`: A bug fix
- `docs`: Documentation only changes
- `style`: Changes that do not affect the meaning of the code (white-space, formatting, etc.)
- `refactor`: A code change that neither fixes a bug nor adds a feature
- `perf`: A code change that improves performance
- `test`: Adding missing tests or correcting existing tests
- `build`: Changes that affect the build system or external dependencies
- `ci`: Changes to CI configuration files and scripts
- `chore`: Other changes that don't modify src or test files
- `revert`: Reverts a previous commit

### Valid Commit Examples

#### Feature

feat: add user authentication

feat(auth): implement OAuth2 login flow

#### Bug Fix

fix: resolve memory leak in data processor

fix(api): handle null response in user endpoint

#### Documentation

docs: update installation instructions

docs(readme): add setup guide for macOS

#### Style

style: format code with prettier

style(components): fix indentation in Button component

#### Refactor

refactor: simplify authentication logic

refactor(utils): extract common validation functions

#### Performance

perf: optimize database query performance

perf(api): reduce response time by 50%

#### Test

test: add unit tests for user service

test(auth): cover edge cases in login flow

#### Build

build: update dependencies to latest versions

build(deps): upgrade React to v18

#### CI

ci: add GitHub Actions workflow

ci: configure automated testing pipeline

#### Chore

chore: update project dependencies

chore: remove unused configuration files

#### Revert

revert: revert "feat: add user authentication"

This reverts commit abc123def456.

### Commit Message Rules

- **Type** is required and must be lowercase
- **Scope** is optional and should be lowercase
- **Subject** is required and should be lowercase, no period at the end
- **Body** is optional and should explain the "what" and "why"
- **Footer** is optional and can reference issues (e.g., `Closes #123`)

### Examples with Body and Footer

feat(api): add user registration endpoint

Implement POST /api/users endpoint with email validation
and password hashing. Includes rate limiting to prevent
abuse.

Closes #42

fix(auth): handle expired token refresh

When refresh token expires, redirect user to login page
instead of showing error. This improves user experience
and prevents confusion.

Fixes #123

## Configuration

Configuration lives in `.pre-commit-config.yaml`.

Commitlint configuration is in `.commitlintrc.yaml`.
