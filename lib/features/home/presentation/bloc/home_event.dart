part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomeGetPhotosEvent extends HomeEvent {
  BuildContext context;
  HomeGetPhotosEvent({required this.context});
  @override
  List<Object> get props => [context];
}
