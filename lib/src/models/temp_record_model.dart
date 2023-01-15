// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'models.dart';

class TempRecordingModel {
  final String? id;
  final DateTime? dateTime;
  final String? idNumber;
  final String? note;
  final String? uid;
  final double? temp;
  TempRecordingModel({
    this.id,
    this.dateTime,
    this.idNumber,
    this.note,
    this.uid,
    this.temp,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'dateTime': dateTime?.millisecondsSinceEpoch,
      'idNumber': idNumber,
      'note': note,
      'uid': uid,
      'temp': temp,
    };
  }

  factory TempRecordingModel.fromMap(Map<String, dynamic> map) {
    return TempRecordingModel(
      id: map['id'] != null ? map['id'] as String : null,
      dateTime: map['dateTime'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['dateTime'] as int)
          : null,
      idNumber: map['idNumber'] != null ? map['idNumber'] as String : null,
      note: map['note'] != null ? map['note'] as String : null,
      uid: map['uid'] != null ? map['uid'] as String : null,
      temp: map['temp'] != null ? map['temp'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TempRecordingModel.fromJson(String source) =>
      TempRecordingModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
