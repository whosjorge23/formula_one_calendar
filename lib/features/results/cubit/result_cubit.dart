import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:formula_one_calendar/models/result.dart';
import 'package:formula_one_calendar/shared_export.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'result_state.dart';

part 'result_cubit.freezed.dart';

class ResultCubit extends Cubit<ResultState> {
  ResultCubit() : super(const ResultState.initial());

  Future<void> getAllRacesResults() async {
    List<Race> raceList = [];
    try {
      final races = await raceRepository.allRaces();
      if (races != null) {
        for (var race in races) {
          final raceResults = await resultRepository.raceResults(int.parse(race.round!));
          if (raceResults != null) {
            raceList.add(raceResults);
          } else {
            debugPrint("Race Result Empty");
          }
        }
        emit(state.copyWith(raceResults: raceList));
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
