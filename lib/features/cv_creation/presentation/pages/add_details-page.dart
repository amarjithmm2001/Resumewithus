import 'package:flutter/material.dart';
import 'package:resumewithus/features/auth/presentation/widgets/my_text_field.dart';
import 'package:resumewithus/features/auth/presentation/widgets/signup_login_button.dart';
import 'package:resumewithus/features/cv_creation/presentation/resume-templates/template.two.dart';
import 'package:resumewithus/features/cv_creation/presentation/resume-templates/template_five.dart';
import 'package:resumewithus/features/cv_creation/presentation/resume-templates/template_four.dart';
import 'package:resumewithus/features/cv_creation/presentation/resume-templates/template_one.dart';
import 'package:resumewithus/features/cv_creation/presentation/resume-templates/template_seven.dart';
import 'package:resumewithus/features/cv_creation/presentation/resume-templates/template_six.dart';
import 'package:resumewithus/features/cv_creation/presentation/resume-templates/template_three.dart';
import 'package:resumewithus/features/cv_creation/presentation/widgets/custom_multi_textfield.dart';
import 'package:resumewithus/features/cv_creation/presentation/widgets/special_appbar.dart';
import 'package:resumewithus/features/cv_creation/utils/list_of_templates.dart';
import 'package:resumewithus/features/cv_creation/utils/pdf_convert.dart';

class AddDetailspage extends StatefulWidget {
  final TemplateData data;

  const AddDetailspage({super.key, required this.data});

  @override
  State<AddDetailspage> createState() => _AddDetailspageState();
}

