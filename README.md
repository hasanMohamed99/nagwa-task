# Nagwa Task App

A Flutter app to browse and search books from Project Gutenberg using the Gutendex API, featuring infinite scrolling, search with pagination, expandable summaries, and a responsive UI built with Cubit and Feature based Clean Architecture.

## Table of Contents
- [Prerequisites](#prerequisites)
- [Architecture Overview](#architecture-overview)
- [Pubspec yaml](#pubspec-yaml)

## Prerequisites
Before you begin, ensure you have met the following requirements:

- **Flutter SDK**: v3.29.2 or later
- **Dart SDK**: v3.7.2 or later
- **Android Studio** or **Visual Studio Code** as IDE

## Architecture Overview
This diagram illustrates the unidirectional data flow in the app using Cubit for state management. It shows the interaction between the UI, Cubit, Repository, and Server:

![flow](https://github.com/user-attachments/assets/9545f313-bd39-48f7-9e47-a2fb81fe4ab7)

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
