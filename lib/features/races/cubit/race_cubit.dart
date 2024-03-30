import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:formula_one_calendar/models/race.dart';
import 'package:formula_one_calendar/shared_export.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'race_state.dart';

part 'race_cubit.freezed.dart';

class RaceCubit extends Cubit<RaceState> {
  RaceCubit() : super(const RaceState.initial());

  Future<void> getRaces() async {
    try {
      final races = await raceRepository.allRaces();
      emit(state.copyWith(races: races));
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
