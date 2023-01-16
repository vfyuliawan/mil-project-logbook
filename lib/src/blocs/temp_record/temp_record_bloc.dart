import 'package:bloc/bloc.dart';
import 'package:logbook_digitalization/src/utilities/utilities.dart';
import 'package:meta/meta.dart';

import '../../models/models.dart';
import '../../services/services.dart';

part 'temp_record_event.dart';
part 'temp_record_state.dart';

class TempRecordBloc extends Bloc<AddTempProduct, TempRecordState> {
  TempRecordBloc() : super(TempRecordInitial()) {
    on<AddTempProduct>((event, emit) async {
      emit(TempRecordIsLoading());
      TempRecordingModel data = TempRecordingModel(
        status: "Waiting Approval",
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        uid: await Commons().getUID(),
        dateTime: DateTime.now(),
        temp: event.temp,
        idNumber: event.idNumber,
        note: event.note,
      );

      final result = await TempRecordService().addNewTempRecord(data);

      result.fold(
        (l) => emit(
          TempRecordIsFailed(message: l),
        ),
        (r) => emit(
          TempRecordIsSuccess(message: r),
        ),
      ); // TODO: implement event handler
    });
  }
}
