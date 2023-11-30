// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generated_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GeneratedViewModel on _GeneratedViewModelBase, Store {
  late final _$generatePersonListAtom = Atom(
      name: '_GeneratedViewModelBase.generatePersonList', context: context);

  @override
  List<GenerateModel> get generatePersonList {
    _$generatePersonListAtom.reportRead();
    return super.generatePersonList;
  }

  @override
  set generatePersonList(List<GenerateModel> value) {
    _$generatePersonListAtom.reportWrite(value, super.generatePersonList, () {
      super.generatePersonList = value;
    });
  }

  @override
  String toString() {
    return '''
generatePersonList: ${generatePersonList}
    ''';
  }
}
