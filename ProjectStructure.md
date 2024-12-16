# Project Structure

## Overview Modular Layered Architecture

This document outlines the structure of the project to ensure it is scalable, maintainable, and easy to navigate for new and experienced developers alike.

![alt text](https://raw.githubusercontent.com/vfiruz97/financier-2.0/refs/heads/main/app_layers.png)

## Folder Structure

The project follows a layered structure designed to keep features modular and dependencies clean:

- **app/**: Contains the main application logic and serves as the entry point for app-wide features and navigation setup.
  - **miniclient/**: The primary package for external navigation and high-level application features. The name "miniclient" is used as an example; feel free to replace it with your preferred name.
  - **navigation/** (optional): A standalone package for navigation logic, ideal for apps with more than 20 features.
- **feature/**: Contains independent feature packages. Features must remain self-contained and avoid dependencies on other features.
- **core/**: Provides project-specific utilities that bridge features and general utilities.
- **utility/**: Includes general-purpose utilities like authentication and database management. Utilities can only depend on other utilities to maintain a clear hierarchy.

## Key Information for New Engineers

### Conventions

- Maintain the following dependency hierarchy:
  - **app → feature → core → utility**
- Avoid circular dependencies between packages.
- Ensure each feature is independent and self-contained.

### Best Practices

- Reusable logic should be placed in the **core** or **utility** layers.
- For large apps, extract navigation logic into a separate package under **app/** to improve modularity and simplify testing.
- Test each feature independently to ensure modularity.

## Dependency Management

1. **Adding Dependencies:**

   - Add new dependencies to the `pubspec.yaml` file of the relevant package (utility, core, or feature).
   - Ensure the dependency aligns with the project hierarchy to maintain stability.

2. **Updating Dependencies:**

   - Test all affected packages before committing changes.
   - Maintain consistent dependency versions across the monorepo to prevent conflicts.

3. **Avoiding Circular Dependencies:**
   - Utilities can only depend on other utilities.
   - Core packages can depend on utilities and other core packages.
   - Features can depend on core and utility packages, but not on other features.

## Visual Representation

```plaintext
app/
|-- miniclient/
|-- navigation/ (optional)
feature/
|-- feature1/
|-- feature2/
core/
|-- auth/ (handles user logins and permissions)
|-- db/ (manages data storage)
utility/ (includes tools for smooth app operation)
|-- auth_helpers/ (tools for login management)
|-- db_tools/ (tools for database operations)
```

This structure ensures a clear separation of concerns, making it easier for new engineers to onboard and contribute effectively.
