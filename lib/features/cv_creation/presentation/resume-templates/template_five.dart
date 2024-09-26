import 'package:flutter/material.dart';

class ModernSplitResume extends StatelessWidget {
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

  const ModernSplitResume({
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
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left Side
          Expanded(
            flex: 4,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'About Me',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(disc),
                  const SizedBox(height: 20),
                  if (experience != null && experience!.isNotEmpty)
                    Text(
                      'Experience',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  if (experience != null)
                    ...experience!.map((exp) => Text(exp)).toList(),
                  const SizedBox(height: 20),
                  if (education != null && education!.isNotEmpty)
                    Text(
                      'Education',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  if (education != null)
                    ...education!.map((edu) => Text(edu)).toList(),
                  const SizedBox(height: 20),
                  Text(
                    'Skills',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ...skills.map((skill) => Text(skill)).toList(),
                ],
              ),
            ),
          ),
          const VerticalDivider(),
          // Right Side
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (projects != null && projects!.isNotEmpty)
                  Text(
                    'Projects',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                if (projects != null)
                  ...projects!.map((project) => Text(project)).toList(),
                const SizedBox(height: 20),
                Text(
                  'Contact',
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Email: $email'),
                Text('Phone: $phone'),
                if (github != null && github!.isNotEmpty)
                  Text('GitHub: $github'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
