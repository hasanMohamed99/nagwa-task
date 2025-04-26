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

![flow](https://github.com/user-attachments/assets/ace0ffbe-6c71-47d3-acc9-7649b2224dae)

## Pubspec yaml

Below is the key configuration from the `pubspec.yaml` file that defines the project’s dependencies and environment:

```yaml
name: nagwa_task
description: "Nagwa Task."
publish_to: 'none'

version: 1.0.0+1

environment:
  sdk: ^3.7.2

dependencies:
  flutter:
    sdk: flutter

  cupertino_icons: ^1.0.8

dev_dependencies:
  flutter_test:
    sdk: flutter

  flutter_lints: ^5.0.0

flutter:
  uses-material-design: true
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
