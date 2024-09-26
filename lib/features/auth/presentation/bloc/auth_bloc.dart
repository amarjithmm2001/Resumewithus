// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:resumewithus/features/auth/domain/entity/user.dart';
// import 'package:resumewithus/features/auth/domain/usecases/siginup_usecase.dart';
// import 'package:resumewithus/features/auth/domain/usecases/signin_usecase.dart';
// part 'auth_event.dart';
// part 'auth_state.dart';

// class AuthBloc extends Bloc<AuthEvent, AuthState> {
//   final SignupUsecase _signupUsecase;
//   final SigninUsecase _signinUsecase;

//   AuthBloc({
//     required SignupUsecase signupUsecase,
//     required SigninUsecase signinUsecase,
//   })  : _signupUsecase = signupUsecase,
//         _signinUsecase = signinUsecase,
//         super(AuthInitial()) {
//     on<AuthSignUp>(_onAuthSignUp);
//     on<AuthSignIn>(_onAuthSignIn);
//   }

//   Future<void> _onAuthSignUp(AuthSignUp event, Emitter<AuthState> emit) async {
//     emit(AuthLoading());
//     final resp = await _signupUsecase(
//       UserSignUpParameters(
//         name: event.name,
//         email: event.email,
//         password: event.password,
//       ),
//     );
//     resp.fold(
//       (l) => emit(AuthFailure(l.message)),
//       (r) => emit(AuthSuccess(r)),
//     );
//   }

//   Future<void> _onAuthSignIn(AuthSignIn event, Emitter<AuthState> emit) async {
//     emit(AuthLoading());
//     final resp = await _signinUsecase(
//       UserSigInParameters(
//         email: event.email,
//         password: event.password,
//       ),
//     );
//     resp.fold(
//       (l) => emit(AuthFailure(l.message)),
//       (r) => emit(AuthSuccess(r)),
//     );
//   }
// }
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resumewithus/features/auth/domain/entity/user.dart';
import 'package:resumewithus/features/auth/domain/usecases/siginup_usecase.dart';
import 'package:resumewithus/features/auth/domain/usecases/signin_usecase.dart';
import 'package:resumewithus/features/auth/domain/repository/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignupUsecase _signupUsecase;
  final SigninUsecase _signinUsecase;
  final AuthRepository _authRepository;
  late final StreamSubscription<User?> _authStateSubscription;

  AuthBloc({
    required SignupUsecase signupUsecase,
    required SigninUsecase signinUsecase,
    required AuthRepository authRepository,
  })  : _signupUsecase = signupUsecase,
        _signinUsecase = signinUsecase,
        _authRepository = authRepository,
        super(AuthInitial()) {
    on<AuthSignUp>(_onAuthSignUp);
    on<AuthSignIn>(_onAuthSignIn);
    on<AuthStateChanged>(_onAuthStateChanged);

    _authStateSubscription = _authRepository.authStateChanges.listen((user) {
      if (user != null) {
        add(AuthStateChanged());
      } else {
        add(AuthSignOut());
      }
    });
  }

  Future<void> _onAuthSignUp(AuthSignUp event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final resp = await _signupUsecase(
      UserSignUpParameters(
        name: event.name,
        email: event.email,
        password: event.password,
      ),
    );
    resp.fold(
      (l) => emit(AuthFailure(l.message)),
      (r) => emit(AuthSuccess(r)),
    );
  }

  Future<void> _onAuthSignIn(AuthSignIn event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final resp = await _signinUsecase(
      UserSigInParameters(
        email: event.email,
        password: event.password,
      ),
    );
    resp.fold(
      (l) => emit(AuthFailure(l.message)),
      (r) => emit(AuthSuccess(r)),
    );
  }

  Future<void> _onAuthStateChanged(
      AuthStateChanged event, Emitter<AuthState> emit) async {
    final currentUser = await _authRepository.authStateChanges.first;
    if (currentUser != null) {
      emit(AuthSuccess(currentUser));
    } else {
      emit(Unauthenticated()); // Emit Unauthenticated state if there is no user
    }
  }

  @override
  Future<void> close() {
    _authStateSubscription
        .cancel(); // Properly cancel the subscription when the bloc is closed
    return super.close();
  }
}
