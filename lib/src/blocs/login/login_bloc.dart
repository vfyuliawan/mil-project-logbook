import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:logbook_digitalization/src/services/services.dart';
import 'package:logbook_digitalization/src/utilities/utilities.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginUser>((event, emit) async {
      emit(LoginIsLoading());
      final result = await UserService()
          .loginWithEmail(email: event.email, password: event.password);
      emit(
        result.fold(
          (l) => LoginIsFailed(message: l),
          (r) {
            Commons().setUID(r.uid!);
            return LoginIsSuccess();
          },
        ),
      );
    });
  }
}
