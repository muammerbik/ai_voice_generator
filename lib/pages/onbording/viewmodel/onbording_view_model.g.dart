// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onbording_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OnbordingViewModel on _OnbordingViewModelBase, Store {
  late final _$onbordingComplatedAtom = Atom(
      name: '_OnbordingViewModelBase.onbordingComplated', context: context);

  @override
  bool get onbordingComplated {
    _$onbordingComplatedAtom.reportRead();
    return super.onbordingComplated;
  }

  @override
  set onbordingComplated(bool value) {
    _$onbordingComplatedAtom.reportWrite(value, super.onbordingComplated, () {
      super.onbordingComplated = value;
    });
  }

  late final _$onbordingComplatedSetAsyncAction = AsyncAction(
      '_OnbordingViewModelBase.onbordingComplatedSet',
      context: context);

  @override
  Future<void> onbordingComplatedSet() {
    return _$onbordingComplatedSetAsyncAction
        .run(() => super.onbordingComplatedSet());
  }

  late final _$onbordingComplatedGetAsyncAction = AsyncAction(
      '_OnbordingViewModelBase.onbordingComplatedGet',
      context: context);

  @override
  Future<void> onbordingComplatedGet() {
    return _$onbordingComplatedGetAsyncAction
        .run(() => super.onbordingComplatedGet());
  }

  @override
  String toString() {
    return '''
onbordingComplated: ${onbordingComplated}
    ''';
  }
}
