import 'package:flutter_riverpod/flutter_riverpod.dart';

final obscureTextProvider =
    AutoDisposeNotifierProvider<ObscureTextProvider, bool>(
        ObscureTextProvider.new);

class ObscureTextProvider extends AutoDisposeNotifier<bool> {
  @override
  bool build() {
    return true;
  }

  void toggle() => state = !state;
}
