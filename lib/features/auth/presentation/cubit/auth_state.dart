import 'package:chat/core/constants/enums/auth_enum.dart';
import 'package:chat/core/constants/enums/request_enum.dart';
import 'package:equatable/equatable.dart';

// AuthState'in temel sınıfı
class AuthState extends Equatable {
  final AuthPageState pageState;
  final String message;
  final RequestState requestState;
  const AuthState(
      {required this.pageState,
      required this.message,
      required this.requestState});
  AuthState copyWith({
    AuthPageState? pageState,
    String? message,
    RequestState? requestState,
  }) {
    return AuthState(
        pageState: pageState ?? this.pageState,
        message: message ?? this.message,
        requestState: requestState ?? this.requestState);
  }

  @override
  List<Object?> get props => [
        pageState,
        message,
        requestState,
      ];
}
