part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final Homemodel homeModel;

  HomeSuccess({required this.homeModel});
}

class HomeError extends HomeState {}
