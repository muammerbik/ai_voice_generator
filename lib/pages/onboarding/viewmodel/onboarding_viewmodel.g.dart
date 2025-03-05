// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OnboardingViewModel on _OnboardingViewModelBase, Store {
  late final _$onboardingCompletedAtom = Atom(
      name: '_OnboardingViewModelBase.onboardingCompleted', context: context);

  @override
  bool get onboardingCompleted {
    _$onboardingCompletedAtom.reportRead();
    return super.onboardingCompleted;
  }

  @override
  set onboardingCompleted(bool value) {
    _$onboardingCompletedAtom.reportWrite(value, super.onboardingCompleted, () {
      super.onboardingCompleted = value;
    });
  }

  late final _$onboardingCompletedSetAsyncAction = AsyncAction(
      '_OnboardingViewModelBase.onboardingCompletedSet',
      context: context);

  @override
  Future<void> onboardingCompletedSet() {
    return _$onboardingCompletedSetAsyncAction
        .run(() => super.onboardingCompletedSet());
  }

  late final _$onboardingCompletedGetAsyncAction = AsyncAction(
      '_OnboardingViewModelBase.onboardingCompletedGet',
      context: context);

  @override
  Future<void> onboardingCompletedGet() {
    return _$onboardingCompletedGetAsyncAction
        .run(() => super.onboardingCompletedGet());
  }

  late final _$continueButtonTappedAsyncAction = AsyncAction(
      '_OnboardingViewModelBase.continueButtonTapped',
      context: context);

  @override
  Future<void> continueButtonTapped() {
    return _$continueButtonTappedAsyncAction
        .run(() => super.continueButtonTapped());
  }

  @override
  String toString() {
    return '''
onboardingCompleted: ${onboardingCompleted}
    ''';
  }
}
