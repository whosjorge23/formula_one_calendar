import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_screen_shell_cubit.freezed.dart';

part 'home_screen_shell_state.dart';

class HomeScreenShellCubit extends Cubit<HomeScreenShellState> {
  HomeScreenShellCubit() : super(const HomeScreenShellState.initial());

  void updateIndex(int index) {
    emit(
      state.copyWith(
        selectedIndex: index,
      ),
    );
  }
}
