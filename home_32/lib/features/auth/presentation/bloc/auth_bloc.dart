import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/usecases/sign_in_with_email.dart';
import '../../domain/usecases/sign_up_with_email.dart';
import '../../domain/usecases/sign_out.dart';
import '../../domain/usecases/reset_password.dart';
import '../../domain/usecases/sign_in_with_google.dart';
import '../../domain/usecases/get_current_user.dart';
import '../../domain/repositories/auth_repository.dart';
import 'auth_event.dart';
import 'auth_state.dart';

/// Bloc для управления состоянием аутентификации
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignInWithEmail signInWithEmail;
  final SignUpWithEmail signUpWithEmail;
  final SignOut signOut;
  final ResetPassword resetPassword;
  final SignInWithGoogle signInWithGoogle;
  final GetCurrentUser getCurrentUser;
  final AuthRepository authRepository;

  StreamSubscription<UserEntity?>? _authStateSubscription;

  AuthBloc({
    required this.signInWithEmail,
    required this.signUpWithEmail,
    required this.signOut,
    required this.resetPassword,
    required this.signInWithGoogle,
    required this.getCurrentUser,
    required this.authRepository,
  }) : super(const AuthState.initial()) {
    on<AuthEvent>(_onAuthEvent);

    // Подписка на изменения состояния аутентификации
    _authStateSubscription = authRepository.authStateChanges.listen(
      (user) {
        add(AuthEvent.authStateChanged(user));
      },
    );
  }

  Future<void> _onAuthEvent(
    AuthEvent event,
    Emitter<AuthState> emit,
  ) async {
    await event.map(
      signInWithEmail: (e) async {
        emit(const AuthState.loading());
        final result = await signInWithEmail(
          email: e.email,
          password: e.password,
        );
        result.fold(
          (failure) => emit(AuthState.error(failure)),
          (user) => emit(AuthState.authenticated(user)),
        );
      },
      signUpWithEmail: (e) async {
        emit(const AuthState.loading());
        final result = await signUpWithEmail(
          email: e.email,
          password: e.password,
        );
        result.fold(
          (failure) => emit(AuthState.error(failure)),
          (user) => emit(AuthState.authenticated(user)),
        );
      },
      signOut: (e) async {
        emit(const AuthState.loading());
        final result = await signOut();
        result.fold(
          (failure) => emit(AuthState.error(failure)),
          (_) => emit(const AuthState.unauthenticated()),
        );
      },
      resetPassword: (e) async {
        emit(const AuthState.loading());
        final result = await resetPassword(e.email);
        result.fold(
          (failure) => emit(AuthState.error(failure)),
          (_) {
            // После успешной отправки письма возвращаемся к предыдущему состоянию
            // или к unauthenticated
            emit(const AuthState.unauthenticated());
          },
        );
      },
      signInWithGoogle: (e) async {
        emit(const AuthState.loading());
        final result = await signInWithGoogle();
        result.fold(
          (failure) => emit(AuthState.error(failure)),
          (user) => emit(AuthState.authenticated(user)),
        );
      },
      checkAuthStatus: (e) async {
        emit(const AuthState.loading());
        final result = await getCurrentUser();
        result.fold(
          (failure) => emit(const AuthState.unauthenticated()),
          (user) {
            if (user != null) {
              emit(AuthState.authenticated(user));
            } else {
              emit(const AuthState.unauthenticated());
            }
          },
        );
      },
      authStateChanged: (e) {
        if (e.user != null) {
          emit(AuthState.authenticated(e.user!));
        } else {
          emit(const AuthState.unauthenticated());
        }
      },
    );
  }

  @override
  Future<void> close() {
    _authStateSubscription?.cancel();
    return super.close();
  }
}
