// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'list_suhu_bloc.dart';

@immutable
abstract class ListSuhuState {}

class ListSuhuInitial extends ListSuhuState {}

class ListSuhuIsLoading extends ListSuhuState {}

class ListSuhuIsSuccess extends ListSuhuState {
  List<TempRecordingModel> data;
  ListSuhuIsSuccess({
    required this.data,
  });
}

class ListSuhuIsFailed extends ListSuhuState {
  final String message;
  ListSuhuIsFailed({
    required this.message,
  });
}
