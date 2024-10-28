import 'package:flutter_riverpod/flutter_riverpod.dart';

final visibilityprovider =
    StateNotifierProvider<PasswordVisibiltyController, bool>(
        (ref) => PasswordVisibiltyController());

class PasswordVisibiltyController extends StateNotifier<bool> {
  PasswordVisibiltyController() : super(true);

  void toggle() {
    state = !state;
  }
}
