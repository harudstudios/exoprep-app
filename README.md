# exam_pyq

**Team Lead:** Zahaan  
**Organization:** com.harud.exampyq  
**Package Name:** exam_pyq

## Project Overview

This Flutter project is set up for collaborative development with proper architecture, testing, and documentation standards.

## Quick Start for New Team Members

### Prerequisites
- Flutter SDK (latest stable)
- FVM (Flutter Version Management) recommended
- VS Code or Android Studio
- Git

### Setup Steps
1. Clone the repository
```bash
git clone <repository-url>
cd exam_pyq
```

2. Install FVM and Flutter version
```bash
fvm install
fvm use
```

3. Install dependencies
```bash
fvm flutter pub get
```

4. Run the app
```bash
# Development
fvm flutter run --flavor dev --dart-define=FLAVOR=dev

# Staging  
fvm flutter run --flavor stage --dart-define=FLAVOR=stage

# Production
fvm flutter run --flavor prod --dart-define=FLAVOR=prod
```

## Project Structure

```
lib/
├── main.dart                 # App entry point
└── src/
    ├── core/                 # Core app-level functionality
    │   ├── app/             # Global app setup: DI, app widget, splash
    │   ├── common/          # Reusable components (UI, cubits, utilities)
    │   ├── constants/       # Centralized constants: colors, strings, assets
    │   ├── env/             # Environment-specific configuration
    │   ├── exceptions/      # Custom exception classes
    │   ├── extensions/      # Dart/Flutter extensions
    │   ├── formatters/      # Input/output formatters
    │   ├── helper/          # Utility helpers   
    │   ├── logger/          # Logging utilities
    │   ├── navigation/      # Navigation system: routes, router, transitions
    │   └── theme/           # Global theming
    │
    ├── features/            # Feature-based modules (screens, blocs, logic)
    ├── interfaces/          # Abstract definitions for repositories & services
    ├── models/              # Data models (entities, DTOs, domain objects)
    ├── repositories/        # Data repositories (API, local, or hybrid sources)
    └── services/            # Low-level services (API clients, storage, platform APIs)
```

## Development Workflow

### Branch Strategy
- `main` - Production ready code
- `develop` - Development integration branch
- `feature/feature-name` - Feature branches
- `bugfix/issue-description` - Bug fix branches
- `hotfix/critical-fix` - Critical production fixes

### Code Standards
- Follow [Effective Dart](https://dart.dev/guides/language/effective-dart) guidelines
- Use meaningful commit messages (Conventional Commits)
- Write tests for all new features
- Maintain minimum 80% code coverage
- Use provided linting rules

### Testing Strategy
- **Unit Tests**: `test/unit/` - Test business logic
- **Widget Tests**: `test/widget/` - Test UI components  
- **Integration Tests**: `test/integration/` - Test complete flows

### Code Review Process
1. Create feature branch from `develop`
2. Implement feature with tests
3. Run `flutter analyze` and `flutter test`
4. Create Pull Request with description
5. Assign 2+ reviewers
6. Address review feedback
7. Merge after approval

## Environment Configuration

### Flavors
- **dev**: Development environment with debug features
- **stage**: Staging environment for testing
- **prod**: Production environment

### Build Commands
```bash
# Development
flutter build apk --flavor dev --dart-define=FLAVOR=dev

# Staging
flutter build apk --flavor stage --dart-define=FLAVOR=stage

# Production
flutter build apk --flavor prod --dart-define=FLAVOR=prod
```

## Architecture Guidelines

### State Management
- Use `flutter_bloc` for complex state management
- Use `StatefulWidget` for simple local state
- Follow BLoC pattern principles

### Dependency Injection
- Register services in `lib/src/core/app/get_it.dart`
- Use `get_it` for service location
- Follow dependency inversion principle

### Navigation
- Use `go_router` for declarative routing
- Define routes in `lib/src/core/navigation/routes.dart`
- Use route transitions in `lib/src/core/navigation/route_transition.dart`

## Team Responsibilities

### Senior Developers
- Code review and mentoring
- Architecture decisions
- Performance optimization
- CI/CD setup and maintenance

### Junior Developers
- Follow established patterns
- Write comprehensive tests
- Ask questions during code review
- Focus on feature implementation

### All Team Members
- Follow git workflow
- Write clear commit messages
- Update documentation
- Participate in code reviews

## Troubleshooting

### Common Issues
1. **Dependency conflicts**: Run `fvm flutter clean && fvm flutter pub get`
2. **Build failures**: Check flavor configuration
3. **IDE issues**: Restart IDE and run `fvm flutter pub get`

### Getting Help
1. Check documentation in `docs/` folder
2. Ask in team chat
3. Create GitHub issue for bugs
4. Consult with team lead

## Resources
- [Flutter Documentation](https://docs.flutter.dev/)
- [Dart Style Guide](https://dart.dev/guides/language/effective-dart/style)
- [BLoC Library](https://bloclibrary.dev/)
- [Project Architecture Guide](docs/architecture/README.md)

---
**Note**: This README is a living document. Please keep it updated as the project evolves.
