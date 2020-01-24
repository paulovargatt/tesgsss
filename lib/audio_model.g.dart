// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AudioModel on _AudioModelBase, Store {
  final _$titleAtom = Atom(name: '_AudioModelBase.title');

  @override
  String get title {
    _$titleAtom.context.enforceReadPolicy(_$titleAtom);
    _$titleAtom.reportObserved();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.context.conditionallyRunInAction(() {
      super.title = value;
      _$titleAtom.reportChanged();
    }, _$titleAtom, name: '${_$titleAtom.name}_set');
  }

  final _$statusPlayingAtom = Atom(name: '_AudioModelBase.statusPlaying');

  @override
  bool get statusPlaying {
    _$statusPlayingAtom.context.enforceReadPolicy(_$statusPlayingAtom);
    _$statusPlayingAtom.reportObserved();
    return super.statusPlaying;
  }

  @override
  set statusPlaying(bool value) {
    _$statusPlayingAtom.context.conditionallyRunInAction(() {
      super.statusPlaying = value;
      _$statusPlayingAtom.reportChanged();
    }, _$statusPlayingAtom, name: '${_$statusPlayingAtom.name}_set');
  }

  final _$imageAtom = Atom(name: '_AudioModelBase.image');

  @override
  String get image {
    _$imageAtom.context.enforceReadPolicy(_$imageAtom);
    _$imageAtom.reportObserved();
    return super.image;
  }

  @override
  set image(String value) {
    _$imageAtom.context.conditionallyRunInAction(() {
      super.image = value;
      _$imageAtom.reportChanged();
    }, _$imageAtom, name: '${_$imageAtom.name}_set');
  }

  final _$_AudioModelBaseActionController =
      ActionController(name: '_AudioModelBase');

  @override
  dynamic changeTitle(dynamic val) {
    final _$actionInfo = _$_AudioModelBaseActionController.startAction();
    try {
      return super.changeTitle(val);
    } finally {
      _$_AudioModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changePlaying(bool value) {
    final _$actionInfo = _$_AudioModelBaseActionController.startAction();
    try {
      return super.changePlaying(value);
    } finally {
      _$_AudioModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeImage(dynamic val) {
    final _$actionInfo = _$_AudioModelBaseActionController.startAction();
    try {
      return super.changeImage(val);
    } finally {
      _$_AudioModelBaseActionController.endAction(_$actionInfo);
    }
  }
}
