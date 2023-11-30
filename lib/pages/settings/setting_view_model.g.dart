// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SettingsViewModel on _SettingsViewModelBase, Store {
  late final _$premiumRightAtom =
      Atom(name: '_SettingsViewModelBase.premiumRight', context: context);

  @override
  int get premiumRight {
    _$premiumRightAtom.reportRead();
    return super.premiumRight;
  }

  @override
  set premiumRight(int value) {
    _$premiumRightAtom.reportWrite(value, super.premiumRight, () {
      super.premiumRight = value;
    });
  }

  late final _$settingsComplatedSetAsyncAction = AsyncAction(
      '_SettingsViewModelBase.settingsComplatedSet',
      context: context);

  @override
  Future<int> settingsComplatedSet() {
    return _$settingsComplatedSetAsyncAction
        .run(() => super.settingsComplatedSet());
  }

  late final _$settingsComplatedGetAsyncAction = AsyncAction(
      '_SettingsViewModelBase.settingsComplatedGet',
      context: context);

  @override
  Future<int> settingsComplatedGet() {
    return _$settingsComplatedGetAsyncAction
        .run(() => super.settingsComplatedGet());
  }

  @override
  String toString() {
    return '''
premiumRight: ${premiumRight}
    ''';
  }
}
