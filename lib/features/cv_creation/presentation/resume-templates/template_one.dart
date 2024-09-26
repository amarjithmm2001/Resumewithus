import 'package:flutter/material.dart';

class SimpleResumeTemplate extends StatelessWidget {
  final String name;
  final String title;
  final String email;
  final String? github;
  final String disc;
  final String phone;
  final List<String>? experience;
  final List<String>? education;
  final List<String> skills;
  final List<String>? projects;

  const SimpleResumeTemplate({
    super.key,
    required this.name,
    required this.title,
    required this.email,
    required this.phone,
    required this.skills,
    required this.disc,
    this.experience,
    this.education,
    this.projects,
    this.github,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  name,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              const Divider(),
              const Text(
                'About',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(disc),
              const Divider(),
              if (experience != null && experience!.isNotEmpty) ...[
                const Text(
                  'Experience',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                for (var exp in experience!) Text(exp),
                const Divider(),
              ],
              if (education != null && education!.isNotEmpty) ...[
                const Text(
                  'Education',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                for (var edu in education!) Text(edu),
                const Divider(),
              ],
              const Text(
                'Skills',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              for (var skill in skills) Text(skill),
              if (projects != null && projects!.isNotEmpty) ...[
                const Divider(),
                const Text(
                  'Projects',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                for (var project in projects!) Text(project),
                const Divider(),
              ],
              const Text(
                'Contact',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text('Email: $email'),
              Text('Phone: $phone'),
              if (github != null && github!.isNotEmpty) Text('GitHub: $github'),
            ],
          ),
        ),
      ),
    );
  }
}
