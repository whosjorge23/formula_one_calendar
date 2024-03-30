import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:formula_one_calendar/models/race.dart';
import 'package:formula_one_calendar/shared_export.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'circuit_state.dart';

part 'circuit_cubit.freezed.dart';

class CircuitCubit extends Cubit<CircuitState> {
  CircuitCubit() : super(const CircuitState.initial()) {
    getCircuitLocations();
  }

  Future<void> getCircuitLocations() async {
    try {
      final circuitLocations = await raceRepository.circuitLocation();
      emit(state.copyWith(circuitLocations: circuitLocations));
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
