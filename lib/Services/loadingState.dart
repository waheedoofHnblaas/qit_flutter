import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoadingState extends StateNotifier<bool> {
  LoadingState() : super(false);

  changeLoading() {
    print('change $state');
    state = !state;
  }
}
