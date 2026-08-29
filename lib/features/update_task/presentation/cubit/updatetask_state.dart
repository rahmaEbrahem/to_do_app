part of 'updatetask_cubit.dart';

@immutable
sealed class UpdateTaskState {}

final class UpdateTaskInitial extends UpdateTaskState {}

final class UpdateTaskLoading extends UpdateTaskState {}

final class UpdateTaskSuccess extends UpdateTaskState {}

final class UpdateTaskError extends UpdateTaskState {}
