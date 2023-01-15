part of 'temp_record_bloc.dart';

@immutable
abstract class TempRecordState {}

class TempRecordInitial extends TempRecordState {}

class TempRecordIsLoading extends TempRecordState {}

class TempRecordIsSuccess extends TempRecordState {
  final String message;
  TempRecordIsSuccess({
    required this.message,
  });
}

class TempRecordIsFailed extends TempRecordState {
  final String message;
  TempRecordIsFailed({
    required this.message,
  });
}
