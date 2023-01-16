part of 'temp_record_bloc.dart';

@immutable
abstract class TempRecordEvent {}

class AddTempProduct extends TempRecordEvent {
  final String? idNumber;
  final String? note;
  final String? uid;
  final double? temp;
  final String? status;

  AddTempProduct({
    this.idNumber,
    this.note,
    this.uid,
    this.temp,
    this.status,
  });
}
