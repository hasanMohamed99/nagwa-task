import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'dart:io';

extension MapExtension<K, V> on Map<K, V>? {
  bool isNullOrEmpty() => this == null || this!.isEmpty;

  void printPrettyMap() {
    if (this == null) {
      debugPrint('null');
      return;
    }
    const encoder = JsonEncoder.withIndent('  ');
    debugPrint(encoder.convert(this));
  }
}

extension ListExtension<T> on List<T>? {
  bool isNullOrEmpty() => this == null || this!.isEmpty;
}

extension StringExtension on String? {
  bool isNullOrEmpty() => this == null || this!.isEmpty;

  void redDebugPrint() {
    if (!kIsWeb) {
      if (Platform.isAndroid) {
        debugPrint('\x1B[91m$this\x1B[0m');
      } else {
        debugPrint("🔴 $this");
      }
    } else {
      debugPrint("🔴 $this");
    }
  }

  void greenDebugPrint() {
    if (!kIsWeb) {
      if (Platform.isAndroid) {
        debugPrint('\x1B[92m$this\x1B[0m');
      } else {
        debugPrint("🟢 $this");
      }
    } else {
      debugPrint("🟢 $this");
    }
  }

  void yellowDebugPrint() {
    if (!kIsWeb) {
      if (Platform.isAndroid) {
        debugPrint('\x1B[93m$this\x1B[0m');
      } else {
        debugPrint("🟡 $this");
      }
    } else {
      debugPrint("🟡 $this");
    }
  }

  void blueDebugPrint() {
    if (!kIsWeb) {
      if (Platform.isAndroid) {
        debugPrint('\x1B[94m$this\x1B[0m');
      } else {
        debugPrint("🔵 $this");
      }
    } else {
      debugPrint("🔵 $this");
    }
  }

  void magentaDebugPrint() {
    if (!kIsWeb) {
      if (Platform.isAndroid) {
        debugPrint('\x1B[95m$this\x1B[0m');
      } else {
        debugPrint("🟣 $this");
      }
    } else {
      debugPrint("🟣 $this");
    }
  }

  void orangeDebugPrint() {
    if (!kIsWeb) {
      if (Platform.isAndroid) {
        debugPrint('\x1B[38;5;214m$this\x1B[0m');
      } else {
        debugPrint("🟠 $this");
      }
    } else {
      debugPrint("🟠 $this");
    }
  }

  void releasePrint() {
    if (!kIsWeb) {
      if (Platform.isAndroid) {
        // ignore: avoid_print
        print("release: \x1B[92m$this\x1B[0m");
      } else {
        // ignore: avoid_print
        print("release: 🟢 $this");
      }
    } else {
      // ignore: avoid_print
      print("release: 🟢 $this");
    }
  }

  String removeExtension() {
    List<String> parts = this!.split('.');
    if (parts.length > 1) {
      parts.removeLast(); // Remove the extension
    }
    return parts.join('.');
  }
}
