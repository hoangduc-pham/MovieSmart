import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

// Sự kiện (Events)
abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginButtonPressed extends LoginEvent {
  final String username;
  final String password;

  const LoginButtonPressed({
    required this.username,
    required this.password,
  });

  @override
  List<Object> get props => [username, password];
}

// Trạng thái (States)
abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginFailure extends LoginState {
  final String error;

  const LoginFailure({required this.error});

  @override
  List<Object> get props => [error];
}

// BLoC
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial());
  bool _isObscure = true;
  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();

      try {
        // Gọi hàm đăng nhập ở đây, ví dụ: loginUser(event.username, event.password)
        // Nếu đăng nhập thành công, emit LoginSuccess state
        // Nếu đăng nhập thất bại, emit LoginFailure state
      } catch (error) {
        yield LoginFailure(error: error.toString());
      }
    }
  }
}
