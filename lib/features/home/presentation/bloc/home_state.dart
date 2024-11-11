part of 'home_bloc.dart';

class HomeState {
  ConditionStateEnum? conditionStateEnum;
  String? errorMessage;

  HomeState({this.conditionStateEnum, this.errorMessage});

  HomeState copyWith(
          {ConditionStateEnum? conditionStateEnum, String? errorMessage}) =>
      HomeState(
        conditionStateEnum: conditionStateEnum ?? this.conditionStateEnum,
        errorMessage: errorMessage ?? this.errorMessage,
      );

  List<Object?> get props => [
        conditionStateEnum,
        errorMessage,
      ];
}
