# Contributing to Echo

Thank you for your interest in contributing to Echo! This document outlines how to participate in the project.

## Reporting Issues

- **Bug reports**: Use the [Bug Report](.github/ISSUE_TEMPLATE/bug_report.yml) template. Include your macOS version, Xcode version, and clear reproduction steps.
- **Feature requests**: Use the [Feature Request](.github/ISSUE_TEMPLATE/feature_request.yml) template.
- Before opening a new issue, please search existing ones to avoid duplicates.

## Pull Requests

1. **Fork** the repository and create your branch from `develop`:
   ```bash
   git checkout -b feat/my-feature origin/develop
   ```

2. **Branch naming conventions**:
   - `feat/` — new features
   - `fix/` — bug fixes
   - `chore/` — tooling, CI, dependencies
   - `docs/` — documentation only

3. **Build and test** locally before submitting:
   ```bash
   open Echo.xcodeproj
   # Cmd+B to build, Cmd+R to run
   ```

4. **Code style**: The project uses [SwiftLint](https://github.com/realm/SwiftLint). Run `swiftlint lint` from the project root before committing. CI will fail if there are violations.

5. **Keep PRs focused**: One logical change per PR. If you find an unrelated issue, open a separate PR or issue for it.

6. Submit your PR against the `develop` branch and fill in the pull request template.

## Development Setup

See the [Development Setup](README.md#development-setup) section in the README for build instructions and required environment variables.

## Code of Conduct

This project follows the [Contributor Covenant Code of Conduct](CODE_OF_CONDUCT.md). By participating, you agree to uphold these standards.
