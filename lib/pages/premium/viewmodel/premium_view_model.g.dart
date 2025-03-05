// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'premium_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PremiumViewModel on _PremiumViewModelBase, Store {
  late final _$premiumCompletedAtom =
      Atom(name: '_PremiumViewModelBase.premiumCompleted', context: context);

  @override
  bool get premiumCompleted {
    _$premiumCompletedAtom.reportRead();
    return super.premiumCompleted;
  }

  @override
  set premiumCompleted(bool value) {
    _$premiumCompletedAtom.reportWrite(value, super.premiumCompleted, () {
      super.premiumCompleted = value;
    });
  }

  late final _$checkBoxAtom =
      Atom(name: '_PremiumViewModelBase.checkBox', context: context);

  @override
  bool get checkBox {
    _$checkBoxAtom.reportRead();
    return super.checkBox;
  }

  @override
  set checkBox(bool value) {
    _$checkBoxAtom.reportWrite(value, super.checkBox, () {
      super.checkBox = value;
    });
  }

  late final _$imageModelAtom =
      Atom(name: '_PremiumViewModelBase.imageModel', context: context);

  @override
  List<String> get imageModel {
    _$imageModelAtom.reportRead();
    return super.imageModel;
  }

  @override
  set imageModel(List<String> value) {
    _$imageModelAtom.reportWrite(value, super.imageModel, () {
      super.imageModel = value;
    });
  }

  late final _$premiumCompletedSetAsyncAction = AsyncAction(
      '_PremiumViewModelBase.premiumCompletedSet',
      context: context);

  @override
  Future<void> premiumCompletedSet() {
    return _$premiumCompletedSetAsyncAction
        .run(() => super.premiumCompletedSet());
  }

  late final _$premiumCompletedGetAsyncAction = AsyncAction(
      '_PremiumViewModelBase.premiumCompletedGet',
      context: context);

  @override
  Future<void> premiumCompletedGet() {
    return _$premiumCompletedGetAsyncAction
        .run(() => super.premiumCompletedGet());
  }

  late final _$premiumButtonTappedAsyncAction = AsyncAction(
      '_PremiumViewModelBase.premiumButtonTapped',
      context: context);

  @override
  Future<void> premiumButtonTapped(BuildContext context) {
    return _$premiumButtonTappedAsyncAction
        .run(() => super.premiumButtonTapped(context));
  }

  late final _$_PremiumViewModelBaseActionController =
      ActionController(name: '_PremiumViewModelBase', context: context);

  @override
  void checkBoxFunction(bool value) {
    final _$actionInfo = _$_PremiumViewModelBaseActionController.startAction(
        name: '_PremiumViewModelBase.checkBoxFunction');
    try {
      return super.checkBoxFunction(value);
    } finally {
      _$_PremiumViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
premiumCompleted: ${premiumCompleted},
checkBox: ${checkBox},
imageModel: ${imageModel}
    ''';
  }
}
