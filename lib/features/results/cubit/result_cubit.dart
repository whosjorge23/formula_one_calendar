import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:formula_one_calendar/models/model_wrappers/team_result.dart';
import 'package:formula_one_calendar/models/result.dart';
import 'package:formula_one_calendar/shared_export.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'result_state.dart';

part 'result_cubit.freezed.dart';

class ResultCubit extends Cubit<ResultState> {
  ResultCubit() : super(const ResultState.initial()) {
    initData();
  }

  Future<void> initData() async {
    await getAllRacesResults();
    await getAllConstructorResults();
  }

  Future<void> getAllRacesResults() async {
    List<Race> raceList = [];
    DateTime today = DateTime.now();
    today = DateTime(today.year, today.month, today.day);
    try {
      final races = await raceRepository.allRaces();
      if (races != null) {
        for (var race in races) {
          DateTime date = DateTime.parse(race.date!);
          if (date.isBefore(today) || date.isAtSameMomentAs(today)) {
            final raceResults = await resultRepository.raceResults(int.parse(race.round!));
            if (raceResults != null) {
              raceList.add(raceResults);
              debugPrint("Race Result Completed");
            } else {
              debugPrint("Race Result Empty");
            }
          }
        }
        emit(state.copyWith(raceResults: raceList));
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> getAllConstructorResults() async {
    try {
      List<TeamResult> teamResultArray = [];
      final constructors = await constructorRepository.fetchConstructors();
      if (constructors == null) return;
      for (var constructor in constructors) {
        int teamPoints = 0;
        if (constructor.constructorId != null) {
          final constructorResult = await resultRepository.teamResults(constructor.constructorId!);
          if (constructorResult == null) return;
          for (var race in constructorResult) {
            if (race.results == null) return;
            for (var result in race.results!) {
              teamPoints += int.parse(result.points!);
            }
          }
        }
        teamResultArray.add(TeamResult(constructorsResult: teamPoints, constructors: constructor));
      }
      // Sort the results by points in descending order
      teamResultArray.sort((a, b) => b.constructorsResult!.compareTo(a.constructorsResult!));
      debugPrint("${await teamResultArray}");
      emit(state.copyWith(teamsResults: teamResultArray));
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
