import 'dart:async';
import 'dart:ui';

class DeBouncer {
  final int milliseconds;
  late VoidCallback action;
  Timer? _timer;

  DeBouncer({required this.milliseconds});

  run(VoidCallback action) {
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
