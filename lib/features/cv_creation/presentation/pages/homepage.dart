import 'package:flutter/material.dart';
import 'package:resumewithus/core/theme/my_app_colors.dart';
import 'package:resumewithus/features/auth/presentation/widgets/appbar_widgets.dart';
import 'package:resumewithus/features/cv_creation/presentation/pages/create_resume.dart';
import 'package:resumewithus/features/cv_creation/presentation/pages/download_page.dart';
import 'package:resumewithus/features/cv_creation/presentation/pages/profile_page.dart';
import 'package:resumewithus/features/cv_creation/presentation/pages/templates_page.dart';
import 'package:resumewithus/features/cv_creation/presentation/widgets/icon_container.dart';
import 'package:resumewithus/features/cv_creation/presentation/widgets/small_button.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
          child: Column(
            children: [
              const SizedBox(
                height: 20.0,
              ),
              const Text(
                "Create a unique resume",
                style: TextStyle(
                  fontSize: 20.0,
                  color: MyAppColors.textlightmodeColor,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const Text(
                "with your phone!",
                style: TextStyle(
                  fontSize: 20.0,
                  color: MyAppColors.textlightmodeColor,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                height: 150.0,
                child: Image.asset('assets/images/main_logo.png'),
              ),
              const SizedBox(
                height: 120.0,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TemplatesPage(
                        folderPath: 'Templates',
                      ),
                    ),
                  );
                },
                child: const SmallButton(
                  buttonText: 'Templates',
                  buttonColor: MyAppColors.loginButtonColor,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CreateResumePage(),
                    ),
                  );
                },
                child: const SmallButton(
                  buttonText: 'Create your resume',
                  buttonColor: MyAppColors.signupButtonColor,
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProfilePage(),
                          ),
                        ),
                        child: const IconContainer(
                          icon: Icons.account_circle_rounded,
                        ),
                      ),
                      InkWell(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DownloadPage(),
                          ),
                        ),
                        child: const IconContainer(
                          icon: Icons.downloading_rounded,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
