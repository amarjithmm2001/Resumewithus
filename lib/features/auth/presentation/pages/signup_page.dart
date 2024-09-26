import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resumewithus/core/common/widgets/loader.dart';
import 'package:resumewithus/core/theme/my_app_colors.dart';
import 'package:resumewithus/core/utils/widgets/shackbar.dart';
import 'package:resumewithus/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:resumewithus/features/auth/presentation/widgets/my_text_field.dart';
import 'package:resumewithus/features/auth/presentation/widgets/signup_login_button.dart';
import 'package:resumewithus/features/cv_creation/presentation/pages/homepage.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final globelKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthFailure) {
          showSnackBar(context, state.message);
        }
        if (state is AuthSuccess) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const Homepage()),
            (route) => false,
          );
        }
      },
      builder: (context, state) {
        if (state is AuthLoading) {
          return const Loader();
        }
        return Scaffold(
          appBar: AppBar(),
          body: SingleChildScrollView(
            child: Form(
              key: globelKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    const Text(
                      "Create an account to",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: MyAppColors.textlightmodeColor,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const Text(
                      "build your resume!",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: MyAppColors.textlightmodeColor,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(
                      height: 35.0,
                    ),
                    SizedBox(
                      height: 150.0,
                      child: Image.asset('assets/images/main_logo.png'),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    MyTextField(
                      hinttext: "Name",
                      controller: nameController,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    MyTextField(
                      hinttext: "Email",
                      controller: emailController,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    MyTextField(
                      hinttext: "Password",
                      controller: passwordController,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    InkWell(
                      onTap: () {
                        if (globelKey.currentState!.validate()) {
                          context.read<AuthBloc>().add(
                                AuthSignUp(
                                  name: nameController.text.trim(),
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim(),
                                ),
                              );
                        }
                      },
                      child: const SignupLoginButton(
                        buttonText: "Signup",
                        buttonColor: MyAppColors.signupButtonColor,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
