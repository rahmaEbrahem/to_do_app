part of 'addtask_cubit.dart';

@immutable
sealed class AddtaskState {}

final class AddtaskInitial extends AddtaskState {}

final class Addtasksuccess extends AddtaskState {}

final class Addtaskloading extends AddtaskState {}

final class Addtaskerror extends AddtaskState {}
