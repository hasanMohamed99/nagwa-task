# Nagwa Task App

A Flutter app to browse and search books from Project Gutenberg using the Gutendex API, featuring infinite scrolling, search with pagination, expandable summaries, and a responsive UI built with Cubit and Feature based Clean Architecture.

## Table of Contents
- [Prerequisites](#prerequisites)
- [Architecture Overview](#architecture-overview)
- [Project Setup](#project-setup)
- [Pubspec yaml](#pubspec-yaml)

## Prerequisites
Before you begin, ensure you have met the following requirements:

- **Flutter SDK**: v3.29.2 or later
- **Dart SDK**: v3.7.2 or later
- **Android Studio** used (Ladybug | 2024.2.1 Patch 3) or **Visual Studio Code** as IDE

## Architecture Overview
The project follows the Featured Clean Architecture pattern.

### Project Structure
- **core**:
    - Shared base classes, constants, utilities, and general configurations.
    - ApiService for handling all API network requests (using retrofit and dio packages).
    - General error handling and network-related classes.
- **features**: Each feature is self-contained and structured into:
    - ***data:*** Models for parsing API responses. Repositories for communicating with the API (through the ApiService) and providing data to the Cubits.
    - ***logic:*** Cubits and States for managing business logic and feature states.
    - ***ui:*** Screens and Widgets for the user interface of the feature.

**Notes:**
I applied Clean Architecture principles but adapted and streamlined them for the task's scope. Certain deeper abstractions (like separate data sources, complex mappers) were intentionally simplified to keep the project lightweight, efficient, and highly readable.
The Home feature is modular and separated, ensuring scalability for future development.

- **Flow Diagram**:

![flow](https://github.com/user-attachments/assets/9545f313-bd39-48f7-9e47-a2fb81fe4ab7)

## Project Setup

Follow these steps to set up the project on your local machine:

1. **Clone the repository**:
   ```bash
    https://github.com/hasanMohamed99/nagwa-task.git
2. **Navigate to the Project Directory**:
   ```bash
    cd nagwa_task
3. **Install Dependencies Ensure you have Flutter installed on your machine. Then run**:
   ```bash
    flutter pub get
4. **Run the Application To launch the app, use the following command**:
   ```bash
    flutter run

- **Tip**: I used Gitflow and FVM so It’s recommended to use Git Flow for better branch management. [Learn more about Git Flow](https://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow). You can also use Flutter FVM (Flutter Version Management) to easily manage Flutter versions. [Learn more about FVM](https://fvm.app/).

## Pubspec yaml

Below is the key configuration from the `pubspec.yaml` file that defines the project’s dependencies and environment:

```yaml
name: nagwa_task
description: "Nagwa Task."
publish_to: 'none'

version: 1.0.0+1

environment:
  sdk: ^3.7.2

  # Default icons asset for Cupertino widgets based on Apple styled icons
  cupertino_icons: ^1.0.8
  # Flutter library to load and cache network images. Can also be used with placeholder and error widgets.
  cached_network_image: ^3.4.1
  # Classes and helper functions that support JSON code generation via the `json_serializable` package.
  json_annotation: ^4.9.0
  # Provides a collection of Flutter grids layouts (staggered, masonry, quilted, woven, etc.).
  flutter_staggered_grid_view: ^0.7.0
  # A Flutter package that allows for dynamic expansion and collapse of text.
  readmore: ^3.0.0
  # Easily configure any flutter application with global variables using a `.env` file.
  flutter_dotenv: ^5.2.1
  # Annotations for the freezed code-generator. This package does nothing without freezed too.
  freezed_annotation: ^3.0.0
  # Dependency injection.
  get_it: ^8.0.3
  # Networking.
  dio: ^5.8.0
  retrofit: ^4.4.2
  retrofit_generator: ^9.1.9
  pretty_dio_logger: ^1.4.0
  # State management.
  flutter_bloc: ^9.1.0
  # A package provides an easy way to add shimmer effect.
  skeletonizer: ^1.4.3
  # A Flutter plugin for reading and writing simple key-value pairs locally.
  hive: ^2.2.3
  hive_flutter: ^1.1.0

dev_dependencies:
  flutter_test:
    sdk: flutter
  # Recommended lints for Flutter apps, packages, and plugins to encourage good coding practices.
  flutter_lints: ^5.0.0
  # A build system for Dart code generation and modular compilation.
  build_runner: ^2.4.15
  # Automatically generate code to and from json.
  json_serializable: ^6.9.5
  # Code generator (mainly used with cubit and retrofit).
  freezed: ^3.0.6

flutter:
  uses-material-design: true
  assets:
    - env/
  fonts:
    - family: Cairo
      fonts:
        - asset: assets/fonts/cairo/Cairo-100.ttf
          weight: 100
        - asset: assets/fonts/cairo/Cairo-200.ttf
          weight: 200
        - asset: assets/fonts/cairo/Cairo-300.ttf
          weight: 300
        - asset: assets/fonts/cairo/Cairo-400.ttf
          weight: 400
        - asset: assets/fonts/cairo/Cairo-500.ttf
          weight: 500
        - asset: assets/fonts/cairo/Cairo-600.ttf
          weight: 600
        - asset: assets/fonts/cairo/Cairo-700.ttf
          weight: 700
        - asset: assets/fonts/cairo/Cairo-800.ttf
          weight: 800
        - asset: assets/fonts/cairo/Cairo-900.ttf
          weight: 900
