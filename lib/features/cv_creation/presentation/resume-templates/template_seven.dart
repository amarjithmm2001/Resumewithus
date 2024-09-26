import 'package:flutter/material.dart';

class MinimalistResume extends StatelessWidget {
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

  const MinimalistResume({
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
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            Center(
              child: Column(
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 22,
                      fontStyle: FontStyle.italic,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            // About Section
            _buildSection(
              title: 'About',
              content: disc,
            ),
            const SizedBox(height: 20),
            // Experience Section
            if (experience != null && experience!.isNotEmpty)
              _buildSection(
                title: 'Experience',
                content: experience!.join('\n'),
              ),
            const SizedBox(height: 20),
            // Education Section
            if (education != null && education!.isNotEmpty)
              _buildSection(
                title: 'Education',
                content: education!.join('\n'),
              ),
            const SizedBox(height: 20),
            // Skills Section
            _buildSection(
              title: 'Skills',
              content: skills.join('\n'),
            ),
            const SizedBox(height: 20),
            // Projects Section
            if (projects != null && projects!.isNotEmpty)
              _buildSection(
                title: 'Projects',
                content: projects!.join('\n'),
              ),
            const SizedBox(height: 20),
            // Contact Section
            _buildSection(
              title: 'Contact',
              content: [
                'Email: $email',
                'Phone: $phone',
                if (github != null && github!.isNotEmpty) 'GitHub: $github',
              ].join('\n'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required String content,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          content,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}
