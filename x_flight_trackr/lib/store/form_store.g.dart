// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FormStore on _FormStore, Store {
  late final _$fromAtom = Atom(name: '_FormStore.from', context: context);

  @override
  String get from {
    _$fromAtom.reportRead();
    return super.from;
  }

  @override
  set from(String value) {
    _$fromAtom.reportWrite(value, super.from, () {
      super.from = value;
    });
  }

  late final _$toAtom = Atom(name: '_FormStore.to', context: context);

  @override
  String get to {
    _$toAtom.reportRead();
    return super.to;
  }

  @override
  set to(String value) {
    _$toAtom.reportWrite(value, super.to, () {
      super.to = value;
    });
  }

  late final _$quantityAtom =
      Atom(name: '_FormStore.quantity', context: context);

  @override
  int get quantity {
    _$quantityAtom.reportRead();
    return super.quantity;
  }

  @override
  set quantity(int value) {
    _$quantityAtom.reportWrite(value, super.quantity, () {
      super.quantity = value;
    });
  }

  late final _$_FormStoreActionController =
      ActionController(name: '_FormStore', context: context);

  @override
  void setFrom(String value) {
    final _$actionInfo =
        _$_FormStoreActionController.startAction(name: '_FormStore.setFrom');
    try {
      return super.setFrom(value);
    } finally {
      _$_FormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTo(String value) {
    final _$actionInfo =
        _$_FormStoreActionController.startAction(name: '_FormStore.setTo');
    try {
      return super.setTo(value);
    } finally {
      _$_FormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void increaseQuantity() {
    final _$actionInfo = _$_FormStoreActionController.startAction(
        name: '_FormStore.increaseQuantity');
    try {
      return super.increaseQuantity();
    } finally {
      _$_FormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decreaseQuantity() {
    final _$actionInfo = _$_FormStoreActionController.startAction(
        name: '_FormStore.decreaseQuantity');
    try {
      return super.decreaseQuantity();
    } finally {
      _$_FormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
from: ${from},
to: ${to},
quantity: ${quantity}
    ''';
  }
}
