// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bottom_nav_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BottomNavWidgetStore on _BottomNavWidgetStore, Store {
  late final _$currentIndexAtom =
      Atom(name: '_BottomNavWidgetStore.currentIndex', context: context);

  @override
  int get currentIndex {
    _$currentIndexAtom.reportRead();
    return super.currentIndex;
  }

  @override
  set currentIndex(int value) {
    _$currentIndexAtom.reportWrite(value, super.currentIndex, () {
      super.currentIndex = value;
    });
  }

  late final _$_BottomNavWidgetStoreActionController =
      ActionController(name: '_BottomNavWidgetStore', context: context);

  @override
  void onChangeIndex(dynamic index) {
    final _$actionInfo = _$_BottomNavWidgetStoreActionController.startAction(
        name: '_BottomNavWidgetStore.onChangeIndex');
    try {
      return super.onChangeIndex(index);
    } finally {
      _$_BottomNavWidgetStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentIndex: ${currentIndex}
    ''';
  }
}
