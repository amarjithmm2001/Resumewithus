import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resumewithus/features/auth/data/remote_data_source/auth_firebase_datasource.dart';
import 'package:resumewithus/features/auth/data/repository/auth_repository_impl.dart';
import 'package:resumewithus/features/auth/domain/usecases/siginup_usecase.dart';
import 'package:resumewithus/features/auth/domain/usecases/signin_usecase.dart';
import 'package:resumewithus/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:resumewithus/features/auth/presentation/pages/login_page.dart';
import 'package:resumewithus/features/cv_creation/data/remote_data_source/firebase_data_source.dart';
import 'package:resumewithus/features/cv_creation/data/repository/templates_repository_impl.dart';
import 'package:resumewithus/features/cv_creation/domain/usecase/template_usecase.dart';
import 'package:resumewithus/features/cv_creation/presentation/bloc/templates_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final firebaseAuth = FirebaseAuth.instance;
  final firebaseFirestore = FirebaseFirestore.instance;
  final authFirebaseDatasource = AuthFirebaseDatasourceImpl(
    firebaseAuth,
    firebaseFirestore,
  );
  final authRepository = AuthRepositoryImpl(authFirebaseDatasource);
  final signupUsecase = SignupUsecase(authRepository);
  final signinUsecase = SigninUsecase(authRepository);
  final templateRepository = TemplateRepositoryImpl(
    FirebaseTemplateDataSource(FirebaseStorage.instance),
  );
  final fetchTemplates = FetchTemplates(templateRepository);
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (_) => AuthBloc(
          signupUsecase: signupUsecase,
          signinUsecase: signinUsecase,
          authRepository: authRepository,
        ),
      ),
      BlocProvider(
        create: (_) => TemplatesBloc(fetchTemplates),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Resumewithus!',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}
