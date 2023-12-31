// ignore_for_file: library_private_types_in_public_api

import 'package:mobx/mobx.dart';
part 'bottom_nav_store.g.dart';

class BottomNavWidgetStore = _BottomNavWidgetStore with _$BottomNavWidgetStore;

abstract class _BottomNavWidgetStore with Store {
  _BottomNavWidgetStore();

  @observable
  int currentIndex = 0;
  @action
  void onChangeIndex(index) {
    currentIndex = index;
  }
}
