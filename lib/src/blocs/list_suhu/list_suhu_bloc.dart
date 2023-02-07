import 'package:bloc/bloc.dart';
import 'package:logbook_digitalization/src/services/services.dart';
import 'package:meta/meta.dart';

import '../../models/models.dart';

part 'list_suhu_event.dart';
part 'list_suhu_state.dart';

class ListSuhuBloc extends Bloc<ListSuhuEvent, ListSuhuState> {
  ListSuhuBloc() : super(ListSuhuInitial()) {
    on<FetchListSuhu>((event, emit) async {
      // TODO: implement event handler
      emit(ListSuhuIsLoading());
      final result = await TemperatureService().fetchListSuhu();
      emit(
        result.fold(
          (l) => ListSuhuIsFailed(message: l),
          (r) => ListSuhuIsSuccess(data: r),
        ),
      );
    });
  }
}
