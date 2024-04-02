part of 'constructor_cubit.dart';

@freezed
class ConstructorState with _$ConstructorState {
  const factory ConstructorState.initial({
    List<Constructors>? constructors,
  }) = _Initial;
}
