// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'models.dart';

class BaseResponseModel {
  final dynamic data;
  final String message;
  BaseResponseModel({
    required this.data,
    required this.message,
  });
}
