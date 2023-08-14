// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flight_plan_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FlightPlanStore on _FlightPlanStore, Store {
  late final _$flightPlansAtom =
      Atom(name: '_FlightPlanStore.flightPlans', context: context);

  @override
  List<dynamic> get flightPlans {
    _$flightPlansAtom.reportRead();
    return super.flightPlans;
  }

  @override
  set flightPlans(List<dynamic> value) {
    _$flightPlansAtom.reportWrite(value, super.flightPlans, () {
      super.flightPlans = value;
    });
  }

  late final _$selectedFlightPlanAtom =
      Atom(name: '_FlightPlanStore.selectedFlightPlan', context: context);

  @override
  Map<dynamic, dynamic> get selectedFlightPlan {
    _$selectedFlightPlanAtom.reportRead();
    return super.selectedFlightPlan;
  }

  @override
  set selectedFlightPlan(Map<dynamic, dynamic> value) {
    _$selectedFlightPlanAtom.reportWrite(value, super.selectedFlightPlan, () {
      super.selectedFlightPlan = value;
    });
  }

  late final _$setSelectedFlightPlanAsyncAction =
      AsyncAction('_FlightPlanStore.setSelectedFlightPlan', context: context);

  @override
  Future<void> setSelectedFlightPlan(Map<dynamic, dynamic> plan) {
    return _$setSelectedFlightPlanAsyncAction
        .run(() => super.setSelectedFlightPlan(plan));
  }

  late final _$_FlightPlanStoreActionController =
      ActionController(name: '_FlightPlanStore', context: context);

  @override
  void setFlightPlans(List<dynamic> plans) {
    final _$actionInfo = _$_FlightPlanStoreActionController.startAction(
        name: '_FlightPlanStore.setFlightPlans');
    try {
      return super.setFlightPlans(plans);
    } finally {
      _$_FlightPlanStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
flightPlans: ${flightPlans},
selectedFlightPlan: ${selectedFlightPlan}
    ''';
  }
}