class _AddDetailspageState extends State<AddDetailspage> {
  late final TextEditingController nameController;
  late final TextEditingController titleController;
  late final TextEditingController emailController;
  late final TextEditingController phoneController;
  late final TextEditingController skillController;
  late final TextEditingController disController;
  late final TextEditingController projectController;
  late final TextEditingController educationController;
  late final TextEditingController experienceController;
  late final TextEditingController githubController;
  final fomKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.data.name);
    titleController = TextEditingController(text: widget.data.title);
    emailController = TextEditingController(text: widget.data.email);
    phoneController = TextEditingController(text: widget.data.phone);
    skillController =
        TextEditingController(text: widget.data.skills.join(', '));
    disController = TextEditingController(text: widget.data.disc);
    projectController = TextEditingController();
    educationController = TextEditingController();
    experienceController = TextEditingController();
    githubController = TextEditingController();
  }

  void _updateTemplate() {
    final updatedTemplate = widget.data.template;
    Widget newTemplate;
    final githubValue =
        githubController.text.isNotEmpty ? githubController.text : null;

    if (updatedTemplate is ClassicElegantResume) {
      newTemplate = ClassicElegantResume(
        name: nameController.text,
        title: titleController.text,
        email: emailController.text,
        phone: phoneController.text,
        experience: experienceController.text.isEmpty
            ? []
            : [experienceController.text],
        education:
            educationController.text.isEmpty ? [] : [educationController.text],
        projects:
            projectController.text.isEmpty ? [] : [projectController.text],
        github: githubValue,
        skills: skillController.text.split(', '),
        disc: disController.text,
      );
    } else if (updatedTemplate is CreativeResumeTemplate) {
      newTemplate = CreativeResumeTemplate(
        name: nameController.text,
        title: titleController.text,
        email: emailController.text,
        phone: phoneController.text,
        skills: skillController.text.split(', '),
        disc: disController.text,
        experience: experienceController.text.isEmpty
            ? []
            : [experienceController.text],
        education:
            educationController.text.isEmpty ? [] : [educationController.text],
        projects:
            projectController.text.isEmpty ? [] : [projectController.text],
        github: githubValue,
      );
    } else if (updatedTemplate is InfographicResume) {
      newTemplate = InfographicResume(
        name: nameController.text,
        title: titleController.text,
        email: emailController.text,
        phone: phoneController.text,
        skills: skillController.text.split(', '),
        disc: disController.text,
        experience: experienceController.text.isEmpty
            ? []
            : [experienceController.text],
        education:
            educationController.text.isEmpty ? [] : [educationController.text],
        projects:
            projectController.text.isEmpty ? [] : [projectController.text],
        github: githubValue,
      );
    } else if (updatedTemplate is MinimalistResume) {
      newTemplate = MinimalistResume(
        name: nameController.text,
        title: titleController.text,
        email: emailController.text,
        phone: phoneController.text,
        skills: skillController.text.split(', '),
        disc: disController.text,
        experience: experienceController.text.isEmpty
            ? []
            : [experienceController.text],
        education:
            educationController.text.isEmpty ? [] : [educationController.text],
        projects:
            projectController.text.isEmpty ? [] : [projectController.text],
        github: githubValue,
      );
    } else if (updatedTemplate is ModernResumeTemplate) {
      newTemplate = ModernResumeTemplate(
        name: nameController.text,
        title: titleController.text,
        email: emailController.text,
        phone: phoneController.text,
        skills: skillController.text.split(', '),
        disc: disController.text,
        experience: experienceController.text.isEmpty
            ? []
            : [experienceController.text],
        education:
            educationController.text.isEmpty ? [] : [educationController.text],
        projects:
            projectController.text.isEmpty ? [] : [projectController.text],
        github: githubValue,
      );
    } else if (updatedTemplate is ModernSplitResume) {
      newTemplate = ModernSplitResume(
        name: nameController.text,
        title: titleController.text,
        email: emailController.text,
        phone: phoneController.text,
        skills: skillController.text.split(', '),
        disc: disController.text,
        experience: experienceController.text.isEmpty
            ? []
            : [experienceController.text],
        education:
            educationController.text.isEmpty ? [] : [educationController.text],
        projects:
            projectController.text.isEmpty ? [] : [projectController.text],
        github: githubValue,
      );
    } else if (updatedTemplate is SimpleResumeTemplate) {
      newTemplate = SimpleResumeTemplate(
        name: nameController.text,
        title: titleController.text,
        email: emailController.text,
        phone: phoneController.text,
        skills: skillController.text.split(', '),
        disc: disController.text,
        experience: experienceController.text.isEmpty
            ? []
            : [experienceController.text],
        education:
            educationController.text.isEmpty ? [] : [educationController.text],
        projects:
            projectController.text.isEmpty ? [] : [projectController.text],
        github: githubValue,
      );
    } else {
      newTemplate = updatedTemplate;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: InkWell(
                  onTap: () {
                    generateAndOpenPdf();
                  },
                  child: Container(
                    height: 30.0,
                    width: 120.0,
                    color: Colors.blue,
                    child: const Center(child: Text("Convert to pdf")),
                  ),
                ),
              )
            ],
          ),
          body: newTemplate,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: specialappbar(appbarName: "Fill your Information"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Form(
            key: fomKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Name"),
                const SizedBox(height: 5.0),
                MyTextField(
                    hinttext: "Name (eg; Lilly)", controller: nameController),
                const SizedBox(height: 10.0),
                const Text("Job title (eg; flutter Developer)"),
                const SizedBox(height: 5.0),
                MyTextField(hinttext: "Title", controller: titleController),
                const SizedBox(height: 10.0),
                const Text("Email"),
                const SizedBox(height: 5.0),
                MyTextField(
                    hinttext: "Email (eg; example@gmail.com)",
                    controller: emailController),
                const SizedBox(height: 10.0),
                const Text("Mobile Number"),
                const SizedBox(height: 5.0),
                MyTextField(
                    hinttext: "Phone (eg; 123456789)",
                    controller: phoneController),
                const SizedBox(height: 10.0),
                const Text("About yourself"),
                const SizedBox(height: 5.0),
                CustomMultilineTextField(
                  hintText: 'Description (eg; i am Lilly...........)',
                  controller: disController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "You forgot to add Description";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10.0),
                const Text("Your Skills"),
                const SizedBox(height: 5.0),
                MyTextField(
                    hinttext: "Skills (eg; Flutter,java,hitm,css)",
                    controller: skillController),
                const SizedBox(height: 10.0),
                const Text("Projects (optional)"),
                const SizedBox(height: 5.0),
                CustomMultilineTextField(
                  hintText: 'Projects  (eg; project 1)',
                  controller: projectController,
                ),
                const SizedBox(height: 20.0),
                const Text("Experience (optional)"),
                const SizedBox(height: 5.0),
                CustomMultilineTextField(
                  hintText: 'Experience (eg; company name  - year)',
                  controller: experienceController,
                ),
                const SizedBox(height: 20.0),
                const Text("Github (optional)"),
                const SizedBox(height: 5.0),
                CustomMultilineTextField(
                  hintText: 'Github (eg; Lilly)123',
                  controller: githubController,
                  maxLines: 1,
                ),
                const SizedBox(height: 20.0),
                const Text("Education (optional)"),
                const SizedBox(height: 5.0),
                CustomMultilineTextField(
                  hintText: 'Education (eg; schoolname - course - year)',
                  controller: educationController,
                ),
                const SizedBox(height: 20.0),
                InkWell(
                  onTap: () {
                    if (fomKey.currentState?.validate() ?? false) {
                      _updateTemplate();
                    }
                  },
                  child: const SignupLoginButton(
                    buttonText: "Submit",
                    buttonColor: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
