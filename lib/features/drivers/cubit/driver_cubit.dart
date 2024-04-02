import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:formula_one_calendar/models/driver.dart';
import 'package:formula_one_calendar/shared_export.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'driver_state.dart';

part 'driver_cubit.freezed.dart';

class DriverCubit extends Cubit<DriverState> {
  DriverCubit() : super(const DriverState.initial());

  Future<void> getDriver(String driverID) async {
    try {
      final driver = await driverRepository.fetchDriver(driverID);
      emit(state.copyWith(driver: driver));
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
