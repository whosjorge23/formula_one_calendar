import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:formula_one_calendar/models/constructor.dart';
import 'package:formula_one_calendar/shared_export.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'constructor_state.dart';

part 'constructor_cubit.freezed.dart';

class ConstructorCubit extends Cubit<ConstructorState> {
  ConstructorCubit() : super(const ConstructorState.initial());

  Future<void> getConstructors() async {
    try {
      final constructors = await constructorRepository.fetchConstructors();
      emit(state.copyWith(constructors: constructors));
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> getConstructorResults(String? constuctorId) async {
    try {
      if (constuctorId != null) {
        int teamPoints = 0;
        final constructorResult = await resultRepository.teamResults(constuctorId);
        if (constructorResult == null) return;
        for (var race in constructorResult) {
          if (race.results == null) return;
          teamPoints += (int.parse(race.results![0].points!) + int.parse(race.results![1].points!));
        }
        emit(state.copyWith(constructorsPoints: teamPoints));
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
